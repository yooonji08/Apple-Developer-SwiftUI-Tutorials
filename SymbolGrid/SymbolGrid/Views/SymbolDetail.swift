//
//  SymbolDetail.swift
//  SymbolGrid
//
//  Created by 이윤지 on 2/1/24.
//

import SwiftUI

// SF Symbol을 사용하여 이미지 보기 만들기
struct SymbolDetail: View {
    var symbol: Symbol
    
    var body: some View {
        VStack {
            Text(symbol.name)
                .font(.system(.largeTitle, design: .rounded))
            
            Image(systemName: symbol.name)
                .resizable()
                .scaledToFit()
                // hierarchical: 동일한 색상에 다른 opacity를 각 SF Symbol 레이어에 할당
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    SymbolDetail(symbol: Symbol(name: "tv"))
}
