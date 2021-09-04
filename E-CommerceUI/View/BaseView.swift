//
//  BaseView.swift
//  E-CommerceUI
//
//  Created by KANISHK VIJAYWARGIYA on 31/08/21.
//

import SwiftUI

struct BaseView: View {
    @StateObject var baseData = BaseViewModel()
    
    // Hiding tab bar...
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $baseData.currentTab) {
            Home()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Home)
            Text("Heart")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Heart)
            Text("Clipboard")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.ClipBoard)
            Text("Person")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.04))
                .tag(Tab.Person)
        }
        .overlay(
            // Custom tab bar
            HStack(spacing: 0) {
                // tab buttons
                tabButton(Tab: .Home)
                tabButton(Tab: .Heart)
                    .offset(x: -10)
                
                // Center curved button
                Button(action: {}) {
                    Image("cart")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
                        .offset(x: -1)
                        .padding(18)
                        .background(Color("UltraPink"))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                }
                .offset(y: -30)
                
                tabButton(Tab: .ClipBoard)
                    .offset(x: 10)
                tabButton(Tab: .Person)
            }
            .background(
                Color.white
                    .clipShape(CustomCurveShape())
                    .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                    .ignoresSafeArea(.container, edges: .bottom)
            )
            // hiding tab Bar when detail view opens
            .offset(y: baseData.showDetail ? 200 : 0)
            ,alignment: .bottom
        )
    }
    
    @ViewBuilder
    func tabButton(Tab: Tab) -> some View {
        Button(action: {
            withAnimation {
                baseData.currentTab = Tab
            }
        }) {
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color("UltraPink") : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
