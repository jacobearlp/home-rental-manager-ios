//
//  RentalFormViewModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import Foundation

class RentalFormViewModel: ObservableObject {
    @Published var model: RentalModel
    @Published var dismissView = false

    init(model: RentalModel) {
        self.model = model
    }

    func onSave() {
        let realm = AppDelegate.realmManager
        do {
            try realm.write({
                realm.add(model.managedObject(), update: .modified)
            })
            dismissView = true
        } catch {
            print("[RentalFormViewModel.onSave] error: \(error)")
        }
    }
}
