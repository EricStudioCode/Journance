//
//  HomeView.swift
//  Journance
//
//  Created by Eric  on 19.11.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var history = History()
    @State var showAddScreen = false
    @State var showStatsScreen = false
    @State private var wakeUp = Date.now
    
    var body: some View {
        NavigationStack{
            List{
                if history.fields.isEmpty{
                    Button("Add your first field"){
                        showAddScreen = true
                    }
                } else {
                        
                        ForEach(history.fields){ field in
                            FieldView(field: field)
                                .listRowBackground(rgbToColor(rgb: field.color))
                        }
                        .padding(.horizontal)
                }
                
            }
            .sheet(isPresented: $showAddScreen, content: FieldCreationView.init)
            .sheet(isPresented: $showStatsScreen, content: StatisticView.init)

            .toolbar(){
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showAddScreen = true
                    } label: {
                        Label("Add New Field", systemImage: "plus")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $wakeUp) {
                               ForEach(2000...2020, id: \.self) { // TODO: Work on period selection
                                   Text(String($0))
                               }
                           }
                           //.pickerStyle(InlinePickerStyle())
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        showStatsScreen = true
                    } label: {
                        Label("Show Statistics", systemImage: "circle.lefthalf.filled")
                    }
                }
            }
            .padding()
        }
        .environmentObject(history)
    }
}


#Preview {
    HomeView()
}
