//
//  HomeViewModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var rentalList: [RentalModel]
    @Published var presentRentalFormView = false
    @Published var rentalViewFormViewModel = RentalFormViewModel(model: RentalModel(name: "", renterName: ""))

    init() {
        self.rentalList = []
    }

    init(rentalList: [RentalModel]) {
        self.rentalList = rentalList
    }

    func openNewRentalForm() {
        rentalViewFormViewModel = RentalFormViewModel(model: RentalModel(name: "", renterName: ""))
        presentRentalForm()
    }

    func openExistingRentalForm(rentalModel: RentalModel) {
        rentalViewFormViewModel = RentalFormViewModel(model: rentalModel)
        presentRentalForm()
    }

    func onAppearBlock() {
        onRetrieveRentalList()
    }

    func refreshHome() {
        onRetrieveRentalList()
    }

    private func presentRentalForm() {
        presentRentalFormView = true
    }

    private func onRetrieveRentalList() {
        let realm = AppDelegate.realmManager
        let rentalObjectModels = realm.objects(RentalObjectModel.self)
        rentalList = rentalObjectModels.map { RentalModel(managedObject: $0) }
    }
}
