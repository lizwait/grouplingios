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
                VStack(alignment: .trailing) {
                    Image.image.mulleticon
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                    VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.theme.secondarybackground)
                                    .frame(width: 400, height: 350)
                                Image.image.grouplinglogo
                                    .resizable()
                                    .frame(width: 350, height: 350)
                            }
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.theme.secondarybackground)
                                .frame(width: 400, height: 250)
                            
                            VStack(spacing: 65) {
                            Text("New to Groupling?")
                                .fontWeight(.semibold)
                                .font(.system(.largeTitle, design: .rounded))
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
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
