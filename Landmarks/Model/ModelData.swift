//
//  ModelData.swift
//  Landmarks
//
//  Created by 이윤지 on 11/25/23.
//

import Foundation

// MARK: Observable을 사용하여, 프로퍼티의 변경사항을 확인하고, 프로퍼티가 변경될 때만 ui가 업데이트되도록 함 => 성능 향상, like 매크로
@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    // MARK: Dictionary
    // key-value, 값 정렬x - 배열을 print할 경우 출력이 뒤죽박죽, value 중복ok, 각 key-value의 자료형은 모두 같아야 함
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

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
