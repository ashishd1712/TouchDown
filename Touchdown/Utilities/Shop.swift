//
//  Shop.swift
//  Touchdown
//
//  Created by Ashish Dutt on 08/11/22.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
