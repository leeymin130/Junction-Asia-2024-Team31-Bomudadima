//
//  NaverMap.swift
//  Bomudadima
//
//  Created by yoomin on 8/11/24.
//

import SwiftUI
import UIKit
import NMapsMap

struct NaverMap: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        Coordinator.shared.getNaverMap()
    }
    
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {}
        
    
}


