//
//  DetailView.swift
//  E-CommerceUI
//
//  Created by KANISHK VIJAYWARGIYA on 31/08/21.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: BaseViewModel
    // For HERO effect
    var animation: Namespace.ID
    
    @State var size = "US 6"
    @State var shoeColor: Color = .red
    
    var body: some View {
        // safe check
        if let product = baseData.currentProduct, baseData.showDetail {
            VStack(spacing: 0) {
                // top bar
                HStack {
                    Button(action: {
                        withAnimation {
                            baseData.showDetail = false
                        }
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                }
                .foregroundColor(.black)
                .overlay(
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 56, height: 56)
                )
                .padding(.horizontal)
                .padding(.bottom)
                
                // Shoe image
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: product.productTitle, in: animation)
                    .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: -20))
                    .background(
                        ZStack {
                            Circle()
                                .fill(product.productBG)
                                .padding()
                            
                            Circle()
                                .fill(Color.white.opacity(0.5))
                                .padding(60)
                            
                        }
                    )
                    .frame(height: getScreenBounds().height / 3)
                
                // Product Details
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text(product.productTitle)
                            .font(.title.bold())
                        
                        Spacer(minLength: 10)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("\(product.productRating)")
                            .foregroundColor(.gray)
                    }
                    
                    Text("We could use a lot of superlatives to describe the \(product.productTitle) 2021. We could tell you that we've incorporated recycled materials.")
                        .font(.callout)
                        .lineSpacing(10)
                    
                    // Size
                    HStack(spacing: 0) {
                        Text("Size: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        
                        ForEach(["US 6", "US 7", "US 8", "US 9"], id: \.self) { size in
                            Button(action: {self.size = size}) {
                                Text(size)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.pink)
                                            .opacity(self.size == size ? 0.3 : 0)
                                    )
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    // Color
                    HStack(spacing: 15) {
                        let colors: [Color] = [.yellow, .red, .purple, .green]
                        
                        Text("Available Colors: ")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                        
                        ForEach(colors, id: \.self) { color in
                            Button(action: {self.shoeColor = color}) {
                                Circle()
                                    .fill(color.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay (
                                        // ring for current color
                                        Circle()
                                            .stroke(Color("UltraPink"), lineWidth: 1.5)
                                            .opacity(shoeColor == color ? 1 : 0.2)
                                            .padding(-4)
                                    )
                            }
                        }
                    }
                    .padding(.vertical)
                    
                    // Add to cart
                    Button(action: {}) {
                        HStack(spacing: 15) {
                            Image("cart")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                
                            Text("Add To Cart")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(Color("UltraPink"))
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color("UltraPink").opacity(0.06))
                        .clipShape(Capsule())
                    }
                    .padding(.top)
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(
                    Color("UltraPink")
                        .opacity(0.05)
                        .cornerRadius(20)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            }
            .padding(.top, 60)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
            .transition(.opacity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending view to get screen bounds
extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
