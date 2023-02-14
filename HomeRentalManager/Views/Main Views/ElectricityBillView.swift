//
//  ElectricityBillView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import SwiftUI

struct ElectricityBillView: View {
    @ObservedObject var viewModel: ElectricityBillViewModel

    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 15)

            HStack {
                Text("\(viewModel.rentalModel.renterName)\n\(viewModel.rentalModel.name)")
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal, 24)

            // Report View that will show if tenant already paid the bill
//            SimpleReportView(heading: "Bill for the month from December 2022 - January 2023 was PAID at January 5, 2023",
//                             subheading: "₱ 450.00",
//                             backgroundColor: .green)
//            .padding(.horizontal, 24)

            // Display message if admin forgot to input new reading
            SimpleReportView(heading: "Reminder: February 2023 is coming have you got the electricity reading?",
                             subheading: "Tap to Create",
                             backgroundColor: .orange)
            .onTapGesture(perform: viewModel.presentElectricityForm)
            .padding(.horizontal, 24)

            Spacer().frame(height: 25)

            // List the previous bills for the last 12 months
            billListSection
        }
        .navigationTitle("Electricity Bill⚡️")
        .popover(isPresented: $viewModel.isElectricityFormPresented) {
            ElectricityBillFormView(viewModel: viewModel.electricityFormViewModel,
                                    isPresented: $viewModel.isElectricityFormPresented)
        }
    }

    private var billListSection: some View {
        VStack {
            HStack {
                Text("Bill History")
                    .font(.title)
                Spacer()
            }
            ForEach(viewModel.electricityBillList.indices) { index in
                let bill = viewModel.electricityBillList[index]
                VStack {
                    VStack {
                        HStack {
                            Text(bill.billDate.monthAndYear() + "\(bill.isPaid ? " (PAID)" : "")")
                                .font(.title2)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        HStack {
                            Text("₱ " + bill.renterBillAmount.priceWithSeparator())
                                .font(.body)
                                .foregroundColor(.white)
                            Spacer()
                            RoundRectangleButtonView(title: "Edit ✏️") {
                                viewModel.onEditBill(electricityModel: bill)
                            }
                            .frame(width: 80)
                        }
                        .padding(.top, 20)

                        if !bill.isPaid {
                            RoundRectangleButtonView(title: "Mark as Paid") {
                                viewModel.markAsPaid(electricityModel: bill)
                            }
                        }
                    }
                    .padding(10)
                }
                .background(bill.paidDate != nil ? Color.green.opacity(0.8) : Color.red.opacity(0.5))
                .cornerRadius(15)
            }
        }
        .padding(.horizontal, 24)
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.refreshElectricityHistory)) { _ in
            viewModel.onReceiveRefreshBillingListNotification()
        }
    }
}

struct ElectricityBillView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ElectricityBillView(viewModel: ElectricityBillMockData.mockData)
        }
    }
}
