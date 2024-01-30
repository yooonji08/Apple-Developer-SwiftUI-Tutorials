//
//  SFSymbolStyling.swift
//  DatePlanner
//
//  Created by 이윤지 on 1/30/24.
//

import SwiftUI

// ViewModifier: 기존의 뷰 또는 다른 ViewModifier에 적용 가능
/// -> 기존에 생성한 뷰에 추가적으로 꾸며주고 싶을 때 사용
/// -> 안드로이드의 shape와 비슷한 방식으로 사용되는 듯
struct SFSymbolStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .symbolRenderingMode(.monochrome)
    }
}

extension View {
    func sfSymbolStyling() -> some View {
        modifier(SFSymbolStyling())
    }
}
