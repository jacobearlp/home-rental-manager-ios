//
//  RentalModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import Foundation

struct RentalModel {
    var uuid: String
    var name: String
    var renterName: String

    init(uuid: String, name: String, renterName: String) {
        self.uuid = uuid
        self.name = name
        self.renterName = renterName
    }

    init(name: String, renterName: String) {
        self.init(uuid: UUID().uuidString, name: name, renterName: renterName)
    }
}

extension RentalModel: Hashable {}

extension RentalModel: Persistable {
    init(managedObject: RentalObjectModel) {
        self.init(uuid: managedObject.uuid,
                  name: managedObject.name,
                  renterName: managedObject.renterName)
    }

    func managedObject() -> RentalObjectModel {
        let rentalObjectModel = RentalObjectModel()
        rentalObjectModel.uuid = uuid
        rentalObjectModel.name = name
        rentalObjectModel.renterName = renterName
        return rentalObjectModel
    }
}
