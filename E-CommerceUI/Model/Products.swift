//
//  Products.swift
//  E-CommerceUI
//
//  Created by KANISHK VIJAYWARGIYA on 31/08/21.
//

import SwiftUI

// Product model and sample data
struct Product: Identifiable {
    var id = UUID().uuidString
    var productImage: String
    var productTitle: String
    var productPrice: String
    var productBG: Color
    var isLiked: Bool = false
    var productRating: Int
}

var products = [
    Product(productImage: "shoe3", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color("ShoeBG1"), productRating: 4),
    Product(productImage: "shoe3", productTitle: "Excee Sneakers", productPrice: "$260.0", productBG: Color("ShoeBG2"), productRating: 3),
    Product(productImage: "shoe3", productTitle: "Air Max Motion 2", productPrice: "$290.0", productBG: Color("ShoeBG3"), productRating: 5),
    Product(productImage: "shoe3", productTitle: "Leather Sneakers", productPrice: "$270.0", productBG: Color("ShoeBG4"), productRating: 4)
]
