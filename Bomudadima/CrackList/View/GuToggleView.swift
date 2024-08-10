//
//  GuToggleView.swift
//  Bomudadima
//
//  Created by 문인범 on 8/11/24.
//

import SwiftUI


struct GuToggleView: View {
    @Binding var left: Bool
    
    
    var body: some View {
        Capsule()
            .frame(width: 65, height: 36)
            .foregroundStyle(.gray)
            .overlay {
                ZStack {
                    HStack {
                        if !left {
                            Spacer()
                        }
                        
                        Circle()
                            .frame(width: 28)
                            .padding(.horizontal, 3)
                            .foregroundStyle(.white)
                        
                        if left {
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text("남구")
                            .font(.system(size: 10))
                            .foregroundStyle(left ? .gray : .white)
                        
                        Spacer()
                        
                        Text("북구")
                            .font(.system(size: 10))
                            .foregroundStyle(left ? .white : .gray)

                    }
                    .padding(.horizontal, 10)
                }
            }
            .onTapGesture {
                self.left.toggle()
            }
            .animation(.spring, value: left)
    }
}
