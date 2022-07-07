//
//  CustomTextFieldStyle.swift
//  grouplingios
//
//  Created by Liz Wait on 7/6/22.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .frame(height: 44)
            .padding([.leading, .trailing], 16)
            .background(
                RoundedRectangle(cornerRadius: 4).fill(Color.white)
            )
    }
    
}
