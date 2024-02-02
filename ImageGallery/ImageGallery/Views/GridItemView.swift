//
//  GridItemView.swift
//  ImageGallery
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// 비동기적으로 단일 이미지 로드하기
struct GridItemView: View {
    let size: Double // 이미지의 높이, 너비값
    let item: Item
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // 비동기적으로 이미지 업로드
            // 이미지가 화면에 그려지기 전까지, 나머지 코드를 실행하도록 함
            // -> UI 로딩 지연 방지를 위함
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                // 이미지가 로드되는 동안, 로딩 애니메이션 실행
                ProgressView()
            }
            .frame(width: size, height: size)
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "mushy1", withExtension: "jpg") {
            GridItemView(size: 50, item: Item(url: url))
        }
    }
}
