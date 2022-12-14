//
//  ContentView.swift
//  Touchdown
//
//  Created by Ashish Dutt on 06/11/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - VARIABLES
    
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            if shop.showingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    
                    NavigationBarView()
                        .padding(.horizontal,15)
                        .padding(.vertical, 15)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5,x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false,content: {
                        VStack(spacing: 0){
                            FeaturedTabView()
                                .frame(minHeight: 256)
                                .padding(.vertical, 10)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            
                            LazyVGrid(columns: gridLayout ,spacing: 15, content: {
                                ForEach(products) {product in
                                    ProductItemView(product: product)
                                        .onTapGesture {
                                            feedback.impactOccurred()
                                            withAnimation(.easeOut){
                                                shop.selectedProduct = product
                                                shop.showingProduct = true
                                            }
                                        }
                                }//:LOOP
                            })//:GRID
                            .padding(15)
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                            
                            FooterView()
                                .padding(.horizontal)
                        }
                    })//:SCROLL
                    
                }//:VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }//:ZSTACK
        .background(colorBackground.ignoresSafeArea(.all, edges: .top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}
