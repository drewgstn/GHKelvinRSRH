//
//  InternalView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI
import UIKit

struct InternalView: View {
    @State private var tempValue = 0.0
    @State var isPresented: Bool = false
    @State private var selectedIndex = 0
    @State private var selectedIndex1 = 0
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Text("")
                .frame(width: 1000, height: 770)
                .background(Color("systemGray6.2"))
                HStack {
                    VStack {
                        Picker("", selection: $selectedIndex, content: {
                            Text("Celsius").tag(0)
                            Text("Fahrenheit").tag(1)
                            Text("Kelvin").tag(2)
                                
                            
                        })
                        .frame(width: 175 , height: 50)
                        .background(Color("systemGray6.1"))
                        .cornerRadius(10)
                        
                        
                        
                    }
                    VStack {
                        Picker("", selection: $selectedIndex1, content: {
                            Text("Kelvin").tag(0)
                            Text("Celsius").tag(1)
                            Text("Fahrenheit").tag(2)
                        })
                        .frame(width: 175 , height: 50)
                        .background(Color("systemGray6.1"))
                        .cornerRadius(10)
                    }
                    
                }
                .padding(.bottom, 630)
            }
            VStack {
                Form {
                    Section {
                        TextField("The value of temperature", value: $tempValue, format: .number)
                            .keyboardType(.decimalPad)
                            
                            .frame(width: 200, height:50)
                            .padding(.bottom, 150.0)
                            .foregroundColor(Color(UIColor.systemGray3))
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.top, 200)
                        
                    }
                }
                
            }
            
        }
        
    }
    
}
    
// *DEPRECATED ~ DELETE FOR BETA BUILDS*
/* struct OldLocationView : View {
    
    @EnvironmentObject var cityStore: CityStore
    
    @State var isAddingCity: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Your Cities")) {
                    ForEach(cityStore.cities) { city in
                        CityRow(city: city)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .navigationBarTitle(Text("Weather"))
        }
    }
    
    private var addButton: some View {
        Button(action: {
            self.isAddingCity = true
            self.isEditing = false
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
            .presentation(isAddingCity ? newCityView : nil)
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            cityStore.cities.remove(at: index)
        }
    }

    private func move(from source: IndexSet, to destination: Int) {
        var removeCities: [City] = []
        
        for index in source {
            removeCities.append(cityStore.cities[index])
            cityStore.cities.remove(at: index)
        }
        
        cityStore.cities.insert(contentsOf: removeCities, at: destination)
    }
    
    private var newCityView: Modal {
        Modal(NewCityView(isAddingCity: $isAddingCity).environmentObject(cityStore)) {
            self.isAddingCity = false
        }
    }
    
}
*/

struct InternalView_Previews: PreviewProvider {
    static var previews: some View {
        InternalView()
    }
}
