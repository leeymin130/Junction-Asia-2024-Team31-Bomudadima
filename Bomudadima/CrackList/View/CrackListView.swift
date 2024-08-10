//
//  CrackListView.swift
//  Bomudadima
//
//  Created by 문인범 on 8/11/24.
//

import SwiftUI

struct CrackListView: View {
    @State private var isNamgu: Bool = true
    @State private var currentRisk: SelectRiskSegmentView.RiskSegment = .upper
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("도로 복구 요청서")
                        .font(.system(size: 26, weight: .medium))
                    
                    Text("부제")
                        .font(.system(size: 18, weight: .regular))
                }
                
                Spacer()
                
                GuToggleView(left: $isNamgu)
            }
            
            SelectRiskSegmentView(currentRisk: $currentRisk)
            
            HStack {
                Text("최근 시간순")
                Image(systemName: "slider.vertical.3")
                
                Spacer()
                
                Image(systemName: "map.fill")
            }
            Rectangle()
                .frame(height: 1)
            
            ScrollView {
                ForEach(0..<20, id: \.self) { _ in
                    CrackCell()
                    seperator
                }
            }
            
        }
    }
    
    var seperator: some View {
        Rectangle()
            .frame(height: 2)
    }
}








#Preview {
    CrackListView()
//    CrackCell()
//    GuToggleView()
//    SelectRiskSegmentView()
}
