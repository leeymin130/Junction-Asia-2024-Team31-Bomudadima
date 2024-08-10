//
//  SelectRiskSegmentView.swift
//  Bomudadima
//
//  Created by 문인범 on 8/11/24.
//

import SwiftUI


struct SelectRiskSegmentView: View {
    @Binding var currentRisk: RiskSegment
    let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("상")
                    .frame(width: width)
                    .onTapGesture {
                        currentRisk = .upper
                    }
                    .foregroundStyle( currentRisk == .upper ? .black : .gray)

                Text("중")
                    .frame(width: width)
                    .onTapGesture {
                        currentRisk = .middle
                    }
                    .foregroundStyle( currentRisk == .middle ? .black : .gray)
                
                Text("하")
                    .frame(width: width)
                    .onTapGesture {
                        currentRisk = .lower
                    }
                    .foregroundStyle( currentRisk == .lower ? .black : .gray)
            }
            
            ZStack {
                Rectangle()
                    .frame(height: 4)
                    .foregroundStyle(.gray)
                
                HStack {
                    if currentRisk == .lower {
                        Spacer()
                    }
                    
                    Rectangle()
                        .frame(width: width, height: 4)
                    
                    if currentRisk == .upper {
                        Spacer()
                    }
                }
            }
        }
        .animation(.spring, value: currentRisk)
    }
    
    enum RiskSegment {
        case upper
        case middle
        case lower
    }
}
