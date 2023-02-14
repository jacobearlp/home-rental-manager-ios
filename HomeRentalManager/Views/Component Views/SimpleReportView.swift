//
//  SimpleReportView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import SwiftUI

struct SimpleReportView: View {
    var heading: String
    var subheading: String
    var backgroundColor: Color

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(heading)
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text(subheading)
                        .font(.title2)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 10)
            }
            .padding([.vertical, .horizontal], 12)
            .background(backgroundColor)
        }
        .cornerRadius(15)
    }
}

struct SimpleReportView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        SimpleReportView(heading: "Bill for the month from December 2022 - January 2023 was PAID at January 5, 2023",
                         subheading: "₱ 450.00", backgroundColor: .green)
            .padding(.horizontal, 24)
    }
}
