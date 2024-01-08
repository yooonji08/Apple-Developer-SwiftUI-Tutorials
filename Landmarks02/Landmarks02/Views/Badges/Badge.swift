//
//  Badge.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/8/24.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        // 산 모양 이미지를 복사하고 회전시켜서 8개를 추가함
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            // 산 모양 이미지 크기 조정
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        // 육각형 이미지에 맞게 사이즈 조정
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
