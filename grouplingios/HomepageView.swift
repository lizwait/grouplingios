//
//  HomepageView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/26/22.
//

import SwiftUI

struct HomepageView: View {
    @State private var toggle = false
    @State private var pinInput = ""
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Toggle (isOn: $toggle) {
                    HStack {
                        Spacer()
                        Image.image.mulleticon
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
                .tint(Color.theme.accent)
                .padding(.bottom, 20)
                .padding(.trailing, 25)
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.theme.secondarybackground)
                            .frame(width: 400, height: 350)
                        VStack {
                            Image.image.grouplinglogo
                                .resizable()
                                .frame(width: 350, height: 150)
                                .padding(.top, -50)
                            TextField("Group PIN", text: $pinInput)
                                .background(Color.theme.bright)
                                .padding(.top, 40)
                                .padding(.trailing, 120)
                                .padding(.leading, 120)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(6)
                            Button {}
                                label: {
                                    Text("go to group")
                                        .padding(10)
                                        .background(Color.theme.accent)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.theme.bright)
                                        .cornerRadius(6)
                                        .padding(.top, 10)
                                }
                        }
                    }
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.theme.bright)
                            .frame(width: 400, height: 200)
                        VStack(spacing: 30) {
                            Text("New to Groupling?")
                                .fontWeight(.semibold)
                                .font(.system(.largeTitle, design: .rounded))
                            Button { }
                        label: {
                            Text("create group")
                                .padding(10)
                                .background(Color.theme.accent)
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.theme.bright)
                                .cornerRadius(6)
                        }
                            
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
