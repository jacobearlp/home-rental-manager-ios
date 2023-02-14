//
//  ElectricityBillModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation

struct ElectricityBillModel {
    var uuid: String // Serves as unique id
    var renterUUID: String // RentalModel.uuid
    var readingStartDate: Date? // Start date of reading
    var readingEndDate: Date? // End date of reading
    var previousReading: Int // Previous reading, it could be from previous month
    var currentReading: Int // To be inputed by the user
    var totalReading: Int
    var totalBillAmount: Double // Total Bill Amount from Veco's Bill
    var renterBillAmount: Double // ((Current reading - previous reading) * totalBillAmount) / totalReading
    var billDate: Date
    var paidDate: Date?

    var isPaid: Bool {
        paidDate != nil
    }

    init(uuid: String = UUID().uuidString,
         renterUUID: String,
         monthOfStartDate: Date? = nil,
         monthOfEndDate: Date? = nil,
         previousReading: Int,
         currentReading: Int,
         totalReading: Int,
         totalBillAmount: Double = 0,
         renterBillAmount: Double = 0,
         billDate: Date,
         paidDate: Date? = nil) {
        self.uuid = uuid
        self.renterUUID = renterUUID
        self.readingStartDate = monthOfStartDate
        self.readingEndDate = monthOfEndDate
        self.previousReading = previousReading
        self.currentReading = currentReading
        self.totalReading = totalReading
        self.totalBillAmount = totalBillAmount
        self.renterBillAmount = renterBillAmount
        self.billDate = billDate
        self.paidDate = paidDate
    }
}

extension ElectricityBillModel: Persistable {
    init(managedObject: ElectricityBillObjectModel) {
        uuid = managedObject.uuid
        renterUUID = managedObject.renterUUID
        readingStartDate = managedObject.readingStartDate
        readingEndDate = managedObject.readingEndDate
        previousReading = managedObject.previousReading
        currentReading = managedObject.currentReading
        totalReading = managedObject.totalReading
        totalBillAmount = managedObject.totalBillAmount
        renterBillAmount = managedObject.renterBillAmount
        billDate = managedObject.billDate
        paidDate = managedObject.paidDate
    }

    func managedObject() -> ElectricityBillObjectModel {
        let electricityBillObject = ElectricityBillObjectModel()
        electricityBillObject.uuid = uuid
        electricityBillObject.renterUUID = renterUUID
        electricityBillObject.readingStartDate = readingStartDate
        electricityBillObject.readingEndDate =  readingEndDate
        electricityBillObject.previousReading = previousReading
        electricityBillObject.currentReading = currentReading
        electricityBillObject.totalReading = totalReading
        electricityBillObject.totalBillAmount = totalBillAmount
        electricityBillObject.renterBillAmount = renterBillAmount
        electricityBillObject.billDate = billDate
        electricityBillObject.paidDate = paidDate
        return electricityBillObject
    }
}
