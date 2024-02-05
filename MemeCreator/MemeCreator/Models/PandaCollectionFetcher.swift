//
//  PandaCollectionFetcher.swift
//  MemeCreator
//
//  Created by 이윤지 on 2/5/24.
//

import SwiftUI

class PandaCollectionFetcher: ObservableObject {
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
    // JSON 데이터 검색
    // 비동기적으로 실행(인터넷에서 데이터를 가져오는데 시간이 걸릴 수 있으므로, 데이터가 반환될 때까지 함수 일시 중지됨->앱의 코드는 백그라운드에서 계속 실행됨)
    func fetchData() async
    
    // 함수 에러 발생시 처리
    throws {
        // 유효한 URL이 있는지 확인
        guard let url = URL(string: urlString) else { return }
        
        // 함수 일시 정지
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        // 응답에 오류가 있는지 확인 -> 오류 여부에 따른 분기 처리
        // 200: 성공, 404 등: 에러
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        
        // JSON 데이터를 디코딩하여 imageData변수에 넣기
        Task { @MainActor in
            imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
        }
    }
}
