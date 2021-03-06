//
//  ConvertView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI
import AVFoundation

struct ConvertView: View {
    @State private var tempValue = 0.0
    @State private var currentScale = ""
    @State private var colorScheme = 1
    @State private var name: String = ""
    @State private var text: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var buttonText  = "Copy to clipboard"
    @State private var isShowingPopover = false
    @State var RIisPresented: Bool = false
    @State var WEisPresented: Bool = false
    @FocusState private var amountIsFocused: Bool
    private let pasteboard = UIPasteboard.general
    
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
                    Picker("Unit", selection: $currentScale) {
                        ForEach(tempScales, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    
                    Picker("Unit", selection: $currentScale) {
                        ForEach(tempScales, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }

                
                
                
                Section {
                    
                    TextField("Enter Temperature", value: $tempValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .frame(width: 300, height:50)
                        .padding(.bottom, 20.0)
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.leading, 50)
                        .padding(.trailing, 60)
                    ZStack {
                        HStack {
                            Button(action: EditLocations) {
                                Image(systemName: "doc.on.doc")
                                    .font(.system(size: 20))
                                    .padding(.leading, 10)
                                    .padding(.top, 150)
                                    .foregroundColor(.accentColor)
                                    .padding(.trailing, 5)
                            }
                            
                            Button(action: EditLocations) {
                                Image(systemName: "star")
                                    .font(.system(size: 20))
                                    .padding(.top, 150)
                                    .foregroundColor(.accentColor)
                            }
                            
                            
                            Button(action: EditLocations) {
                                
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 30))
                                    .padding(.leading, 210)
                                    .padding(.top, 150)
                                    .foregroundColor(.accentColor)
                            }
                        }
                        Text("\(calculation.formatted())")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.bottom, 150.0)
                            .padding(.leading, -155)
                    }
                }
            }
            .navigationTitle("Convert")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Section {
                            Button(action: EditLocations) {
                                Label("Hide Decimal", systemImage: "eye.slash")
                            }
                            
                            
                            Menu(content: {
                                Picker("Color Scheme", selection: $colorScheme) {
                                    
                                    Button(action: EditLocations) {
                                        Label("button", systemImage: "button.programmable")
                                    }
                                    Label("English", systemImage: "textformat").tag(0)
                                    Label("Arabic", systemImage: "exclamationmark.triangle").tag(1)
                                        .environment(\.locale, .init(identifier: "ar"))
                                    Label("Chinese", systemImage: "exclamationmark.triangle").tag(2)
                                        .environment(\.locale, .init(identifier: "cn"))
                                    Label("Roman", systemImage: "exclamationmark.triangle").tag(3)
                                        .environment(\.locale, .init(identifier: "li"))
                                }
                                
                            }){
                                Label("Numeral Variation", systemImage: "line.3.horizontal.decrease.circle")
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
                }
                
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
            }
            func EditLocations() {
                let utterance = AVSpeechUtterance(string: "\(calculation)")
                utterance.voice = AVSpeechSynthesisVoice()
                
                let synthesizer = AVSpeechSynthesizer()
                synthesizer.speak(utterance)
            }
        }
    




struct ConvertView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView()
    }
}
