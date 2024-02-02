//
//  AmazingAlignment.swift
//  Journal
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI

struct AmazingAlignment: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            // infinity: 화면 가로 해상도 꽉 채우기
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            
            VStack(alignment: .trailing) {
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 10)
            }
            
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            
            // spacing을 사용하여 image간의 가로 간격 주기
            HStack(spacing: 20) {
                Spacer() // spacer를 사용하여 이미지 두개를 우측으로 보내기(trailing 효과)
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .background(Color.yellow)
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .padding(.trailing, 20) // 우측에 패딩을 추가하여 화면 간에 간격 주기
            }
            .background(Color.mint)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
        }
        .padding(.horizontal) // 화면의 좌우에 패딩 주기
        // 책장 만들기
        .frame(width: 250)
        .border(Color.black)
    }
}

#Preview {
    AmazingAlignment()
}
