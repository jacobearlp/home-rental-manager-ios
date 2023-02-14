//
//  Date+Extensions.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation

extension Date {
    func monthAndYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }
}
