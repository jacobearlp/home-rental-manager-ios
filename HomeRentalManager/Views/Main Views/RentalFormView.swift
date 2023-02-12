//
//  RentalFormView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import SwiftUI

struct RentalFormView: View {
    @ObservedObject var viewModel: RentalFormViewModel
    @Binding var isPresented: Bool

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Rental Form")
                        .font(.title)
                    Spacer()
                    Button("Close", action: { isPresented = false })
                }
                .padding(.top, 25)

                InputFieldView(labelName: "Room Name",
                               textValue: $viewModel.model.name,
                               placeHolderText: .constant("House 1, Room 1"))
                .frame(height: 45)
                
                InputFieldView(labelName: "Renter Name",
                               textValue: $viewModel.model.renterName,
                               placeHolderText: .constant("Aida Hu"))
                .frame(height: 45)

                Button(action: viewModel.onSave) {
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
                            Text("Save")
                                .foregroundColor(.white)
                        )
                        .frame(height: 45)
                }
                .padding(.top, 30)
            }
            .padding(.horizontal, 24)
        }
        .onChange(of: viewModel.dismissView) { dismiss in
            guard dismiss else { return }
            isPresented = false
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.refreshHome, object: nil)
            }
        }
    }
}

struct RentalFormView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        RentalFormView(viewModel: RentalFormMockData.mockData,
                       isPresented: .constant(true))
    }
}
