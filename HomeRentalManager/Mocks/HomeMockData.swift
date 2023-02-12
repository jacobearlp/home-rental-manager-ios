//
//  HomeMockData.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import Foundation

class HomeMockData {
    static let mockData = HomeViewModel(rentalList: [
        RentalModel(name: "House 1, Room 1 (Dapit ila monching)", renterName: "Jacob 1"),
        RentalModel(name: "House 1, Room 2 (Dapit ila monching)", renterName: "Jacob 2"),
        RentalModel(name: "House 1, Room 3 (Dapit ila monching)", renterName: "Jacob 3"),
        RentalModel(name: "House 2, Room 1 (Dapit sa kapilya)", renterName: "Koby 1"),
        RentalModel(name: "House 2, Room 2 (Dapit sa kapilya)", renterName: "Koby 2"),
        RentalModel(name: "House 3 (Likod balay)", renterName: "Aubrey"),
        RentalModel(name: "House 4 (Balay ni Dely)", renterName: "Heart")
    ])
}
