//
//  MapView.swift
//  Landmarks
//
//  Created by 이윤지 on 11/23/23.
//

import SwiftUI
import MapKit // MapKit 라이브러리 임포트

struct MapView: View {
    var body: some View {
        // Map영역으로 초기화하는 카메라 위치를 취하는 뷰
        Map(initialPosition: .region(region))
    }
    
    // 지도의 지역 정보를 저장하는 비공개 계산 변수
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView()
}
