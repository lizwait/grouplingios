//
//  HomepageView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/26/22.
//

import SwiftUI

struct HomepageView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Image("GrouplingLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ZStack {
                        Rectangle()
                            .fill(Color.theme.grey)
                            .frame(width: 400, height: 350)
                    }
                }
                
                ZStack {
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

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
