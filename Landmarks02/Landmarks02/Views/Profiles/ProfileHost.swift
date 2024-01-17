//
//  ProfileHost.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/17/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton() // edit 편집 버튼
            }
            
            // 사용자가 프로필을 편집할 때는 전역 앱 상태가 업데이트되는 것을 방지하기 위해서 편집 모드에서는 복사본에서 작동함
            // edit버튼 클릭 시 화면 전환 효과가 적용됨
            // 프로필 화면인 경우
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }
            // edit 화면인 경우
            else {
                ProfileEditor(profile: $draftProfile)
            }
        }
        .padding()
    }
}

#Preview {
    // environment(수정자)가 있어야 preview를 볼 수 있음
    ProfileHost()
        .environment(ModelData())
}
