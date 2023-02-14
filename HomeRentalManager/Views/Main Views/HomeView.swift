//
//  HomeView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.rentalList, id: \.self) { data in
                    EditableHomeRentalRow(model: EditableHomeRentalRowModel(rentalModel: data)) {
                        viewModel.openExistingRentalForm(rentalModel: data)
                    }
                    .onTapGesture {
                        viewModel.openElectricityBillView(rentalModel: data)
                    }
                    .padding(.horizontal, 24)

                    if data.uuid != viewModel.rentalList.last?.uuid {
                        Rectangle()
                            .fill()
                            .frame(height: 0.5)
                            .padding(.horizontal, 24)
                    }
                }

                NavigationLink(isActive: $viewModel.presentElectricityBillView) {
                    ElectricityBillView(viewModel: viewModel.electricityBillViewModel)
                } label: {
                    EmptyView()
                }
            }
        }
        .frame(width: ViewGeometry.fullScreenWidth)
        .navigationTitle("Home")
        .toolbar {
            Button("+ New Rental", action: viewModel.openNewRentalForm)
        }
        .popover(isPresented: $viewModel.presentRentalFormView) {
            RentalFormView(viewModel: viewModel.rentalViewFormViewModel,
                           isPresented: $viewModel.presentRentalFormView)
        }
        .onAppear(perform: viewModel.onAppearBlock)
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.refreshHome)) { _ in
            viewModel.refreshHome()
        }
    }
}

struct HomeView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(viewModel: HomeMockData.mockData)
        }
    }
}
