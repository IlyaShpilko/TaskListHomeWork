//
//  AddText+CoreDataProperties.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/21/21.
//
//

import Foundation
import CoreData


extension AddText {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AddText> {
        return NSFetchRequest<AddText>(entityName: "AddText")
    }

    @NSManaged public var writeText: String?
    @NSManaged public var idNumber: Int64

}

extension AddText : Identifiable {

}
