//
//  Coordinator.swift
//  Bomudadima
//
//  Created by yoomin on 8/11/24.
//

import Foundation
import UIKit
import NMapsMap

final class Coordinator: NSObject, ObservableObject, NMFMapViewCameraDelegate, NMFMapViewTouchDelegate, CLLocationManagerDelegate {
    static let shared = Coordinator()
    
    let view = NMFNaverMapView(frame: .zero) // UIKit에서 맵을 불러오는 코드입니다.
    
    func getNaverMap() -> NMFNaverMapView {
        view
    }
    
    override init() {
            super.init()
            
            view.mapView.positionMode = .direction
            view.mapView.isNightModeEnabled = true
            
            view.mapView.zoomLevel = 15
            view.mapView.minZoomLevel = 10 // 최소 줌 레벨
            view.mapView.maxZoomLevel = 17 // 최대 줌 레벨
            
            view.showLocationButton = true
            view.showZoomControls = true // 줌 확대, 축소 버튼 활성화
            view.showCompass = false
            view.showScaleBar = false
            
            view.mapView.addCameraDelegate(delegate: self)
            view.mapView.touchDelegate = self
        }
    
    // 클래스 상단에 변수 설정을 해줘야 한다.
           @Published var coord: (Double, Double) = (0.0, 0.0)
        @Published var userLocation: (Double, Double) = (0.0, 0.0)
        
        var locationManager: CLLocationManager?

    // MARK: - 위치 정보 동의 확인
        func checkLocationAuthorization() {
            guard let locationManager = locationManager else { return }
            
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("위치 정보 접근이 제한되었습니다.")
            case .denied:
                print("위치 정보 접근을 거절했습니다. 설정에 가서 변경하세요.")
            case .authorizedAlways, .authorizedWhenInUse:
                print("Success")
                
                coord = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
                userLocation = (Double(locationManager.location?.coordinate.latitude ?? 0.0), Double(locationManager.location?.coordinate.longitude ?? 0.0))
                
//                fetchUserLocation()
                
            @unknown default:
                break
            }
        }
    
    func checkIfLocationServiceIsEnabled() {
            DispatchQueue.global().async {
                if CLLocationManager.locationServicesEnabled() {
                    DispatchQueue.main.async {
                        self.locationManager = CLLocationManager()
                        self.locationManager!.delegate = self
                        self.checkLocationAuthorization()
                    }
                } else {
                    print("Show an alert letting them know this is off and to go turn i on")
                }
            }
        }
}
