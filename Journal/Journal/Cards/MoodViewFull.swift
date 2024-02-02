//
//  MoodViewFull.swift
//  Journal
//
//  Created by 이윤지 on 2/2/24.
//

import SwiftUI

struct MoodViewFull: View {
    @Binding var value: String
    private let emojis = ["😢", "😴", "😁", "😡", "😐"]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("What's your mood?")
                .foregroundStyle(.darkBrown)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button {
                        value = emoji
                    } label: {
                        VStack {
                            Text(emoji)
                                .font(.system(size: 35))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom)
                            Image(systemName: value == emoji ? "circle.fill" : "circle")
                                .font(.system(size: 16))
                                .foregroundStyle(.darkBrown)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(minHeight: 100, maxHeight: 200)
        .padding()
    }
}

#Preview {
    MoodViewFull(value: .constant("😢"))
}
