//
//  RISheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/24/22.
//

import SwiftUI

struct RISheet: View {
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
                Text("Your favorite conversions will appear here.")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                
            }
            .navigationTitle("MEOW")
        }
    }
}

struct RISheet_Previews: PreviewProvider {
    static var previews: some View {
        RISheet()
    }
}
