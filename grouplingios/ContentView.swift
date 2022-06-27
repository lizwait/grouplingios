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
            ZStack {
                HStack {
                    VStack {
                        Image("GrouplingLogo")
                    }
                }
            VStack {
            Rectangle()
                .fill(Color.theme.grey)
                .frame(width: 400, height: 250)
                VStack {
                    Text("New to Groupling?")
                        .fontWeight(.semibold)
                        .font(.system(.title, design: .rounded))
                    Button {}
                        label: {
                            Text("create group")
                                .padding(10)
                            
                            }
                }
                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
