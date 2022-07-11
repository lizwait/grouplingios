//
//  ThemeManager.swift
//  grouplingios
//
//  Created by Liz Wait on 7/10/22.
//

import SwiftUI

class ThemeManager: ObservableObject {
    
    @AppStorage("selectedTheme") var themeSelected = 0
    
    static let shared = ThemeManager()
    public var themes:[Theme] = [DefaultColorTheme(), PartyColorTheme()]
    @Published var selectedTheme:Theme = DefaultColorTheme()
    
    init(){
        getTheme()
    }
    
    public func applyTheme(_ theme:Int) {
        self.themeSelected = theme
        self.selectedTheme = self.themes[theme]
    }
    
    func getTheme(){
        self.selectedTheme = self.themes[themeSelected]
    }
}
