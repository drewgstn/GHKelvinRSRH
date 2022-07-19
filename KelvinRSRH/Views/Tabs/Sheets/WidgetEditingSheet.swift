//
//  WidgetEditingSheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/24/22.
//

import SwiftUI

struct WidgetEditingSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var report: String = ""
    @State private var slider = 50.0
    @State private var showingAlert = false
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Unsupported Build")
                        .padding(.top, 300)
                    Text("Failed to load Widget Editor.")
                        .padding(.top, 0)
                }
            }
            .navigationTitle("New Widget")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.primary))
            .fontWeight(.regular)
            .navigationBarItems(trailing:
                                    Button("Save") {
                                                showingAlert = true
                                            }
                                            .alert("Build Error", isPresented: $showingAlert, actions: {
                                                Button("OK", action: {dismiss()})
                                                    }, message: {
                                                        Text("This feature does not exist in your current build. SAVE_CURRENT_WIDGET_PREFERENCES does not exist.")
                                                    }) .foregroundColor(.accentColor)
                .foregroundColor(.primary))
                .fontWeight(.bold)
            
        }
        
    }
}

struct WidgetEditingSheet_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEditingSheet()
    }
}
