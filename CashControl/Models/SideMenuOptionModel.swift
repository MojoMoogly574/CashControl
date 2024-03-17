//
//  SideMenuOptionModel.swift
//  CashControl
//
//  Created by J. DeWeese on 3/17/24.
//

import Foundation


enum SideMenuOptionModel: Int, CaseIterable {
    
    case profile
    case settings
    case help
    case about
    case privacy
    
    
    var sideRowTitle: String {
        switch self {
        case .profile:
            return "Profile"
        case.settings:
            return "Settings & Theme"
        case.help:
            return "Help"
        case.about:
            return "About Us"
        case.privacy:
            return "Privacy & Security"
        }
    }
    //SF Symbols
    var systemImageName: String {
        switch self {
        case .profile:
            return "person.circle"
        case.settings:
            return "gear.circle"
        case.help:
            return "questionmark.circle"
        case.about:
            return "info.circle"
        case .privacy:
            return "lock.shield"
        }
    }
    
}
extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue }
}
