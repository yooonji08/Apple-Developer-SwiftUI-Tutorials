//
//  BadgeBackground.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/8/24.
//

import SwiftUI

// 육각형 모양을 뷰로 그리기
struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            // 100 x 100 픽셀로 가정
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0 // 모양 크기 조정 값
                width *= xScale
                
                // 픽셀 안에서 커서를 움직여서 모양 그리기
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )

                // 단일 점 정보를 가져와서 이전 정보를 참고하여 계속 그림
                // addLine으로 새 지점의 점을 연속 호출
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )

                    // 육각형의 모서리에 곡선 그리기
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            // 그라이데이션 만들기
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        // 그라이데이션을 중앙에서부터 시작하도록 위치 조정
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

#Preview {
    BadgeBackground()
}
