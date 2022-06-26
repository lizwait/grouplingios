//
//  ContentView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accent Color")
                    .background(Color.theme.grey)
                Text("Secondary Background Color")
                    .background(Color.theme.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
