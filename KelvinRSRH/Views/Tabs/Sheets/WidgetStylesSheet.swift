//
//  WidgetStylesSheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 7/21/22.
//

import SwiftUI

//
//  WidgetEditingSheet.swift
//  KelvinRSRH
//
//  Created by Drew Goldstein on 6/24/22.
//

import SwiftUI

private struct WidgetStyleRow: View {
    var title: String
    var subtitle: String
    var image: String
  
  var body: some View {
      HStack {
          Image(image)
              .resizable()
              .frame(width: 50, height: 50)
              .cornerRadius(8)
          VStack(alignment: .leading) {
              Text(title)
                  .font(.headline)
              Text(subtitle)
                  .font(.subheadline)
                  .foregroundColor(.secondary)
          }
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

struct WidgetStylesSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var report: String = ""
    @State private var slider = 50.0
    @State private var showingAlert = false
    @State private var isShowingSheet = false
    @State var WEisPresented: Bool = false
    var body: some View {
        NavigationStack {
                   List {
                        Section(header: Text("Widget Styles")) {
                            NavigationLink {
                                WidgetStyleDetail()
                            } label: {
                                WidgetStyleRow(title: "widgetStyle", subtitle: "widgetStyleOption", image: "kelvindefwidgetgpc")
                                    .foregroundColor(.primary)
                                    
                            }
                            NavigationLink {
                                WidgetStyleDetail()
                            } label: {
                                WidgetStyleRow(title: "widgetStyle", subtitle: "widgetStyleSecondOption", image: "kelvindefwidgetgpc")
                                    .foregroundColor(.primary)
                            }
                        }
                    }
            
            .navigationBarTitle("Widget Style")
        }
    }
    func WE() {
        WEisPresented = true
    }
}


struct WidgetStylesSheet_Previews: PreviewProvider {
    static var previews: some View {
        WidgetStylesSheet()
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

