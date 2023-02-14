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
    @Published var showAlert = false
    @Published var alertType = AlertType.notImplemented

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

    private var electricityBillToDelete: ElectricityBillModel?
    func onDeleteBillPresentConfirmation(electricityModel: ElectricityBillModel) {
        electricityBillToDelete = electricityModel
        alertType = .confirmDeleteElectricityBill
        showAlert = true
    }

    func alertAction() {
        if alertType == .confirmDeleteElectricityBill {
            guard let electricityBillToDelete else { return }
            deleteBill(electricityModel: electricityBillToDelete)
        }
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
        let lastIndex = bills.count >= 11 ? 11 : bills.count - 1
        if lastIndex < 0 {
             electricityBillList = []
        } else {
            electricityBillList = Array(bills[...lastIndex])
        }
    }

    private func deleteBill(electricityModel: ElectricityBillModel) {
        let realm = AppDelegate.realmManager
        do {
            let billFromRealm = realm.objects(ElectricityBillObjectModel.self)
                .where { $0.uuid == electricityModel.uuid }
                .first
            if let billFromRealm {
                try realm.write {
                    realm.delete(billFromRealm)
                }
                populateElectricityBillList()
            }
        } catch {
            print("[ElectricityBillViewModel.onDeleteBill] error: \(error)")
        }
    }
}
