//
//  ElectricityBillFormMockData.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation

class ElectricityBillFormMockData {
    static let mockData = ElectricityBillFormViewModel(
        model: ElectricityBillModel(renterUUID: "",
                                    monthOfStartDate: nil,
                                    monthOfEndDate: nil,
                                    previousReading: 0,
                                    currentReading: 0,
                                    totalReading: 0,
                                    billDate: .now,
                                    paidDate: nil),
        rentalModel: RentalModel(uuid: "uuid-1", name: "Hakob", renterName: "Hakob"))
}
