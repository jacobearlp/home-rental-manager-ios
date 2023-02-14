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
            // Humana ba ka og buhat sa bill para sa petsa February 2023?
            SimpleReportView(heading: "Pahibalo: Humana ba ka og buhat sa bill para sa petsa \(Date.now.monthAndYear())?",
                             subheading: "+ Pindota kini para magbuhat og bag-o nga bill.",
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

            ForEach(viewModel.electricityBillList, id: \.self) { bill in
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
                            RoundRectangleButtonView(title: "Edit ✏️", color: nil) {
                                viewModel.onEditBill(electricityModel: bill)
                            }
                            .frame(width: 80)
                            RoundRectangleButtonView(title: "Delete 🗑", color: .red) {
                                viewModel.onDeleteBillPresentConfirmation(electricityModel: bill)
                            }
                            .frame(width: 90)
                        }
                        .padding(.top, 20)

                        if !bill.isPaid {
                            RoundRectangleButtonView(title: "Mark as Paid", color: nil) {
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
        .alert(isPresented: $viewModel.showAlert) {
            Alerts.alert(type: viewModel.alertType, action: viewModel.alertAction)
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
