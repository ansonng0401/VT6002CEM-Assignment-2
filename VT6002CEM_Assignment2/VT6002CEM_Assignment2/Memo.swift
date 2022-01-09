//
//  Memo.swift
//  VT6002CEM_Assignment2
//
//  Created by Anson on 10/1/2022.
//

import CoreData
@objc(Memo)
class Memo: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?

}
