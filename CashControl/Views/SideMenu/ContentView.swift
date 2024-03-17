//
//  ContentView.swift
//  CashControl
//
//  Created by J. DeWeese on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab, content:  {
                    ProfileView()
                        .tag(0)
                    SettingsView()
                        .tag(1)
                    HelpView()
                        .tag(2)
                    AboutView()
                        .tag(3)
                    PrivacyView()
                        .tag(4)
                })
                //Side View
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            //Toolbar
                .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showMenu.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                        })
                    }
                }
        }
    }
}
#Preview {
    ContentView()
}

