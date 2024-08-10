//
//  CrackCell.swift
//  Bomudadima
//
//  Created by 문인범 on 8/11/24.
//

import SwiftUI


struct CrackCell: View {
    var body: some View {
        HStack {
            Spacer()
            
            // id
            Text("1")
                .font(.system(size: 17, weight: .regular))
            Spacer()
            
            // address
            Text("63 Daei-ro, Buk-gu...")
                .font(.system(size: 15, weight: .regular))
            Spacer()
            // occured date
            Text("2024.08.03")
                .font(.system(size: 13, weight: .regular))
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height: 18)
            Spacer()
        }
        .frame(height: 88)
    }
}
