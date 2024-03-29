//
//  BadgeSymbol.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/8/24.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        // 뷰를 동적으로 그리고, 위치 및 크기를 지정할 때 사용
        // 하드코딩 사용을 하지 않기 위함
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                // 윗 부분 그리기
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                // 수정자를 사용하여 펜 이동
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                // 아랫 부분 그리기
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
            }
            // 보라색으로 도형 채우기
            .fill(Self.symbolColor)
        }
    }
}

#Preview {
    BadgeSymbol()
}
