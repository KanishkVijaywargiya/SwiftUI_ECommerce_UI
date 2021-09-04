//
//  BaseViewModel.swift
//  E-CommerceUI
//
//  Created by KANISHK VIJAYWARGIYA on 31/08/21.
//

import SwiftUI

class BaseViewModel: ObservableObject {
    // Tab bar
    @Published var currentTab: Tab = .Home
    @Published var homeTab = "Sneakers"
    
    // Detail View Properties
    @Published var currentProduct: Product?
    @Published var showDetail = false
}

// Enum Case for Tab Items
enum Tab: String {
    case Home = "home"
    case Heart = "heart"
    case ClipBoard = "clipboard"
    case Person = "person"
}
