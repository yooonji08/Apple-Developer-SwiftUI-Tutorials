//
//  MapView.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/3/24.
//

import SwiftUI
import MapKit // MapKit 라이브러리 임포트

struct MapView: View {
    var coordinate: CLLocationCoordinate2D // 좌표 => preview에 좌표를 작성함으로써, region에는 따로 하드 코딩할 필요x
    
    var body: some View {
        // Map영역으로 초기화하는 카메라 위치를 취하는 뷰
        // region 값이 변경되면, 이에 맞춰서 카메라 위치도 업데이트되도록 함
        Map(position: .constant(.region(region)))
    }
    
    // 지도의 지역 정보를 저장하는 비공개 계산 변수
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2,longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
