//
//  Header.swift
//  
//
//  Created by Liz Wait on 7/3/22.
//

import SwiftUI

struct Header: View {
    
    @StateObject var themeManager = ThemeManager()
    @State private var toggle = false
    
    var body: some View {
        HStack {
            Image.image.grouplinglogo
                .resizable()
                .frame(width: 200, height: 75)
            
            Toggle ("", isOn: $toggle)
//                ForEach(0..<themeManager.themes.count)
                .onChange(of: toggle) { value in
                    if value == true {
                        themeManager.applyTheme(1)
                    } else {
                        themeManager.applyTheme(0)
                    }
                }
            HStack {
                Spacer()
                Image.image.mulleticon
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
    //    .padding([.trailing, .leading], 30)
}


struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
