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
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
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
