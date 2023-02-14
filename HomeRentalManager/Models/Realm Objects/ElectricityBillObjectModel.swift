//
//  ElectricityBillObjectModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation
import RealmSwift

class ElectricityBillObjectModel: Object {
    @objc dynamic var uuid: String = "" // Serves as unique id
    @objc dynamic var renterUUID: String = "" // RentalModel.uuid
    @objc dynamic var readingStartDate: Date? = nil // Start date of reading
    @objc dynamic var readingEndDate: Date? = nil // End date of reading
    @objc dynamic var previousReading: Int = 0 // Previous reading, it could be from previous month
    @objc dynamic var currentReading: Int = 0 // To be inputed by the user
    @objc dynamic var totalReading: Int = 0
    @objc dynamic var totalBillAmount: Double = 0 // Total Bill Amount from Veco's Bill
    @objc dynamic var renterBillAmount: Double = 0 // ((Current reading - previous reading) * totalBillAmount) / totalReading
    @objc dynamic var billDate: Date = Date()
    @objc dynamic var paidDate: Date? = nil

    override class func primaryKey() -> String? {
        "uuid"
    }
}

