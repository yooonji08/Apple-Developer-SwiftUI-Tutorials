//
//  CaptionedPhoto.swift
//  CaptionedPhoto
//
//  Created by 이윤지 on 1/19/24.
//

import SwiftUI

struct CaptionedPhoto: View {
    let assetName: String // 이미지 이름
    let captionText: String // 캡션 텍스트
    
    var body: some View {
        Image(assetName)
            // 사용 가능한 공간에 맞게 이미지 크기 조정
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                // 텍스트와 텍스트의 배경을 커스텀한 값 불러오기
                // overlay의 안에 caption을 불러왔으므로, 이미지 앞에 해당 값이 보여지게 됨
                Caption(text: captionText)
            }
            // 이미지의 모서리를 둥글게
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            // 사진의 가장자리에 여백 추가
            .padding()
    }
}

// struct: 값 타입, 값 자체를 복사하는 것이므로 다른 변수에 영향x, ex. 안드로이드의 data class
struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            // 텍스트와 배경 박스 사이에 여백 추가
            .padding()
            // 텍스트의 뒤쪽에 투명도가 있는 배경 넣기
            // 다크모드, 라이트모드에 관계없이(TextContrast) 투명도 배경 적용
            .background(Color("TextContrast").opacity(0.75),
                        in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            // 텍스트, 배경이 함께 있는 뷰 외부에(하단에) 여백 추가
            .padding()
    }
}

// preview 커스텀하여 보여주기
struct Captionedphoto_Previews: PreviewProvider {
    static let landscapeName = "Landscape"
    static let landscapeCaption = "This photo is wider than it is tall."
    static let portraitName = "Portrait"
    static let portraitCaption = "This photo is taller than it is wide."
    static var previews: some View {
        // preview를 여러개 만들기도 가능
        CaptionedPhoto(assetName: portraitName,
                       captionText: portraitCaption)
        CaptionedPhoto(assetName: landscapeName,
                       captionText: landscapeCaption)
        .preferredColorScheme(.dark)
        CaptionedPhoto(assetName: landscapeName,
                       captionText: landscapeCaption)
        .preferredColorScheme(.light)
    }
}
