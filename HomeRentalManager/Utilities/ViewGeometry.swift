//
//  ViewGeometry.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

/// Convenience abstraction for some common sizing definitions
struct ViewGeometry {
    static let fullScreenWidth = UIScreen.main.bounds.width
    static let fullScreenHeight = UIScreen.main.bounds.height

    static var statusBarHeight: CGFloat {
        // On preview window is empty
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first

        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 44
    }

    static var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow})
                .first

            return keyWindow?.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
    }

    static var simpleVideoHeight: Double {
        let videoRatio = CGFloat(426)/CGFloat(360)
        return Double(fullScreenWidth * videoRatio)
    }
}
