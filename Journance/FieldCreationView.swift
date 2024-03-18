//
//  FieldCreationView.swift
//  Journance
//
//  Created by Eric  on 19.11.23.
//

import SwiftUI


struct FieldCreationView: View {
    @EnvironmentObject var history: History
    @Environment(\.dismiss) var dismiss
    @State private var fieldColor = Color.secondary
    @State private var name = ""
    
    var body: some View {
        
        let pickerView =
        ColorPicker("Set Field Color:", selection: $fieldColor, supportsOpacity: false).frame(height: 30)
        
        VStack{
            Group{ 
                VStack{
                    pickerView
                    HStack{
                        Text("Field Name:")
                        TextField("...", text: $name)
                    }.padding()
                    Button("OK", role: .destructive, action: {saveField()}).foregroundColor(Color.blue)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 300, height: 200)
        }
    }
    
    func saveField(){
        history.add(Field(id: UUID(),  name: name, color: colorToRgb(color: fieldColor), budget: 0.0))
        dismiss()
    }
}

#Preview {
    FieldCreationView()
}

func colorToRgb(color: Color) -> [CGFloat]{
    var rgb = [CGFloat]()
    let components = UIColor(color).cgColor.components

    rgb.append(components![0])
    rgb.append(components![1])
    rgb.append(components![2])


    return rgb
}

func rgbToColor(rgb: [CGFloat]) -> Color{
    let color = Color(red: rgb[0], green: rgb[1], blue: rgb[2])

    return color
}
