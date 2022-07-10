//
//  NewGroupView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/27/22.
//

import SwiftUI
import MapKit
import CoreData

struct NewGroupView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<GroupNote>
    
    @State private var groupTitle = ""
    @State private var groupDescription = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var memberPhone = ""
    @State private var memberEmail = ""
    @State private var memberNotes = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.099724, longitude: -94.578331), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var searchPlaces = ""
    @State private var groupNotes = ""
    @State private var showingAlert = false
    @State private var pin = 7
    @State private var text = ""
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 16) {
                Header()
                groupInfoSection
                memberInfoSection
                placesInfoSection
                groupNotesSection
                groupPinSection
                saveGroupSection
            }
            .textFieldStyle(CustomTextFieldStyle())
        }
        .background(Color.theme.background.ignoresSafeArea())
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Group Note field is empty"),
                message: Text("Please add a Group Note"),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
    
    @ViewBuilder
    var groupInfoSection: some View {
        VStack(alignment: .leading, spacing:10) {
            Text("Group Title")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.leading, 20)
            
            TextField("", text: $groupTitle)
                .padding([.leading, .trailing], 20)
            
            Text("Group Description")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.leading, 20)
            
            TextEditor(text: $groupDescription)
                .cornerRadius(6)
                .frame(height: 120)
                .padding([.leading, .trailing, .bottom], 20)
        }
        .padding()
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .background(Color.theme.secondarybackground)
        
    }
    
    @ViewBuilder
    var memberInfoSection: some View {
        VStack(alignment: .leading, spacing:10) {
            Text("Members")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.leading, 20)
            
            TextField("First Name", text: $firstName)
                .padding([.leading, .trailing], 20)
            
            TextField("Last Name", text: $lastName)
                .padding([.leading, .trailing], 20)
            
            TextField("Phone Number", text: $memberPhone)
                .padding([.leading, .trailing], 20)
            
            TextField("Email", text: $memberEmail)
                .padding([.leading, .trailing,], 20)
            
            Text("Member Specific Notes")
                .padding([.top, .leading], 20)
                .padding(.bottom, 6)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
            
            TextEditor(text: $memberNotes)
                .cornerRadius(6)
                .frame(height: 120)
                .padding([.leading, .trailing, .bottom], 20)
            
            HStack {
                Spacer()
                
                Button {
                } label: {
                    Text("add member to group")
                        .padding(10)
                        .background(Color.theme.accent)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.theme.bright)
                        .cornerRadius(6)
                }
                
                Spacer()
            }
            
            Divider()
            
            Text("Member List")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.top, 10)
                .padding([.leading, .bottom], 20)
        }
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .padding()
        .background(Color.theme.secondarybackground)
    }
    
    @ViewBuilder
    var placesInfoSection: some View {
        VStack(alignment: .leading, spacing:10) {
            
            Text("Places")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
            
            TextField("Search Places", text: $searchPlaces)
                .padding([.leading, .trailing,], 20)
                .padding(.bottom, 6)
            
            Map(coordinateRegion: $region)
                .frame(width: 380, height: 250)
            
            Divider()
            
            Text("Places List")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.top, 10)
                .padding([.leading, .bottom], 20)
        }
        .padding([.leading, .trailing], 20)
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .background(Color.theme.secondarybackground)
    }
    
    @ViewBuilder
    var groupNotesSection: some View {
        VStack(alignment: .leading, spacing:10) {
            Text("Notes")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding()
            
            TextEditor(text: $groupNotes)
                .cornerRadius(6)
                .frame(height: 120)
                .padding([.leading, .trailing, .bottom], 20)
            
            HStack {
                Spacer()
                
                Button {
                    if $groupNotes.wrappedValue == "" {
                        showingAlert = true
                    } else {
                        let newGroupNote = GroupNote(context: moc)
                        newGroupNote.text = $groupNotes.wrappedValue
                        
                        try? moc.save()
                    }
                } label: {
                    Text("add note")
                        .padding(10)
                        .background(Color.theme.accent)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.theme.bright)
                        .cornerRadius(6)
                }
                
                Spacer()
            }
            
            Divider()
            
            Text("Group Notes")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .cornerRadius(6)
                .padding([.top, .bottom], 10)
                .padding(.leading, 20)
            
            ForEach(notes, id: \.self) { note in
                Text(note.text ?? "missing note")
            }
            .padding([.leading, .bottom], 20)
        }
        .padding(.trailing, 20)
        .padding(.leading, 20)
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .background(Color.theme.secondarybackground)
    }
    
    @ViewBuilder
    var groupPinSection: some View {
        ZStack {
            VStack {
                Text("Event PIN")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding([.top, .leading], 20)
                
                Text("299384")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                
                Button {
                } label: {
                    Text("copy PIN")
                        .padding(10)
                        .background(Color.red)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }
            }
            .padding(.bottom, 30)
            .background(Color.theme.secondarybackground)
        }
    }
    
    @ViewBuilder
    var saveGroupSection: some View {
        ZStack {
            VStack {
                Button {
                } label: {
                    Text("Save Group")
                        .padding(10)
                        .background(Color.theme.accent)
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }
            }
            .background(Color.theme.secondarybackground)
        }
    }
    
    
    
    struct NewGroupView_Previews: PreviewProvider {
        static var previews: some View {
            NewGroupView()
        }
    }
}
