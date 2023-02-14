//
//  RoundRectangleButtonView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import SwiftUI

struct RoundRectangleButtonView: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue)
                .shadow(color: .gray.opacity(0.5),
                        radius: 15,
                        x: 2,
                        y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 0.25)
                )
                .overlay(
                    Text(title)
                        .foregroundColor(.white)
                )
                .frame(height: 45)
        }
    }
}

struct RoundRectangleButtonView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RoundRectangleButtonView(title: "Save", action: {})
    }
}
