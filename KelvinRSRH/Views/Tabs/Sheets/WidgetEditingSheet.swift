//
//  WidgetEditingSheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/24/22.
//

import SwiftUI

private struct WidgetEditingRow: View {
    var title: String
    var subtitle: String
  
  var body: some View {
          VStack(alignment: .leading) {
              Text(title)
                  .font(.headline)
              Text(subtitle)
                  .font(.subheadline)
                  .foregroundColor(.secondary)
      }
  }
}

private struct WidgetStyleDetail: View {
  var body: some View {
       NavigationView {
          Text("unable")
               .navigationBarTitleDisplayMode(.inline)
               .toolbar {
                   ToolbarItem(placement: .principal) {
                       Text("Gyro Data (unable to fetch: 1)")
                           .font(.headline)
                           .accessibilityAddTraits(.isHeader)
                           .foregroundColor(.primary)
                   }
               }
      }
  }
}

struct WidgetEditingSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var slider = 50.0
    @State private var showingAlert = false
    @State private var isShowingSheet = false
    @State var WSisPresented: Bool = false
    var body: some View {
        NavigationStack {
                   Form {
                        Section(header: Text("Widget Style")) {
                            Button(action: { self.WSisPresented.toggle() }) {
                                HStack {
                                    VStack {
                                        Text("Widget Style")
                                            .foregroundColor(.primary)
                                            .font(.headline)
                                            .padding(.trailing, 165)
                                        Text("Style of widget you would like to create")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Image(systemName: "chevron.right")
                                        .padding(.leading, 23)
                                        .foregroundColor(Color(UIColor.systemGray2))
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .imageScale(.small)
                                    }
                            }
                            .sheet(isPresented: $WSisPresented) {
                                                    WidgetStylesSheet()
                            }
                            NavigationLink {
                                WidgetStylesSheet()
                            } label: {
                                WidgetEditingRow(title: "Widget Style", subtitle: "Style of widget you would like to create")
                                    .foregroundColor(.primary)
                            }
                        }
                       Section(header: Text("Basic Information")) {
                           VStack {
                               Text("Provide a descriptive title for your widget")
                                   .padding(.trailing, 70)
                                   .fontWeight(.bold)
                                   .foregroundColor(.primary)
                               TextField(
                                "Example: Nubula calculations",
                                text: $title)
                               .font(.callout)
                               .padding(.top, -10)
                           }
                           VStack {
                               Text("Describe what this widget will be used for")
                                   .foregroundColor(.primary)
                                   .padding(.trailing, 42)
                                   .fontWeight(.bold)
                               TextField(
                                "Example: This widget will be used to show my recent caluclations for monitering nebula temperatures",
                                text: $title)
                               .frame(width: 200, height: 20, alignment: .leading)
                               .multilineTextAlignment(.leading)
                               .font(.callout)
                               .padding(.trailing, 110)
                               .padding(.top, -10)
                               
                           }
                       }
                       Section(header: Text("Details")) {
                           NavigationLink {
                               WidgetStylesSheet()
                           } label: {
                               WidgetEditingRow(title: "Widget Size", subtitle: "Size of widget you would like to create")
                                   .foregroundColor(.primary)
                           }
                           

                       }
                    }
            
            .navigationBarTitle("New Widget")
// REPLACE WITH TOOLBAR
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
    func WE() {
        WSisPresented = true
    }
}


struct WidgetEditingSheet_Previews: PreviewProvider {
    static var previews: some View {
        WidgetEditingSheet()
    }
}

/*                VStack {
                    Text("Unsupported Build")
                        .padding(.top, 300)
                    Text("Failed to load Widget Editor.")
                        .padding(.top, 0)
                }
 */

/*
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
*/
