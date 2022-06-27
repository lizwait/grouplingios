//
//  Color.swift
//  grouplingios
//
//  Created by Liz Wait on 6/26/22.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = DefaultColorTheme()
    
}

struct DefaultColorTheme {
    
    let accent = Color("AccentColor")
    let primarytext = Color("Text")
    let background = Color("Background")
    let secondarybackground = Color("Grey")
    let bright = Color("White")
    let optional = Color("Blue")
    
}

struct PartyColorTheme {
    
    let accent = Color("PartyAccentColor")
    let primarytext = Color("PartyText")
    let background = Color("PartyBackground")
    let secondarybackground = Color("PartyPurple")
    let bright = Color ("PartyGold")
    let optional = Color("Blue")
    
}
