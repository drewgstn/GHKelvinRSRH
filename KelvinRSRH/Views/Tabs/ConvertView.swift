//
//  ConvertView.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/23/22.
//

import SwiftUI
import AVFoundation

struct ConvertView: View {
    @State var isPlaying : Bool = false
    @State private var tempValue = 0.0
    @State private var currentScale = ""
    @State private var lang = 0
    @State private var name: String = ""
    @State private var text: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var buttonText  = "Copy to clipboard"
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var presentAlert = false
    @State private var isShowingPopover = false
    @State var RIisPresented: Bool = false
    @State var WEisPresented: Bool = false
    @FocusState private var amountIsFocused: Bool
    private let pasteboard = UIPasteboard.general
    
    // Change all scales to selectable dropdowns, easier to make buttons larger and resize better with larger text options. DROPDOWNS - All scales available on both sides of the scale, (converting from and to) hide/gray out if selected already (will save time and code later if that happens) All changes for v1(275.15)
    // #16 - bug - From: To Identifier does not function as intended; fix - add indentifier
    let tempScales = ["Kelvin", "Fahrenheit", "Celsius"]
    
    let tempScalesTo = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    // ADD FROM CONVERSION IDENTIFIER
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
                        ForEach(tempScalesTo, id: \.self) {
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
                    Text("FROM_CONVERSION")
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .listRowSeparator(.hidden)
                    
                        .padding(.top, 15)
                        .padding(.bottom, 2.0)
                    
                    TextField("Enter Temperature", value: $tempValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .frame(width: 300, height:50)
                        .padding(.bottom, 3.0)
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding(.leading, 50)
                        .padding(.trailing, 60)
                        .padding(.top, -20)
                        .submitLabel(.done)
                    ZStack {
                        HStack {
                            Button(action: {
                                presentAlert = true
                            }){
                                Label("COPY", systemImage: "doc.on.doc")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.accentColor)
                                    .listRowSeparator(.hidden)
                                    .font(.system(size: 20))
                                    .labelStyle(IconOnlyLabelStyle())
                                    
                                    
                                
                            }
                            
                            .listRowSeparator(.hidden)
                            .padding(.leading, 10)
                            .padding(.trailing, 15)
                            .padding(.top, 150)

                            Button(action: {
                                presentAlert = true
                            }){
                                Label("STAR", systemImage: "star")
                                    
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.accentColor)
                                    .listRowSeparator(.hidden)
                                    .font(.system(size: 20))
                                    
                                    .labelStyle(IconOnlyLabelStyle())
                            }
                            .padding(.top, 150)
                            
                            Button(action: Speak) {
                                
                                Image(systemName: self.isPlaying == true ? "pause.circle.fill" : "play.circle.fill")
                                    
                                    .font(.system(size: 30))
                                    
                                    
                                    .foregroundColor(.accentColor)
                            }
                            .padding(.top, 150)
                            .padding(.leading, 210)
                            .padding(.trailing, 10)
                            
                        }
                        
                        .buttonStyle(BorderlessButtonStyle())
                        
                        Text("TO_CONVERSION")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .padding(.bottom, 160.0)
                            .padding(.leading, -155)
                        Text("\(calculation.formatted())")
                            .textSelection(.enabled)
                            .foregroundColor(.accentColor)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .listRowSeparator(.hidden)
                            .padding(.bottom, 110.0)
                            .padding(.leading, -155)
                            
                    }
                }
                List {
                    Section(header: Text("toolbar testing field"), footer: Text("COPY_FAVORITE_TTS")) {
                        HStack {
                            Button(action: {
                                presentAlert = true
                            }){
                                Label("COPY", systemImage: "doc.on.doc")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.accentColor)
                                    .listRowSeparator(.hidden)
                                    .font(.system(size: 20))
                                    .labelStyle(IconOnlyLabelStyle())
                                    .padding(.leading, 20)
                                
                            }
                            .listRowSeparator(.hidden)
                            .padding(.trailing, 15)
                            
                            Button(action: {
                                presentAlert = true
                            }){
                                Label("STAR", systemImage: "star")
                                    
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.accentColor)
                                    .listRowSeparator(.hidden)
                                    .font(.system(size: 20))
                                    .labelStyle(IconOnlyLabelStyle())
                                
                            }
                            .alert("Save Calculation", isPresented: $presentAlert, actions: {
                                TextField("Label", text: $username)
                                
                                
                                
                                
                                Button("Save", action: {})
                                Button("Cancel", role: .cancel, action: {})
                            }, message: {
                                Text("Save current calculation")
                            })
                            .listRowSeparator(.hidden)
                            
                            Button(action: Speak) {
                                
                                Image(systemName: self.isPlaying == true ? "pause.circle.fill" : "play.circle.fill")
                                        
                                    .font(.system(size: 30))
                                    .padding(.leading, 220)
                                    .foregroundColor(.accentColor)
                            }
                            
                        }
                        // *ADD BACK AFTER BUG SQUASHED* .listRowSeparator(.hidden)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            .navigationTitle("Convert")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Section {
                            Button(action: HideDecimal) {
                                Label("Hide Decimal", systemImage: "eye.slash")
                            }
                            
                            
                            Menu(content: {
                                Picker("Color Scheme", selection: $lang) {
                                    
                                    Button("change language alert") {
                                                presentAlert = true
                                            }
                                            .alert("Save Calculation", isPresented: $presentAlert, actions: {
                                                TextField("Name", text: $username)

                        

                                                
                                                Button("Save", action: {})
                                                Button("Cancel", role: .cancel, action: {})
                                            }, message: {
                                                Text("Save current calculation")
                                            })
                                    
                                    
                                    Button(action: Speak) {
                                        Label("langs attached btn", systemImage: "square.and.arrow.down")
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
            func SaveConversion() { }
            func HideDecimal() { }
            func Copy() { }
    
            func Speak() {
                self.isPlaying.toggle()
                
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
