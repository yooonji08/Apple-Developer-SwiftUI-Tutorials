//
//  MemeCreator.swift
//  MemeCreator
//
//  Created by 이윤지 on 2/5/24.
//

import SwiftUI

// 가장 처음에 보여지는 뷰
// Sendable: 함수 또는 클로저가 전송 가능하다는 것을 나타내는 속성
// -> 비동기 환경(async)에서 특정 데이터를 보내도 안전한지 점검하는 프로토콜
// -> 해당 프로토콜을 통해 스레드 안전 보장 가능
struct MemeCreator: View, Sendable {
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer() // 공백
            // 앱을 실행했을 때, 처음으로 나타낼 이미지 값
            LoadableImage(imageMetadata: fetcher.currentPanda)
                . overlay(alignment: .bottom) {
                    // 사용자가 조작을 통해 데이터를 동적으로 변경 가능
                    TextField(
                        "Meme Text",
                        text: $memeText,
                        prompt: Text("")
                    )
                    .focused($isFocused) // 포커스를 텍스트 필드에 맞춤
                    .font(.system(size: textSize, weight: .heavy))
                    .shadow(radius: 10)
                    .foregroundStyle(textColor)
                    .padding()
                    .multilineTextAlignment(.center) // 가운대 정렬
                }
                .frame(minHeight: 150)
            
            Spacer()
            
            // Slider, ColorPicker를 통해서 텍스트 속성 변경하기
            if !memeText.isEmpty {
                VStack {
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize, in: 20...140)
                    }
                    
                    HStack {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor)
                            .labelsHidden() // 제목 숨기기
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
            }
            
            HStack {
                // 이미지 랜덤으로 변경하는 버튼
                Button {
                    // currentPanda값에 이미지 랜덤으로 변경
                    if let randomImage = fetcher.imageData.sample.randomElement() {
                        fetcher.currentPanda = randomImage
                    }
                } label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                
                // 텍스트 추가 버튼
                Button {
                    // 버튼 클릭 시, 텍스트 필드에 포커스 됨
                    isFocused = true
                } label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: 180, alignment: .center)
        }
        .padding()
        // 판다 이미지 로드 시작 전, json 데이터를 검색하기
        .task {
            // 함수는 비동기식
            // 함수 결과가 반환될 때까지 기다린다는 뜻
            // ?는 함수 호출시 발생하는 오류는 무시한다는 뜻
            try? await fetcher.fetchData()
        }
        .navigationTitle("Meme Creator")
    }
}

#Preview {
    MemeCreator()
}
