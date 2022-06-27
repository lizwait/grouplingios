//
//  NewGroupView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/27/22.
//

import SwiftUI

struct NewGroupView: View {
    @State private var pinInput = ""
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Image.image.grouplinglogo
                    .resizable()
                    .frame(width: 150, height: 75)
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.theme.secondarybackground)
                            .frame(width: 400, height: 350)
                        VStack {
                            Text("ddd")
                            TextField("Text Input", text: $pinInput)
                                .background(Color.theme.bright)
                                .padding(.top, 40)
                                .padding(.trailing, 120)
                                .padding(.leading, 120)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(6)
                            Button {}
                        label: {
                            Text("add")
                                .padding(10)
                                .background(Color.theme.accent)
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.theme.bright)
                                .cornerRadius(6)
                                .padding(.top, 10)
                        }
                        }
                    }
                }
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(Color.theme.secondarybackground)
                            .frame(width: 400, height: 350)
                        VStack {
                            TextField("Text Input", text: $pinInput)
                                .background(Color.theme.bright)
                                .padding(.top, 40)
                                .padding(.trailing, 120)
                                .padding(.leading, 120)
                                .textFieldStyle(.roundedBorder)
                                .cornerRadius(6)
                            Button {}
                                label: {
                                    Text("add")
                                        .padding(10)
                                        .background(Color.theme.accent)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.theme.bright)
                                        .cornerRadius(6)
                                        .padding(.top, 10)
                                }
                        }
                    }
                }
            }
        }
    }
}
struct NewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupView()
    }
}
