//
//  DataModel.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import Foundation

// 사진 데이터 로드 및 저장
class DataModel: ObservableObject {
    @Published var items: [Item] = [] // 변경사항을 업데이트하여 저장
    
    // 초기화
    // 디렉토리에서 추가한 이미지를 검색하여 url을 배열에 저장
    init() {
        if let documentDirectory = FileManager.default.documentDirectory {
            let urls = FileManager.default.getContentsOfDirectory(documentDirectory).filter { $0.isImage }
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
        
        // 모든 이미지 url 로드
        // 프로젝트에 포함된 이미지 디렉터리
        if let urls = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil) {
            for url in urls {
                let item = Item(url: url)
                items.append(item)
            }
        }
    }
    
    // 이미지 추가
    func addItem(_ item: Item) {
        items.insert(item, at: 0)
    }
    
    // 이미지 삭제
    func removeItem(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            // 로컬 저장소에서도 로드 안 되도록 삭제
            FileManager.default.removeItemFromDocumentDirectory(url: item.url)
        }
    }
}

extension URL {
    var isImage: Bool {
        let imageExtensions = ["jpg", "jpeg", "png", "gif", "heic"]
        return imageExtensions.contains(self.pathExtension)
    }
}
