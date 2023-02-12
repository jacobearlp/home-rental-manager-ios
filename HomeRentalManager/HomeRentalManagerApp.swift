//
//  HomeRentalManagerApp.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

@main
struct HomeRentalManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            StartingView()
        }
    }
}
