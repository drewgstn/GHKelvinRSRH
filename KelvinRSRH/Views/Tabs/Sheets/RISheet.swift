//
//  RISheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/24/22.
//

import SwiftUI

struct RISheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var report: String = ""
    @State private var showingAlert = false
    @State private var isShowingSheet = false
    @State private var disabled = true
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Report")) {
                    TextField(
                        "Please use Feedback Assistant to report.",
                        text: $report
                    )
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 200.0)
                }
                Section {
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Label("Add Attachment", systemImage: "paperclip")
                    }
                    .popover(isPresented: $showingAlert) {
                    }
                }
            }
            
            .navigationTitle("Report an Issue")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    Button("Cancel") {
                showingAlert = true
            }
                .alert("Unable to Sumbit", isPresented: $showingAlert, actions: {
                    Button("Delete", role: .destructive, action: {dismiss()})
                }, message: {
                    Text("Please use Feedback Assistant to submit bug reports. This feature is limited to final release.")
                })
                    .foregroundColor(.primary))
            .fontWeight(.regular)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                    }
                    .disabled(disabled)
                    .fontWeight(.bold)
                }
            }
        }
    }
}

struct RISheet_Previews: PreviewProvider {
    static var previews: some View {
        RISheet()
    }
}
