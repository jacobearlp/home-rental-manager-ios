//
//  RoundButtonView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct RoundButtonView: View {
    let iconName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Image(systemName: iconName)
                    .foregroundColor(.teal)
            }
            .frame(width: 30, height: 30, alignment: .center)
            .overlay(
                Circle()
                    .stroke(.gray.opacity(0.5), lineWidth: 0.25)
            )
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(
                        color: .gray.opacity(0.5),
                        radius: 4,
                        x: 2,
                        y: 4
                    )
            )
        }
    }
}

struct RoundButtonView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RoundButtonView(iconName: "heart", action: { })
            .frame(width: 30, height: 30, alignment: .center)
    }
}
