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
            }
            // 이미지의 모서리륻 우글게
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            // 사진의 가장자리에 여백 추가
            .padding()
    }
}
