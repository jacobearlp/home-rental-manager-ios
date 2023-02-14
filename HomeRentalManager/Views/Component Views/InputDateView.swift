//
//  InputDateView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import SwiftUI

struct InputDateView: View {
    var labelName: String
    @Binding var dateValue: Date
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
                DatePicker("", selection: $dateValue, displayedComponents: .date)
            }
            .padding(.horizontal, 15)
        }
    }
}

struct InputDateView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        InputDateView(labelName: "Reading Start Date", dateValue: .constant(Date.now))
            .frame(height: 45)
    }
}
