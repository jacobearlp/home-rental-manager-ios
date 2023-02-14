//
//  ElectricityBillFormViewModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation

class ElectricityBillFormViewModel: ObservableObject {
    @Published var model: ElectricityBillModel
    @Published var totalRegistredReading = ""
    @Published var previousReading = ""
    @Published var currentReading = ""
    @Published var readingStartDate = Date()
    @Published var readingEndDate = Date()
    @Published var paidDate = Date()
    @Published var totalAmount = ""
    @Published var renterBillAmount = ""
    @Published var dismissView = false

    let rentalModel: RentalModel

    init(model: ElectricityBillModel? = nil, rentalModel: RentalModel? = nil) {
        self.rentalModel = rentalModel ?? RentalModel(name: "", renterName: "")
        self.model = model ?? ElectricityBillModel(renterUUID: "", previousReading: 0, currentReading: 0, totalReading: 0, billDate: .now)
        self.model.renterUUID = self.rentalModel.uuid
        setUpInputs()
    }

    func onSave() {
        let realm = AppDelegate.realmManager
        do {
            try realm.write {
                realm.add(model.managedObject(), update: .modified)
            }
            dismissView = true
        } catch {
            print("[ElectricityBillFormViewModel.onSave] error: \(error)")
        }
    }

    func onCalculateTenantsBill() {
        model.totalReading = Int(totalRegistredReading) ?? 0
        model.previousReading = Int(previousReading) ?? 0
        model.currentReading = Int(currentReading) ?? 0
        model.totalBillAmount = Double(totalAmount) ?? 0
        let reading = model.currentReading - model.previousReading
        let totalAmount = (Double(reading) * model.totalBillAmount) / Double(model.totalReading)
        renterBillAmount = "\(totalAmount.round(to: 2))"
        model.renterBillAmount = totalAmount.round(to: 2)
    }

    func onMarkAsNotPaid() {
        let realm = AppDelegate.realmManager
        model.paidDate = nil
        do {
            try realm.write {
                realm.add(model.managedObject(), update: .modified)
            }
            dismissView = true
        } catch {
            print("[ElectricityBillFormViewModel.onSave] error: \(error)")
        }
    }

    private func setUpInputs() {
        totalAmount = "\(model.totalBillAmount)"
        totalRegistredReading = "\(model.totalReading)"
        previousReading = "\(model.previousReading)"
        currentReading = "\(model.currentReading)"
        if let readingStartDate = model.readingStartDate {
            self.readingStartDate = readingStartDate
        }
        if let readingEndDate = self.model.readingEndDate {
            self.readingEndDate = readingEndDate
        }
        if let paidDate = self.model.paidDate {
            self.paidDate = paidDate
        }
        renterBillAmount = "\(model.renterBillAmount)"
    }
}
