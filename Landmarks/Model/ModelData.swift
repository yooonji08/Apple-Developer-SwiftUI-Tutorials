//
//  ModelData.swift
//  Landmarks
//
//  Created by 이윤지 on 11/25/23.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// 지정된 이름으로 JSON데이터를 가져오는 메서드
// Decodable 프로토콜로 자기 자신을 decode할 수 있도록 만듦
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
