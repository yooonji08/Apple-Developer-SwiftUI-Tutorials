//
//  PageViewController.swift
//  Landmarks02
//
//  Created by 이윤지 on 1/17/24.
//

import SwiftUI
import UIKit

// page유형의 배열 저장 => 랜드마크 간 스크롤을 하는데 사용하는 페이지
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
