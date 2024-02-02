//
//  PhotoPicker.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI
import PhotosUI

// 갤러리에서 사진을 고를 수 있음
struct PhotoPicker: UIViewControllerRepresentable {
    @EnvironmentObject var dataModel: DataModel
    
    // 취소 버튼을 누른 경우
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PhotoPicker>) -> PHPickerViewController {
        
        // 사진 설정
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = .images // 이미지만 선택하도록 설정
        configuration.preferredAssetRepresentationMode = .current // 가능하다면 transcoding 피하기
        
        let photoPickerViewController = PHPickerViewController(configuration: configuration)
        photoPickerViewController.delegate = context.coordinator
        return photoPickerViewController
    }
    
    // 이미지 통신 코디네이터
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
    }
    
    // picker 업데이트
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
        // update x
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    let parent: PhotoPicker
    
    // 사진이 하나 혹은 여러 개가 선택됐을 때 또는 사진 선택이 취소됐을 때 호출
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        // 현재 picker 사라지게 만들기
        self.parent.dismiss()
        
        guard
            let result = results.first,
            result.itemProvider.hasItemConformingToTypeIdentifier(UTType.image.identifier)
        else { return }
        
        // 선택한 아이템 로드
        // 임시 파일 생성 -> 파일 영구저장을 위하여 앱의 디렉토리에 복사됨
        result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
            if let error = error {
                print("Error loading file representation: \(error.localizedDescription)")
            } else if let url = url {
                if let savedUrl = FileManager.default.copyItemToDocumentDirectory(from: url) {
                    // datamodel에 새로운 사진 추가
                    Task { @MainActor [dataModel = self.parent.dataModel] in
                        withAnimation {
                            let item = Item(url: savedUrl)
                            dataModel.addItem(item)
                        }
                    }
                }
            }
        }
    }
    
    init(_ parent: PhotoPicker) {
        self.parent = parent
    }
}

