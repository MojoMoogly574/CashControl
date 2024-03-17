//
//  SideMenuView.swift
//  CashControl
//
//  Created by J. DeWeese on 3/16/24.
//

import SwiftUI

struct SideMenuView: View {
    //MARK:  PROPERTIES
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel?
    
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                HStack{
                    VStack(alignment: .leading, spacing: 32){
                        SideMenuHeaderView()
                        VStack{
                            ForEach(SideMenuOptionModel.allCases) { option in
                                Button(action: {
                                    onOptionTapped(option)
                                }, label: {
                                    SideMenuRowView(selectedOption: $selectedOption, option: option)
                                })
                            }
                        }
                        Spacer()
                    }
                    .toolbar(.hidden, for: .navigationBar)
                    .frame(width: 270, alignment: .leading)
                    .padding(.horizontal)
                    .background(.background)
                    Spacer()
                }.transition(.move(edge: .leading))
            }
        }
        
        .animation(.easeInOut, value: isShowing)
    }
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        HapticManager.notification(type: .success)
        isShowing = false
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
