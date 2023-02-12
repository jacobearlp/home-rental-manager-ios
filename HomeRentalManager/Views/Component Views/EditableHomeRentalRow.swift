//
//  EditableHomeRentalRow.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/12/23.
//

import SwiftUI

struct EditableHomeRentalRowModel {
    var heading: String
    var subheading: String

    init(heading: String, subheading: String) {
        self.heading = heading
        self.subheading = subheading
    }

    init(rentalModel: RentalModel) {
        self.init(heading: rentalModel.name, subheading: rentalModel.renterName)
    }
}

struct EditableHomeRentalRow: View {
    var model: EditableHomeRentalRowModel
    var editAction: () -> Void

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(model.heading)
                    Spacer()
                }
                HStack {
                    Text(model.subheading)
                    Spacer()
                }
            }
            Spacer()
            HStack(alignment: .center) {
                Button("✏️", action: editAction)
            }
            .frame(width: 50, height: 50)
        }
    }
}

struct EditableHomeRentalRow_PreviewProvider: PreviewProvider {
    static var previews: some View {
        EditableHomeRentalRow(model: EditableHomeRentalRowModel(heading: "House 1, Room 1",
                                                                subheading: "Aida Hu"),
                              editAction: {})
    }
}
