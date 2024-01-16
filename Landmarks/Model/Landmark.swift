//
//  Landmark.swift
//  Landmarks
//
//  Created by 이윤지 on 11/25/23.
//

import Foundation
import SwiftUI
import CoreLocation

// Identifiable 프로토콜 - 데이터를 읽을 때 디코딩하기 위함
struct Landmark: Hashable, Codable, Identifiable {
    // 다음 변수들은 lanmarkData파일에 있는 변수명(키 값)과 똑같아야 함
    // 변수명이 똑같아야 키 값에 따른 value 값을 읽을 수 있음
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool // 별 표시 o or x
    var isFeatured: Bool // 추천 랜드마크 o or x
    
    // landmarkData.json파일에 있는 category속성의 값에 맞춰서 case문 작성
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    // 이미지 변수
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // json데이터 구조를 반영하는 coordinates 사용
    private var coordinates: Coordinates
    
    // MapKit 프레임워크와 상호작용하는데 필요한 속성
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
