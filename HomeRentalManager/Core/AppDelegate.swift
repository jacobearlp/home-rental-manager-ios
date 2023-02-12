//
//  AppDelegate.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import UIKit
import RealmSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    static var realmManager: Realm = try! Realm()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        true
    }
}
