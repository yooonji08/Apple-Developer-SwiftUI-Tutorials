//
//  LoadableImage.swift
//  MemeCreator
//
//  Created by 이윤지 on 2/5/24.
//

import SwiftUI

struct LoadableImage: View {
    // 이미지 데이터
    var imageMetadata: Panda
    
    var body: some View {
        // 이미지를 비동기적으로 로드
        // 로드 실패시 다른 이미지 띄우기
        AsyncImage(url: imageMetadata.imageUrl) { phase in
            // 이미지 로드 성공한 경우
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .accessibility(hidden: false)
                    .accessibilityLabel(Text(imageMetadata.description))
            }
            // 이미지 로드 실패한 경우
            else if phase.error != nil {
                VStack {
                    Image("pandaplaceholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                    Text("The pandas were all rested.")
                        .font(.title2)
                    Text("Please try again.")
                        .font(.title3)
                }
            }
            // 이미지 로드 중 애니메이션
            else {
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadableImage(imageMetadata: Panda.defaultPanda)
}
