//
//  RotatedBadgeSymbol.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/8/24.
//

import SwiftUI

// 회전한 뱃지 모양을 캡슐화하는 뷰
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
