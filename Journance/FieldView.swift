//
//  FieldView.swift
//  Journance
//
//  Created by Eric  on 19.11.23.
//

import SwiftUI

struct FieldView: View{
    var field: Field
    @State var buttonClicked = false
    @EnvironmentObject var history: History
    
    var body: some View{
        
        NavigationLink{
            FieldInfoView(field: field)
                .navigationTitle(field.name)
                .navigationBarTitleDisplayMode(.inline)
                .foregroundStyle(rgbToColor(rgb: field.color))
                
        } label: {
            HStack{
                Text(field.name)
                
                Spacer()
                
                Text(String(format: "%.2f", field.budget))
                    .foregroundStyle(rgbToColor(rgb: field.color)).colorInvert()
            }
        }
            .swipeActions {
                Button(role: .destructive) {
                    withAnimation {
                        history.delete(field)
                    }
                } label: {
                    Label("Delete", systemImage: "trash")
                }
        }
            .padding()
    }
}

//#Preview {
//    FieldView(field: Field.example)
//}
