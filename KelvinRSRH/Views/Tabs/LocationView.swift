//
//  LocationView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI

struct RoundedRowButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundColor(.white)
                .font(Font.body.weight(.semibold))
                .frame(width: 290, alignment: .center)
                .padding()
                .background(Color.accentColor.opacity(configuration.isPressed ? 0.7 : 1))
                .frame(height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
}


//Research WeatherKit and how implement it into MapsKit to create LocationView, should be in by v1(276.15)
//Add launch sheet to display users steps to set up their CoreLocation data usage and how to add the wigets, v1(276.15)
struct LocationView: View {
    @State private var searchText = ""
    @State private var isShowingSheet = false
    @State var RIisPresented: Bool = false
    @State var WEisPresented: Bool = false
    @State var isPresented: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    
                    Color("systemGray6.1")
                        .frame(width: 350, height: 375)
                    
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 15
                            )
                            
                        )
                        .padding(.top, 130)
                    
                    
                    Button(action: {
                        isPresented = true
                    }) {
                        Label("XMARK", systemImage: "xmark")
                            .frame(width: 20, height: 20)
                            .foregroundColor(.secondary)
                            .fontWeight(.medium)
                            .padding(.leading, 300)
                            .padding(.bottom, 210)
                            
                            .imageScale(.small)
                            .labelStyle(IconOnlyLabelStyle())
                    }
                    
                    Image("graphic")
                        .resizable()
                        .frame(width: 55, height: 120)
                        .padding(.bottom, 80)
                        
                    
                    
                    
                    Text("Custom Widgets")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.trailing, 184)
                        .padding(.top, 98)
                    Text("Create fully customizable widgets to complement your Home and Lock screens. Customizable widgets include past conversions and the temperature of your current location in other temperature scales.")
                        .font(.callout)
                        .frame(width: 340, height: 200, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 25)
                        .padding(.top, 230)
                    
                    Button("Start") {
                        WEisPresented = true
                    }
                    .buttonStyle(RoundedRowButtonStyle())
                    .padding(.top, 425)
                        
                }
                
                .controlSize(.large)
                
                
                ZStack {
                    Text("Example")
                    Color("systemGray6.2")
                    
                        .frame(width: 500, height: 1400)
                    
                }
                
                
                
                
            }
            .padding()
            .background(Color("systemGray6.2"))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Widgets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Section {
                            Button(action: {
                                WEisPresented = true
                            }){
                                Label("Edit Widgets", systemImage: "slider.horizontal.below.square.and.square.filled")
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        WEisPresented = true
                    }){
                        Label("WIDGET_PREFERENCES", systemImage: "plus")
                    }
                    .foregroundColor(.primary)
                }
            }
        }
        
        }
    
    func EditLocations() { }
    }

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
