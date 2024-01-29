//
//  FavoritesView.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

// 좋아하는 취미, 음식, 색상 정보를 보여주는 화면
struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                // ForEach: 뷰 아이템을 반복해서 출력할 수 있게 함
                // -> 각 hobby의 요소에 id를 부여해야 함
                // -> id: 각 아이템에 접근 가능
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 80)
                }
                .padding()
            }
            .padding()
            
            Text("Foods")
                .font(.title2)
            
            HStack(spacing: 40) {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            }
            .padding()
            
            Text("Favorite Colors")
                .font(.title2)
            
            HStack(spacing: 20) {
                ForEach(information.colors, id: \.self) { color in
                    color
                        .frame(height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding()
        }
    }
}

#Preview {
    FavoritesView()
}
