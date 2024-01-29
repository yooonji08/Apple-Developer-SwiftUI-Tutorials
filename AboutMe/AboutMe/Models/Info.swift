//
//  Info.swift
//  AboutMe
//
//  Created by 이윤지 on 1/29/24.
//

import Foundation
import SwiftUI

struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String] // 문자열 배열
    let foods: [String]
    let colors: [Color] // 색상 배열
    let funFacts: [String]
}

let information = Info(
    image: "img_cute_dog",
    name: "Lee Yoon Ji",
    story: "Let’s live today to the fullest.\nDream comes true.\n\nMy source of inspiration:\n• 😎🥳🐶🐱🐾☘️🐚🌼\n• 🌕☀️🍋🍽️🧋⚽️🏸🏅\n• 🎹🎬🚲✈️🏡🌄💡🖼️🧸🤍 ",
    hobbies: ["tv.fill", "movieclapper.fill", "soccerball"],
    foods: ["🍊", "🍜", "🍚"],
    colors: [Color.yellow, Color.cyan, Color.blue, Color.purple],
    funFacts: [
        "Tottenham in the 2023-2024 season has won all 10 games since the start.",
        "I dream of Tottenham winning the championship this season.",
        "In January 2024 alone, I watched as many as 4 movies.",
        "I wake up early just to have breakfast.",
        "I'm still hungry now.",
        "Pronounce Y-E-S individually. So how do you pronounce E-Y-E-S?",
        "I always buy a journal every year. However, I have never written a diary every day.",
        "Android and iOS development is very fun. It's fun to create a screen based on a pretty design.",
    ]
)
