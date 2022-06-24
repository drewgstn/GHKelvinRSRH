//
//  ConvertView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI

struct ConvertView: View {
    @State private var tempValue = 0.0
    @State private var currentScale = ""
    @State private var name: String = ""
    @State private var isShowingPopover = false
    @FocusState private var amountIsFocused: Bool
    
    //Change all scales to selectable dropdowns, easier to make buttons larger and resize better with larger text options. DROPDOWNS - All scales available on both sides of the scale, (converting from and to) hide/gray out if selected already (will save time and code later if that happens) All changes for v1(275.15)
    
    let tempScales = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var calculation: Double {
        if currentScale == "Fahrenheit" {
            return tempValue * 9 / 5 + 32
        } else if currentScale == "Kelvin" {
            return tempValue + 273.15
        } else {
            return 0.0
        }
    }
    
    
    //Add favoriting/nameing options
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("System Mode", selection: $currentScale) {
                        ForEach(tempScales, id: \.self) {
                            Text("\($0)")
                                }
                        }.pickerStyle(.segmented)
                    } header: {
                }
                                
                Section {
                    
                    TextField("The value of temperature", value: $tempValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .frame(width: 200, height:50)
                        .padding(.bottom, 150.0)
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("\(calculation.formatted())")
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                Section {
                    Button("INTERNAL_CONVERT_PREFERENCES") {
                                self.isShowingPopover = true
                    }
                    .padding(.vertical, -10.0)
                    .foregroundColor(.accentColor)
                    .font(.caption)
                    .fontWeight(.bold)
                    .popover(isPresented: $isShowingPopover) {
                        Text("Missing Content - star.fill, bookmark.fill, share.fill. fixed v1(276.15)")
                            .padding(.bottom, 600.0)
                            .font(.headline)
                    }
                }
            }
                .padding()

                
                
                
                
            }
            .navigationTitle("Convert")
            /*.frame(width: 430)
             */
        }
    }
}

struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView()
    }
}
