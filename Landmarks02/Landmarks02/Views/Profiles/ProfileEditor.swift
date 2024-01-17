//
//  ProfileEditor.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/17/24.
//

import SwiftUI

// 프로필 수정 화면
struct ProfileEditor: View {
    @Binding var profile: Profile
    
    // 날짜 범위
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                // binding해온 이름을 뷰에 뿌려줌
                // MARK: multilineTextAlignment는 text정렬을 지정함(center: 가운데, leading: 좌, trailing: 우)
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            // 알림 설정 토글
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            // 선호하는 계절 picker
            Picker("Seasonal Photo", selection: $profile.sesasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            // 캘린더 띄우기
            // MARK: displayedComponents가 hourAndMinute이면 날짜 picker
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date") // 라벨
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
