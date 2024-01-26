//
//  Recipe.swift
//  RecipesSample
//
//  Created by 이윤지 on 1/23/24.
//

import SwiftUI

// Identifiable: 인스턴스의 유일성 보장을 위하여 반드시 id값 설정
// Codable = Encodable + Decodable, json데이터를 읽기 위함
struct Recipe: Identifiable, Codable {
    var id: Int
    var title: String
    var rating: Int
    var prepTime: Int // seconds
    var cookTime: Int // seconds
    var servings: String
    var ingredients: String
    var directions: String
    var isFavorite: Bool
    var collections: [String]
    // fileprivate: 같은 소스 파일(.swift) 내에서만 접근 가능
    fileprivate var addedOn: Date? = Date()
    fileprivate var imageNames: [String]
}

extension Recipe {
    var addedOnDate: Date {
        // ???: ??는 아마도 addedOn값이 nil이라면, Date()값을 넣으라는 뜻이라고 추측
        addedOn ?? Date()
    }
    
    var subtitle: String {
        var subtitle = "\(self.servings) servings | "
        
        let now = Date.now
        let later = now + TimeInterval(prepTime + cookTime)
        subtitle += (now..<later).formatted(.components(style: .condensedAbbreviated))
        
        return subtitle
    }
    
    var thumbnailImage: Image {
        let name = imageNames.last ?? "placeholder"
        return ImageStore.shared.image(name: name)
    }
    
    var smallImage: Image {
        guard imageNames.count >= 2 else { return thumbnailImage }
        
        let name = imageNames[1]
        return ImageStore.shared.image(name: name)
    }
    
    var fullImage: Image {
        let name = imageNames.first ?? "placeholder"
        return ImageStore.shared.image(name: name)
    }
    
    var prepTimeAsText: String {
        get { prepTime == 0 ? "" : "\(prepTime)" }
        set { prepTime = Int(newValue) ?? 0 }
    }
    
    var cookTimeAsText: String {
        get { cookTime == 0 ? "" : "\(cookTime)" }
        set { cookTime = Int(newValue) ?? 0 }
    }
    
    var collectionsAsText: String {
        get { collections.joined(separator: ",") }
        set { collections = newValue.replacingOccurrences(of: ", ", with: ",").components(separatedBy: ",") }
    }
    
    func add(_ image: Image) {
        guard let name = imageNames.first else { return }
        ImageStore.shared.add(image, with: name)
    }
    
    private static let newRecipedId: Recipe.ID = -1
    var isNew: Bool {
        id == Recipe.newRecipedId
    }
}

extension Recipe {
    static func emptyRecipe() -> Recipe {
        // Date 파싱 포맷 지정
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        // 디바이스 기준 timezone 적용
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        formatter.locale = Locale(identifier: Locale.current.identifier)
        
        let json = """
            {
                "id": \(Recipe.newRecipedId),
                "title": "",
                "rating": 0,
                "prepTime": 0,
                "cookTime": 0,
                "servings": "",
                "ingredients": "",
                "directions": "",
                "isFavorite": false,
                "collections": [],
                "imageNames": []
            }
        """
        let data = Data(json.utf8)
        
        // do-catch문: do절에서 에러 발생 시, catch절에서 에러 처리
        do {
            // json데이터를 decoding함
            let decoder = JSONDecoder()
            return try decoder.decode(Recipe.self, from: data)
        } catch {
            fatalError("Invalid recipe JSON.")
        }
    }
}
