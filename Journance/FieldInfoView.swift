//
//  FieldInfoView.swift
//  Journance
//
//  Created by Eric  on 25.11.23.
//

import SwiftUI

struct FieldInfoView: View {
    var field : Field
    @State var info = ""
    @State var valueString = ""
    @EnvironmentObject var history: History
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack(alignment: .leading){
            List(){
                ForEach(field.budgetHistory.reversed()){ line in
                    HStack{
                        Text("\(line.date.formatted()): ")
                        Text(line.info)
                        Text(String(format: "%.2f", line.value))
                    }
                }
            }
            .frame(maxHeight: 300)
            
            HStack{
                Text("Info:")
                TextField("...", text: $info)
            }
            
            HStack{
                Text("Value:")
                TextField("0.00", text: $valueString).keyboardType(.decimalPad)
            }
            
            Button("OK", role: .destructive, action: {saveField(field, info, valueString)})
                .foregroundColor(Color.blue)
        }
    }
    
    func saveField(_ field: Field, _ info: String, _ value: String){
        var copy = info
        var valueDouble = 0.0
        var correctDot = ""
        
        if(value.contains(",") && !value.isEmpty){
            for letter in value{
                if(letter == ","){
                    correctDot += "."
                }else{
                    correctDot.append(letter)
                }
            }
        }
        if(correctDot != ""){
            valueDouble = Double(correctDot)!
        }else{
            valueDouble = Double(value)!
        }
        if(copy == ""){
            copy = "no info provided"
        }
        history.updateField(field, info, valueDouble)
        dismiss()
    }
}


//#Preview {
//    FieldInfoView()
//}
