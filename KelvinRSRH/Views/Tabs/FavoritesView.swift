//
//  FavoritesView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment .center) {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(Color.gray)
                     .scaledToFit()
                     .frame(width: 60, height: 60)
                Text("No Favorites")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .background(colorScheme == .dark ? Color.black : Color.white)
                Text("Your favorite conversions will appear here.")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

