//
//  EventTile.swift
//  EventTile
//
//  Created by 이윤지 on 1/19/24.
//

import SwiftUI

// 값 타입 구조체 만들기
// 개별 값으로 인식 -> 앱 전역적으로 값 변경x
struct Event {
    let title: String
    let date: Date
    let location: String
    let symbol: String
}

struct EventTile: View {
    let event: Event // event 구조체에 있는 모든 데이터 접근 가능한 객체 선언(객체 인스턴스)
    let stripeHeight = 10.0 // 각 뷰에 지정할 높이 값
    
    var body: some View {
        // firstTextBaseline: HStack의 첫번째 요소의 위치에 맞춰서 두번째, 세번째 요소의 위치도 정렬되도록 함
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: event.symbol)
                .font(.title)
            // leading: VStack내의 요소들의 정렬을 왼쪽 정렬로 만들어 줌
            // 기본적인 VStack의 정렬은 center
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                // Date타입의 데이터는 원하는 format을 만들어서 지정해 줌
                Text(
                    event.date,
                    format: Date.FormatStyle()
                        .day(.defaultDigits)
                        .month(.wide)
                )
                Text(event.location)
            }
        }
        // 텍스트 박스 외부에 여백 추가
        .padding()
        // 텍스트 박스와 텍스트 박스 위쪽의 직사각형 사이의 여백 추가
        .padding(.top, stripeHeight)
        // 텍스트의 뒤편에 배경 추가하기
        .background {
            // ZStack내의 뷰를 겹쳐서 새로운 뷰를 만듦
            ZStack(alignment: .top) {
                Rectangle()
                    .opacity(0.3)
                // 최대 높이 지정
                Rectangle()
                    .frame(maxHeight: stripeHeight)
            }
            .foregroundStyle(.teal)
        }
        // 둥글 모서리 지정
        .clipShape(RoundedRectangle(cornerRadius: stripeHeight, style: .continuous))
    }
}

#Preview {
    EventTile(event: Event(
        title: "Buy Daisies",
        date: .now,
        location: "Flower Shop",
        symbol: "gift")
    )
}
