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
    
    @FetchRequest(sortDescriptors: []) var group: FetchedResults<Group>
    @FetchRequest(sortDescriptors: []) var memberInfo: FetchedResults<GroupMember>
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<GroupNote>
    
    @StateObject var themeManager = ThemeManager()
    
    @State private var isValid = true
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
                Header(themeManager: themeManager)
                groupInfoSection
                memberInfoSection
                placesInfoSection
                groupNotesSection
                groupPinSection
                saveGroupSection
            }
            .textFieldStyle(CustomTextFieldStyle())
        }
        .background(themeManager.selectedTheme.background.ignoresSafeArea())
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Please make sure all required fields are completed."),
                message: Text("Double-check your entry, please!"),
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
        .background(themeManager.selectedTheme.secondarybackground)
    }
    
    @ViewBuilder
    var memberFormView: some View {
        Text("Members")
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .padding(.leading, 20)
        
        TextField("First Name", text: $firstName)
            .padding([.leading, .trailing], 20)
        
        TextField("Last Name", text: $lastName)
            .padding([.leading, .trailing], 20)
        
        TextField("Phone Number", text: $memberPhone)
            .keyboardType(.decimalPad)
            .padding([.leading, .trailing], 20)
        
        TextField("Email", text: $memberEmail)
            .padding([.leading, .trailing,], 20)
    }
    
    
    @ViewBuilder
    var memberInfoSection: some View {
        VStack(alignment: .leading, spacing:10) {
            
            memberFormView
            
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
                    if $firstName.wrappedValue == "" ||
                        $lastName.wrappedValue == "" ||
                        $memberPhone.wrappedValue == "" ||
                        $memberEmail.wrappedValue == "" ||
                        $memberNotes.wrappedValue == ""
                    {
                        showingAlert = true
                    } else {
                        let newGroupMember = GroupMember(context: moc)
                        newGroupMember.first_name = $firstName.wrappedValue
                        newGroupMember.last_name = $lastName.wrappedValue
                        newGroupMember.member_phone = $memberPhone.wrappedValue
                        newGroupMember.member_email = $memberEmail.wrappedValue
                        newGroupMember.member_notes = $memberNotes.wrappedValue
                        
                        try? moc.save()
                    }
                    //Why is this not working??
                    self.groupNotes = ""
                    UIApplication.shared.endEditing()
                } label: {
                    Text("add member to group")
                        .padding(10)
                        .background(themeManager.selectedTheme.accent)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(themeManager.selectedTheme.bright)
                        .cornerRadius(6)
                }
                
                Spacer()
            }
            
            Divider()
            
            Text("Member List")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.top, 10)
                .padding([.leading, .bottom], 20)
            
            ForEach(memberInfo, id: \.self) { groupMember in
                HStack {
                    Text(groupMember.first_name ?? "missing first name")
                    Text(groupMember.last_name ?? "missing last name")
                        .padding(.leading, -3)
                }
                Text(groupMember.member_phone ?? "missing phone number")
                Text(groupMember.member_email ?? "missing email")
                Text(groupMember.member_notes ?? "")
                    .padding(.bottom, 8)
            }
            .padding(.leading, 20)
        }
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .padding()
        .background(themeManager.selectedTheme.secondarybackground)
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
                .frame(width: 400, height: 250)
            
            Divider()
            
            Text("Places List")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .padding(.top, 10)
                .padding([.leading, .bottom], 20)
        }
        .padding([.leading, .trailing], 20)
        .cornerRadius(6)
        .font(.system(size: 15, weight: .semibold, design: .rounded))
        .background(themeManager.selectedTheme.secondarybackground)
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
                    self.groupNotes = ""
                    UIApplication.shared.endEditing()
                } label: {
                    Text("add note")
                        .padding(10)
                        .background(themeManager.selectedTheme.accent)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(themeManager.selectedTheme.bright)
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
        .background(themeManager.selectedTheme.secondarybackground)
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
            .background(themeManager.selectedTheme.secondarybackground)
        }
    }
    
    @ViewBuilder
    var saveGroupSection: some View {
        ZStack {
            VStack {
                Button {
                    if $groupTitle.wrappedValue == "" ||
                        $groupDescription.wrappedValue == ""
                    {
                        showingAlert = true
                    } else {
                        let newGroup = Group(context: moc)
                        newGroup.title = $groupTitle.wrappedValue
                        newGroup.groupdescription = $groupDescription.wrappedValue
                        
                        try? moc.save()
                    }
                } label: {
                    Text("Save Group")
                        .padding(10)
                        .background(themeManager.selectedTheme.accent)
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                }
            }
            .background(themeManager.selectedTheme.secondarybackground)
        }
    }
    
    
    struct NewGroupView_Previews: PreviewProvider {
        static var previews: some View {
            NewGroupView()
        }
    }
}
//hide keyboard after input
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



