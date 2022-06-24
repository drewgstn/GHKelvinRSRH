//
//  LocationView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI

//Research WeatherKit and how implement it into MapsKit to create LocationView, should be in by v1(276.15)
//Add launch sheet to display users steps to set up their CoreLocation data usage and how to add the wigets, v1(276.15)
struct LocationView: View {
    @State private var searchText = ""
    @State private var isShowingSheet = false
    @State var RIisPresented: Bool = false
    @State var WEisPresented: Bool = false
    @Environment(\.openURL) private var openURL
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack{
/*
                    Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 355.0, height: 140.0)
                    .cornerRadius(25.0)
*/
/*
                    Button("temp") {
                        
                    }
                    .frame(width: 355.0, height: 140.0)
                    .foregroundColor(Color.primary)
                    
                    .cornerRadius(25.0)
 */
                    
                    Text("Feature pushed for future")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .padding(.top, 15.0)
                        .padding(.leading, -45.0)
                        
                    
                    Text("update")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .underline()
                        .padding(.leading, 146.0)
                        .padding(.top, -25.0)
                }
                
            }
            .padding()
            .navigationTitle("Widgets")
            .navigationBarItems(trailing:
            Menu(content: {
                Section {
                    Button(action: {
                        WEisPresented = true
                    }){
                        Label("Edit Widget", systemImage: "slider.horizontal.below.square.and.square.filled")
                    }
                    Button(action: EditLocations) {
                        Label("Notifications", systemImage: "bell.badge")
                    }
                }
                Section {
                    Button(action: {
                        RIisPresented = true
                    }){
                        Label("Report an Issue", systemImage: "exclamationmark.bubble")
                    }
                }
            }) {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
                    .foregroundColor(Color.primary)
            }
            )
            .padding(.leading, 0.0)
            .sheet(isPresented: $RIisPresented) {
                RISheet()
            .foregroundColor(Color.secondary)
            }
            .sheet(isPresented: $WEisPresented) {
                WidgetEditingSheet()
                    .foregroundColor(Color.secondary)
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)) {
            }
        }
    
    func EditLocations() { }
    }

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
