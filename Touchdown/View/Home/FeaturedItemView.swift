//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Ashish Dutt on 07/11/22.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - VARIABLES
    
    let player: Player
    
    // MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        FeaturedItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
