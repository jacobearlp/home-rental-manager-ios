//
//  CardViewModelMockData.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import Foundation

class CardViewModelMockData {
    static let cardViewModel = CardViewModel(
        model: CardModel(
            imageUrl: URL(string: "https://raw.githubusercontent.com/jigsawpieces/dog-api-images/main/boxer/n02108089_9778.jpg"),
            heading: "American Bulldog",
            subheading: "This breed is an American Bulldog",
            isFavorite: false,
            favoriteIconName: "heart"))

    static let noImageCardViewModel = CardViewModel(
        model: CardModel(
            imageUrl: nil,
            heading: "American Bulldog",
            subheading: "This breed is an American Bulldog",
            isFavorite: false,
            favoriteIconName: "heart"))
}
