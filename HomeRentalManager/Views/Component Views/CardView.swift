//
//  CardView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    var width: CGFloat

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                DCCachedAsyncImage(url: viewModel.model.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 130)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    Rectangle()
                        .fill(.teal)
                        .frame(height: 130)
                        .cornerRadius(12)
                }
            }
            .overlay(
                VStack {
                    Spacer()
                        .frame(height: 10)
                    HStack {
                        Spacer()
                        RoundButtonView(iconName: "heart.fill", action: {  })
                    }
                    .padding(.trailing, 10)
                    Spacer()
                }
            )
            .padding(.horizontal, 10)
            .padding(.top, 12)

            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.model.heading)
                        .font(.title2)
                        .lineLimit(3)
                    Spacer()
                }
                HStack {
                    Text(viewModel.model.subheading)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                    Spacer()
                }
            }
            .padding(.horizontal, 10)

            Spacer()
        }
        .frame(maxWidth: width, minHeight: 250, maxHeight: 260)
        .background(.white)
        .cornerRadius(15)
    }
}

struct CardView_PreviewProvider: PreviewProvider {
    static let cellWidth = (ViewGeometry.fullScreenWidth - 10) / 2
    static var previews: some View {
        HStack {
            CardView(viewModel: CardViewModelMockData.cardViewModel, width: cellWidth)
                .padding(.vertical, 10)
            Spacer()
            CardView(viewModel: CardViewModelMockData.noImageCardViewModel, width: cellWidth)
                .padding(.vertical, 10)
        }
        .background(AppColor.vistaWhite.color)
    }
}
