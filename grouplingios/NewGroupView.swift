//
//  NewGroupView.swift
//  grouplingios
//
//  Created by Liz Wait on 6/27/22.
//

import SwiftUI
import MapKit

struct NewGroupView: View {
    @State private var groupTitle = ""
    @State private var groupDescription = ""
    @State private var toggle = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var memberPhone = ""
    @State private var memberEmail = ""
    @State private var memberNotes = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.099724, longitude: -94.578331), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var searchPlaces = ""
    @State private var groupNotes = ""
    
    var body: some View {
        ScrollView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image.image.grouplinglogo
                            .resizable()
                            .frame(width: 200, height: 75)
                            .padding(.leading, 5)
                        
                        Toggle (isOn: $toggle) {
                            HStack {
                                Spacer()
                                Image.image.mulleticon
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        .padding(.trailing, 25)
                        
                    }
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.theme.secondarybackground)
                                .frame(height: 350)
                            
                            VStack {
                                Text("Group Title")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .padding()
                                
                                TextField("", text: $groupTitle)
                                    .background()
                                    .padding(.trailing, 20)
                                    .padding(.leading, 20)
                                
                                Text("Group Description")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .padding()
                                
                                TextEditor(text: $groupDescription)
                                    .background()
                                    .padding(.trailing, 20)
                                    .padding(.leading, 20)
                                    .padding(.bottom)
                            }
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(6)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                        }
                        
                        Spacer()
                        
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.theme.secondarybackground)
                                    .frame(height: 600)
                                
                                VStack {
                                    Text("Members")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .font(.system(size: 20, weight: .bold, design: .rounded))
                                        .padding()
                                    
                                    TextField("First Name", text: $firstName)
                                        .background()
                                    
                                    TextField("Last Name", text: $lastName)
                                        .background()
                                    
                                    TextField("Phone Number", text: $memberPhone)
                                        .background()
                                    
                                    TextField("Email", text: $memberEmail)
                                        .background()
                                    
                                    Text("Member Specific Notes")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top, 15)
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    
                                    TextEditor(text: $groupDescription)
                                        .background()
                                        .padding(.bottom)
                                        .textFieldStyle(.roundedBorder)
                                        .cornerRadius(6)
                                    
                                    Button {}
                                label: {
                                    Text("add member to group")
                                        .padding(10)
                                        .background(Color.theme.accent)
                                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                                        .foregroundColor(Color.theme.bright)
                                        .cornerRadius(6)
                                        .padding(.top, 10)
                                        .padding(.bottom)
                                }
                                    
                                    Divider()
                                    
                                    Text("Member List")
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
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.theme.secondarybackground)
                                .frame(height:480)
                            
                            VStack {
                                Text("Places")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .padding()
                                
                                TextField("Search Places", text: $searchPlaces)
                                    .background()
                                
                                Map(coordinateRegion: $region)
                                    .frame(width: 400, height: 300)
                                
                                Divider()
                                
                                Text("Places List")
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
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.theme.secondarybackground)
                                .frame(height:480)
                            
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
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.theme.bright)
                                .frame(height:175)
                            
                            VStack {
                                Text("Event PIN")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                
                                Text("299384")
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                                
                                Button {}
                            label: {
                                Text("copy PIN")
                                    .padding(10)
                                    .background(Color.red)
                                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(6)
                                    .padding(.top, 10)
                                    .padding(.bottom)
                            }
                                
                            }
                            
                            Spacer()
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
}
