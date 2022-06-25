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
    @State private var showingAlert = false
    @State private var isShowingSheet = false
    var body: some View {
        NavigationStack {
            VStack {
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                    .padding(75.0)
            }
            .navigationTitle("Edit Widget")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                dismiss()
            }
            .foregroundColor(.primary))
            .fontWeight(.regular)
            .navigationBarItems(trailing:
                                    Button("Finish") {
                                                showingAlert = true
                                            }
                                            .alert("Error", isPresented: $showingAlert, actions: {
                                                Button("OK", action: {dismiss()})
                                                    }, message: {
                                                        Text("SAVE_CURRENT_WIDGET_PREFERENCES does not exist.")
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
