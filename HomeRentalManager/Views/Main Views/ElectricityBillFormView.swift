//
//  ElectricityBillFormView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/13/23.
//

import SwiftUI

struct ElectricityBillFormView: View {
    @ObservedObject var viewModel: ElectricityBillFormViewModel
    @Binding var isPresented: Bool

    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 25)
                HStack(alignment: .top) {
                    Text("Electricity Bill for the month of \(viewModel.model.billDate.monthAndYear())")
                        .font(.title2)
                    Spacer()
                    RoundButtonView(iconName: "xmark", iconColor: .gray, action: close)
                }
                // Date Input Section
                dateInputSection

                // Reading Section
                electricityReadingSection

                InputFieldView(labelName: "Total Billing Amount",
                               textAlignment: .trailing,
                               textValue: $viewModel.totalAmount,
                               placeHolderText: .constant("100"))
                    .frame(height: 45)
                    .keyboardType(.numberPad)

                InputFieldView(labelName: "Final Bill Amount",
                               textAlignment: .trailing,
                               textValue: $viewModel.renterBillAmount,
                               placeHolderText: .constant("100"))
                    .frame(height: 45)
                    .disabled(true)

                Spacer()
                    .frame(height: 30)
                if viewModel.model.isPaid {
                    RoundRectangleButtonView(title: "Mark as Not Paid", action: viewModel.onMarkAsNotPaid)
                }
                RoundRectangleButtonView(title: "Save", action: viewModel.onSave)
                Spacer()
            }
            .padding(.horizontal, 24)
            .onChange(of: viewModel.totalAmount) { _ in
                viewModel.onCalculateTenantsBill()
            }
            .onChange(of: viewModel.totalRegistredReading) { _ in
                viewModel.onCalculateTenantsBill()
            }
            .onChange(of: viewModel.previousReading) { _ in
                viewModel.onCalculateTenantsBill()
            }
            .onChange(of: viewModel.currentReading) { _ in
                viewModel.onCalculateTenantsBill()
            }
            .onChange(of: viewModel.dismissView) { newValue in
                if newValue {
                    NotificationCenter.default.post(name: NSNotification.refreshElectricityHistory, object: nil)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        self.isPresented = false
                    }
                }
            }
            .onChange(of: viewModel.readingStartDate) { newValue in
                viewModel.model.readingStartDate = newValue
            }
            .onChange(of: viewModel.readingEndDate) { newValue in
                viewModel.model.readingEndDate = newValue
            }
            .onChange(of: viewModel.paidDate) { newValue in
                viewModel.model.paidDate =  newValue
            }
        }
    }

    private var electricityReadingSection: some View {
        VStack {
            InputFieldView(labelName: "Total Reading kwh",
                           textAlignment: .trailing,
                           textValue: $viewModel.totalRegistredReading,
                           placeHolderText: .constant("100"))
                .frame(height: 45)
                .keyboardType(.numberPad)
            InputFieldView(labelName: "Previous Reading kwh",
                           textAlignment: .trailing,
                           textValue: $viewModel.previousReading,
                           placeHolderText: .constant("100"))
                .frame(height: 45)
                .keyboardType(.numberPad)
            InputFieldView(labelName: "Current Reading kwh",
                           textAlignment: .trailing,
                           textValue: $viewModel.currentReading,
                           placeHolderText: .constant("140"))
                .frame(height: 45)
                .keyboardType(.numberPad)
        }
    }

    private var dateInputSection: some View {
        VStack {
            InputDateView(labelName: "Start Reading Date", dateValue: $viewModel.readingStartDate)
                .frame(height: 45)
            InputDateView(labelName: "End Reading Date", dateValue: $viewModel.readingEndDate)
                .frame(height: 45)
            InputDateView(labelName: "Billing Date", dateValue: $viewModel.model.billDate)
                .frame(height: 45)
            if viewModel.model.isPaid {
                InputDateView(labelName: "Payment Date", dateValue: $viewModel.paidDate)
                    .frame(height: 45)
            }
        }
    }

    private func close() {
        isPresented = false
    }
}

struct ElectricityBillFormView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ElectricityBillFormView(viewModel: ElectricityBillFormMockData.mockData, isPresented: .constant(false))
    }
}
