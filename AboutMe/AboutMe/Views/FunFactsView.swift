//
//  FunFactsView.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import SwiftUI

// 재미있는 사실 화면
struct FunFactsView: View {
    // 현재 화면에 표시되고 있는 재미있는 사실
    @State private var funFact = ""
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            // 랜덤 버튼
            Button {
                // !: nil값에 대한 처리(optional), 다음 값이 nil이 아니라는 것을 확신할 수 있을 때 사용
                funFact = information.funFacts.randomElement()!
            } label: {
                Text("Show Random Fact")
                    .foregroundStyle(Color.white)
                    .fontWeight(.bold)
                    .frame(width: 240, height: 64)
            }
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    FunFactsView()
}
