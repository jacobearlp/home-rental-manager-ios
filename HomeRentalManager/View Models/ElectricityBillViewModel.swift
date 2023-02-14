//
//  ElectricityBillViewModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import Foundation
import RealmSwift

class ElectricityBillViewModel: ObservableObject {
    @Published var isElectricityFormPresented = false
    @Published var electricityFormViewModel = ElectricityBillFormViewModel()

    @Published var electricityBillList: [ElectricityBillModel] = []

    let rentalModel: RentalModel

    init(rentalModel: RentalModel? = nil) {
        self.rentalModel = rentalModel ?? RentalModel(name: "", renterName: "")
        populateElectricityBillList()
    }

    func presentElectricityForm() {
        electricityFormViewModel = ElectricityBillFormViewModel(
            model: ElectricityBillModel(
                renterUUID: "",
                previousReading: 0,
                currentReading: 0,
                totalReading: 0,
                billDate: .now),
            rentalModel: rentalModel
        )
        isElectricityFormPresented = true
    }

    func markAsPaid(electricityModel: ElectricityBillModel) {
        var billModel = electricityModel
        billModel.paidDate = .now
        let realm = AppDelegate.realmManager
        do {
            try realm.write {
                realm.add(billModel.managedObject(), update: .modified)
            }
            if let index = electricityBillList.firstIndex(where: { $0.uuid ==  electricityModel.uuid }) {
                electricityBillList[index] = billModel
                let updatedBills = electricityBillList
                electricityBillList = updatedBills
            }
        } catch {
            print("[ElectricityBillViewModel.markAsPaid] error: \(error)")
        }
    }

    func onEditBill(electricityModel: ElectricityBillModel) {
        electricityFormViewModel = ElectricityBillFormViewModel(
            model: electricityModel,
            rentalModel: rentalModel
        )
        isElectricityFormPresented = true
    }

    func onReceiveRefreshBillingListNotification() {
        populateElectricityBillList()
    }

    private func populateElectricityBillList() {
        let realm = AppDelegate.realmManager
        let bills = realm.objects(ElectricityBillObjectModel.self)
                    .where { $0.renterUUID == rentalModel.uuid }
                    .sorted(by: { $0.billDate  > $1.billDate })
                    .map { ElectricityBillModel(managedObject: $0) }
        electricityBillList = Array(bills[..<11])
    }
}
