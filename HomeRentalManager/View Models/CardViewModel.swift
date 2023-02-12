//
//  CardViewModel.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import Foundation

class CardViewModel: ObservableObject {
    var model: CardModel

    init(model: CardModel) {
        self.model = model
    }
}
