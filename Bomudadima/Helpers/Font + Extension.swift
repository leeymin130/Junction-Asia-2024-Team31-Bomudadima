//
//  Font + Extension.swift
//  Bomudadima
//
//  Created by 문인범 on 8/11/24.
//

import SwiftUI

struct CustomFont {
    let font: String
    let size: CGFloat
    // TODO: 디자인에서 필요시 추가 요청!
//    let kerning: CGFloat
//    let lineSpacing: CGFloat
    
    static let black = "Pretendard-Black"
    static let bold = "Pretendard-Bold"
    static let extraBold = "Pretendard-ExtraBold"
    static let extraLight = "Pretendard-ExtraLight"
    static let light = "Pretendard-Light"
    static let medium = "Pretendard-Medium"
    static let regular = "Pretendard-Regular"
    static let semiBold = "Pretendard-SemiBold"
    static let thin = "Pretendard-Thin"
}



// TODO: - 나중에 적용
extension Text {
    func customFont(_ customFont: CustomFont) -> some View {
        self
            .font(.custom(customFont.font, size: customFont.size))
    }
}
