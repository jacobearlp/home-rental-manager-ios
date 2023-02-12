//
//  AppColor.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

enum AppColor: String, CaseIterable {

    // View Colors                          // RGB Alpha
    case vistaWhite                         // 0xFBFAFA 1.0

    var cgColor: CGColor {
        UIColor(named: rawValue)!.cgColor
    }

    var uiColor: UIColor {
        UIColor(named: rawValue)!
    }

    var color: Color {
        Color(rawValue)
    }
}
