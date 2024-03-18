//
//  ArrangementDropMenuView.swift
//  Journance
//
//  Created by Eric  on 19.11.23.
//

import SwiftUI

struct ArrangementDropMenuView: View {
    @Binding var viewSelection : Int
    let viewSelectionMenu = [0,1,2]
    
    var body: some View {
        VStack {
            Picker("Select arrangement", selection: $viewSelection) {
                ForEach(viewSelectionMenu, id: \.self) {
                    Label("\($0)", systemImage: "app")
                }
                .pickerStyle(.menu)
            }
        }
    }
}

//#Preview {
//    ArrangementDropMenuView()
//}
