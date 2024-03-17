//
//  SideMenuRowView.swift
//  CashControl
//
//  Created by J. DeWeese on 3/17/24.
//

import SwiftUI

struct SideMenuRowView: View {
    // MARK:  PROPERTIES
    @Binding var selectedOption: SideMenuOptionModel?
    let option: SideMenuOptionModel
    private var isSelected: Bool {
        return selectedOption == option
    }
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.large)
                .imageScale(.medium)
            
            Text(option.sideRowTitle)
                .font(.subheadline)
                .fontDesign(.serif)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 215, height: 45)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    SideMenuRowView(selectedOption: .constant(.profile), option: .profile)
}
