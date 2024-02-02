//
//  FileManagerExtensions.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import Foundation

extension FileManager {
    
    // 디렉토리에 저장되어 있는 url 가져오기
    var documentDirectory: URL? {
        return self.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    // 디렉토리에 저장되어있는 특정 이미지 파일의 url을 복사
    // sourceURL: 복사할 파일의 url
    // 반환 URL: 디렉토리에 저장되어 있는 파일의 url 반환 or 복사 실패
    func copyItemToDocumentDirectory(from sourceURL: URL) -> URL? {
        guard let documentDirectory = documentDirectory else { return nil }
        let fileName = sourceURL.lastPathComponent
        let destinationURL = documentDirectory.appendingPathComponent(fileName)
        if self.fileExists(atPath: destinationURL.path) {
            return destinationURL
        } else {
            do {
                try self.copyItem(at: sourceURL, to: destinationURL)
                return destinationURL
            } catch let error {
                print("Unable to copy file: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    // 특정 이미지 파일의 url을 디렉토리에서 삭제
    // 반환 url: 삭제할 파일의 url
    func removeItemFromDocumentDirectory(url: URL) {
        guard let documentDirectory = documentDirectory else { return }
        let fileName = url.lastPathComponent
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        if self.fileExists(atPath: fileUrl.path) {
            do {
                try self.removeItem(at: url)
            } catch let error {
                print("Unable to remove file: \(error.localizedDescription)")
            }
        }
    }
    
    // 특정 디렉토리에 있는 url들을 반환
    func getContentsOfDirectory(_ url: URL) -> [URL] {
        var isDirectory: ObjCBool = false
        
        guard FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory), isDirectory.boolValue else { return [] }
        do {
            return try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
        } catch let error {
            print("Unable to get directory contents: \(error.localizedDescription)")
        }
        return []
    }
}
