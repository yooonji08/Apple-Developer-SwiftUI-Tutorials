//
//  SettingsDetailsView.swift
//  MyApp
//
//  Created by 이윤지 on 1/18/24.
//

import SwiftUI

struct SettingsDetailsView: View {
    let title: String
    @AppStorage("option1") private var option1 = true
    @AppStorage("option2") private var option2 = true
    
    var body: some View {
        Form {
            Section {
                Toggle("Enable option 1", isOn: $option1)
                    .toggleStyle(.automatic)
                Toggle("Enable option 2", isOn: $option2)
                    .toggleStyle(.automatic)
            }
        }
        .navigationTitle(title)
    }
}
