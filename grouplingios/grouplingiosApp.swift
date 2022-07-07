//
//  grouplingiosApp.swift
//  grouplingios
//
//  Created by Liz Wait on 6/25/22.
//

import SwiftUI

@main
struct grouplingiosApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NewGroupView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
