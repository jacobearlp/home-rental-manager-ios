//
//  MainTabsView.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

import SwiftUI

struct MainTabsView: View {
    @State private var selectedTab = TabType.home
    @ObservedObject private var homeViewModel = HomeViewModel()

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView(content: {
                HomeView(viewModel: homeViewModel)
            })
            .tabItem { TabType.home.tabView }
            .tag(TabType.home)

            VStack {
                Text("Reports")
                Text("⚠️In Development..⚠️")
            }
            .tabItem { TabType.reports.tabView }
            .tag(TabType.reports)
        }
    }
}

extension MainTabsView {
    enum TabType: String {
        case home, reports

        var iconName: String {
            switch self {
            case .home:
                return "house"
            case .reports:
                return "chart.bar"
            }
        }

        var tabView: some View {
            VStack {
                Image(systemName: iconName)
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
