//
//  MainTabsView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct MainTabsView: View {
    @State private var selectedTab = TabType.home

    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                Text("Home")
            }
            .tabItem { TabType.home.tabView }
            .tag(TabType.home)

            VStack {
                Text("Favorites")
            }
            .tabItem { TabType.favorites.tabView }
            .tag(TabType.favorites)
        }
    }
}

extension MainTabsView {
    enum TabType: String {
        case home, favorites

        var tabView: some View {
            VStack {
                Text(rawValue.capitalized)
            }
        }
    }
}

struct MainTabsView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        MainTabsView()
    }
}