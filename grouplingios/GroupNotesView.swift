//
//  GroupNotesView.swift
//  grouplingios
//
//  Created by Liz Wait on 7/6/22.
//

import SwiftUI

struct GroupNotesView: View {
    @State private var groupNotes = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.theme.secondarybackground)
                .frame(height:480)
            Form {
                VStack {
                    Text("Notes")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                    
                    TextEditor(text: $groupNotes)
                        .background()
                        .padding(.bottom)
                    
                    Button {}
                label: {
                    Text("add note")
                        .padding(10)
                        .background(Color.theme.accent)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.theme.bright)
                        .cornerRadius(6)
                        .padding(.top, 10)
                        .padding(.bottom)
                }
            }
                Divider()
                
                Text("Group Notes")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding()
            }
            .padding(.trailing, 20)
            .padding(.leading, 20)
            .textFieldStyle(.roundedBorder)
            .cornerRadius(6)
            .font(.system(size: 15, weight: .semibold, design: .rounded))
        }
    }
}

struct GroupNotesView_Previews: PreviewProvider {
    static var previews: some View {
        GroupNotesView()
    }
}
