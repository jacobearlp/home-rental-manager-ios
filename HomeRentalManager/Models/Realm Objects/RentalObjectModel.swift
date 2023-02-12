//
//  RentalObjectModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import Foundation
import RealmSwift

protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

class RentalObjectModel: Object {
    @objc dynamic var uuid: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var renterName: String = ""

    override class func primaryKey() -> String? {
        "uuid"
    }
}
