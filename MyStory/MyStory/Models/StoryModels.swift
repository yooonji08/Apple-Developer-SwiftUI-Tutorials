//
//  StoryModels.swift
//  MyStory
//
//  Created by 이윤지 on 1/29/24.
//

// 전역적으로 사용한 데이터들
struct Story {
    let pages: [StoryPage] // 스토리 페이지 배열
    
    // subscript: 클래스, 구조체, 열거형에서 시퀀스의 멤버 요소에 접근하기 위한 바로가기 첨자 ex. [] (배열의 인덱스)
    // -> 하나 이상의 값을 반홤함
    subscript(_ pageIndex: Int) -> StoryPage {
        return pages[pageIndex]
    }
}

struct StoryPage {
    let text: String // 페이지 설명
    
    let choices: [Choice] // 다른 페이지로 이동하기 위한 선택 옵션 배열
    
    init(_ text: String, choices: [Choice]) {
        self.text = text
        self.choices = choices
    }
}

struct Choice {
    let text: String // 선택 옵션에 대한 설명
    let destination: Int // 페이지의 인덱스
}
