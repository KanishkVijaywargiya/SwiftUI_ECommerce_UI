//
//  HomeView.swift
//  E-CommerceUI
//
//  Created by KANISHK VIJAYWARGIYA on 31/08/21.
//

import SwiftUI

struct Home: View {
    // Matched geometry effect
    @Namespace var animation
    @EnvironmentObject var baseData: BaseViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                HStack {
                    Button(action: {}) {
                        Image("menu")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                    }
                    
                }
                .foregroundColor(.black)
                .overlay(
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56, height: 56)
                )
                
                HStack {
                    Text("Our Products")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Button(action: {}) {
                        HStack(spacing: 3) {
                            Text("Sort by")
                                .font(.caption.bold())
                            Image(systemName: "chevron.down")
                                .font(.caption.bold())
                        }
                        .foregroundColor(.gray)
                    }
                }
                .padding(.top, 22)
                
                // Custom Segment Tab
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 18) {
                        // Segment Button
                        segmentButton(image: "shoe3", title: "Sneakers")
                        segmentButton(image: "watch", title: "Watch")
                        segmentButton(image: "backpack", title: "Backpack")
                    }
                    .padding(.vertical)
                }
                
                // Product view
                let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                
                // Grid view
                LazyVGrid(columns: columns, spacing: 18) {
                    // Products
                    ForEach(products) { products in
                        cardView(product: products)
                            .onTapGesture {
                                withAnimation {
                                    baseData.currentProduct = products
                                    baseData.showDetail = true
                                }
                            }
                    }
                }
            }
            .padding()
            //bottom tab bar approx padding
            .padding(.bottom, 100)
        }
        .overlay(
            DetailView(animation: animation)
                .environmentObject(baseData)
                .ignoresSafeArea()
        )
    }
    
    @ViewBuilder
    func cardView(product: Product) -> some View {
        VStack(spacing: 15) {
            Button(action: {}) {
                Image(systemName: "suit.heart.fill")
                    .font(.system(size: 13))
                    .foregroundColor(product.isLiked ? .white : .gray)
                    .padding(5)
                    .background(
                        Color.red.opacity(product.isLiked ? 1 : 0)
                    )
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: product.productTitle, in: animation)
                .padding()
                .rotationEffect(.init(degrees: -20))
                .background(
                    ZStack {
                        Circle().fill(product.productBG)
                            .padding(-10)
                        
                        // white inner circle
                        Circle()
                            .stroke(Color.white, lineWidth: 1.4)
                            .padding(-3)
                        
                    }
                )
        
            Text(product.productTitle)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.productPrice)
                .font(.title2.bold())
                .padding(.top)
            
            //Star view
            HStack(spacing: 4) {
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .font(.system(size: 9.5))
                        .foregroundColor(product.productRating >= index ? .yellow : .gray.opacity(0.6))
                }
                Text("\(product.productRating).0")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
            }
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    @ViewBuilder
    func segmentButton(image: String, title: String) -> some View {
        Button(action: {
            withAnimation {
                baseData.homeTab = title
            }
        }) {
            HStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                
                Text(title)
                    .font(.system(size: 12.5, weight: .bold))
                    .foregroundColor(.black)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                ZStack {
                    // Transition Slider
                    if baseData.homeTab == title {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: .black.opacity(0.04), radius: 5, x: 5, y: 5)
                    }
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
