//
//  TabViews.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            ConvertView()
                .tabItem {
                    Label("Convert", systemImage: "arrow.left.arrow.right")
                }
            LocationView()
                .tabItem {
                    Label("Widgets", systemImage: "slider.horizontal.below.square.and.square.filled")
                }
            FavoritesView()
                .tabItem {
                    Label("All Favorites", systemImage: "star.fill")
                }
            InternalView()
                .tabItem {
                    Label("Internal", systemImage: "wallet.pass")
                }
            }
        }
    }

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}

