/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// 확장 - 타입 메서드
// 기존에 존재하는 기능을 어디서나(모든 파일에서) 사용할 수 있도록 함
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        /* 오른쪽에서 뷰가 나왔다가 오른쪽으로 사라짐
        AnyTransition.move(edge: .trailing)*/
        
        /* 뷰가 왼->오 로 이동하여 나타났다가 사라짐
        AnyTransition.slide */
        
        // 뷰가 오른쪽에서 나왔다가, 축소하면서 사라짐
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    // 버튼에 애니메이션 전환 효과 4초 적용
                    // withAnimation(.easeInOut(duration: 4)) {}
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        // 버튼을 클릭할 때, 버튼이 회전하도록 함
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        // 버튼이 회전할 때 에니메이션 적용x
                        //.animation(nil, value: showDetail)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        // 버튼을 클릭할 때 애니메이션 추가
                        //.animation(.spring(), value: showDetail)
                }
            }

            if showDetail {
                
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
