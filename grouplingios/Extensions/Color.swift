//
//  Color.swift
//  grouplingios
//
//  Created by Liz Wait on 6/26/22.
//

import Foundation
import SwiftUI

protocol Theme {
    var accent: Color {get set}
    var primarytext: Color {get set}
    var background: Color {get set}
    var secondarybackground: Color {get set}
    var bright: Color {get set}
    var optional: Color {get set}
}

struct DefaultColorTheme: Theme {
    
    var accent = Color("AccentColor")
    var primarytext = Color("Text")
    var background = Color("Background")
    var secondarybackground = Color("Grey")
    var bright = Color("White")
    var optional = Color("Blue")
    
}

struct PartyColorTheme: Theme {
    
    var accent = Color("PartyAccentColor")
    var primarytext = Color("PartyText")
    var background = Color("PartyBackground")
    var secondarybackground = Color("PartyPurple")
    var bright = Color ("PartyGold")
    var optional = Color("Blue")
    
}

