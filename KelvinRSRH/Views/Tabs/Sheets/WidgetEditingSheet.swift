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
                                            .alert("Unable to Sumbit", isPresented: $showingAlert, actions: {
                                                Button("Delete", role: .destructive, action: {dismiss()})
                                                Button("Cancel", role: .cancel, action: {dismiss()})
                                                    .foregroundColor(.accentColor)
                                                    }, message: {
                                                        Text("Please use Feedback Assistant to submit bug reports. This feature is limited to final release.")
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
