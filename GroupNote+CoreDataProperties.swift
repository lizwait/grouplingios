//
//  GroupNote+CoreDataProperties.swift
//  grouplingios
//
//  Created by Liz Wait on 7/9/22.
//
//

import Foundation
import CoreData


extension GroupNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupNote> {
        return NSFetchRequest<GroupNote>(entityName: "GroupNote")
    }

    @NSManaged public var text: String?

}

extension GroupNote : Identifiable {

}
