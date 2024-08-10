//
//  MapView.swift
//  Bomudadima
//
//  Created by yoomin on 8/11/24.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack{
            NaverMap()
                .ignoresSafeArea(.all, edges: .top)
        }
        .onAppear {
            Coordinator.shared.checkIfLocationServiceIsEnabled()
        }
    }
    
}

#Preview {
    MapView()
}
