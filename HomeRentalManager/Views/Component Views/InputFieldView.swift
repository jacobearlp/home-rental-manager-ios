//
//  InputFieldView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import SwiftUI

struct InputFieldView: View {
    var labelName: String
    @Binding var textValue: String
    @Binding var placeHolderText: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.white)
                .shadow(color: .gray.opacity(0.5),
                        radius: 15,
                        x: 2,
                        y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5), lineWidth: 0.25)
                )

            HStack {
                Text(labelName)
                TextField(placeHolderText, text: $textValue)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 15)
        }
    }
}

struct InputFieldView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        InputFieldView(labelName: "Name", textValue: .constant(""), placeHolderText: .constant(""))
            .frame(height: 45)
    }
}

