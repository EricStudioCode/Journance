//
//  ContentView.swift
//  Journance
//
//  Created by Eric  on 28.09.23.
//
//import SwiftData
//import SwiftUI
//import Foundation
//
//var newFieldsColor = Color.black
//var newFieldsName = ""
//var fieldArray = [Field]()
//var idCounter = 0
//var allSavedFields = [Field]()
//
//
//struct ContentView: View {
////    @Environment(\.modelContext) var modelContext
////    @Query var test : [Field]
//    @State var addNewField = false
//    @State var statsShow = false
//    @State var insertedFields = [Field]()
//    @State var fieldsCount = 0
//    @State var fieldBuilderCounter = 0
//  //  @EnvironmentObject var fieldArray = [Field]()
//    
//    
//    var body : some View{
//        
//        ZStack{
//            NavigationStack {
//                ScrollView {
//                    if(fieldsCount==1){
//                        FieldView(field: insertedFields[0])
//                    }else if(fieldsCount==2){
//                        VStack{
//                            FieldView(field: insertedFields[0])
//                            FieldView(field: insertedFields[1])
//                        }
//                    }else if(fieldsCount>0 && fieldsCount%2==0){
//                        VStack(spacing:5) {
//                            ForEach(1...fieldsCount, id:\.self) { i in
//                                HStack(spacing:5) {
//                                    if(i%2==0){
//                                        FieldView(field: insertedFields[i-2])
//                                        FieldView(field: insertedFields[i-1])
//                                    }
//                                }
//                            }
//                        }
//                    }else if(fieldsCount>1){
//                        VStack(spacing:5) {
//                            ForEach(1...fieldsCount, id:\.self) { i in
//                                HStack(spacing:5) {
//                                    if(i%2==0){
//                                        FieldView(field: insertedFields[i-2])
//                                        FieldView(field: insertedFields[i-1])
//                                    }
//                                }
//                            }
//                            HStack(spacing:5){
//                                FieldView(field: insertedFields.last!)
//                                FieldView(field: insertedFields.last!).hidden()
//                            }
//                        }
//                    }
//                }.onAppear{
//                    //getFieldsFromArchive(forKey: "FIELD_KEY")
//                    insertedFields = fieldArray
//                    fieldsCount = insertedFields.count
//                   
//                }
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        NavigationLink(){
//                            //addNewField.toggle()
//                            FieldCreationView()
//                        } label: {
//                            Image(systemName: "plus").resizable().aspectRatio(contentMode: .fit).frame(width: 20,height: 20)
//                        }
//                        
//                    }
//                    
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        NavigationLink(){
                            //statsShow.toggle()
//                            if(!fieldArray.isEmpty){
//                                modelContext.insert(fieldArray[0].field)
//                            }
                            
//                        } label: {
//                            Image(systemName: "line.3.crossed.swirl.circle").resizable().aspectRatio(contentMode: .fit).frame(width: 25,height: 25)
//                        }
//                        .sheet(isPresented: $statsShow) {
//                            DismissingView1() //TODO: Field add code
//                        }
//                    }
//                }
//                .navigationBarTitleDisplayMode(.inline)
//               // .navigationTitle("")
//                .padding()
//            }
//        }
//    }
//}
    
    
//    struct DismissingView1: View {
//        @Environment(\.dismiss) var dismiss
//        
//        var body: some View {
//            Button("HAHAHAHHAAHAHA OK") {
//                dismiss()
//            }
//        }
//    }
//    
//    struct SelectionViewAddition: View {
//        @State private var fieldColor = Color.black
//        @State private var name = ""
//        
//        var body: some View {
//            
//            let pickerView =
//            ColorPicker("Set Field Color:", selection: $fieldColor, supportsOpacity: false).frame(height: 30)
//            
//            VStack{
//                Group{ //<-- Here
//                    VStack{
//                        pickerView
//                        HStack{
//                            Text("Field Name:")
//                            TextField("...", text: $name)
//                        }.padding()
//                        OkButtonSelectionView(name: name, fieldColor: fieldColor)
//                    }
//                }
//                .fixedSize(horizontal: false, vertical: true)
//                .multilineTextAlignment(.center)
//                .padding()
//                .frame(width: 300, height: 200)
//                .background(RoundedRectangle(cornerRadius: 550).stroke().fill(Color.gray).shadow(radius: 3))
//            }
//        }
//    }
    
    
    
//    struct OkButtonSelectionView: View {
//        var name: String
//        var fieldColor: Color
//        @Environment(\.dismiss) var dismiss
//        
//        var body: some View {
//            Button("OK", role: .destructive, action: {resetAddAndSafeEntries()}).foregroundColor(Color.blue)
//        }
//        
//        func resetAddAndSafeEntries(){
//            newFieldsName = name
//            newFieldsColor = fieldColor
//            //print(newFieldsColor)
//            //print(newFieldsName)
//            addFieldToArray()
//            //print(fieldArray.count)
//            dismiss()
//        }
//        
//        func addFieldToArray(){
//            idCounter+=1;
//            fieldArray.append(Field(id: UUID(),  name: newFieldsName, color: colorToRgb(color: fieldColor)))
////            testSave(field: Field(id: idCounter,  name: newFieldsName, color: colorToRgb(color: fieldColor)), forKey: "FIELD_KEY")
// 
//        }
//    }
  
//#Preview {
//    ContentView()
//}
//    struct FieldView: View{
//        var field: Field
//        @State var buttonClicked = false
//        
//        var body: some View{
//            
//            ZStack{
//                RoundedRectangle(cornerRadius: 25)
//                    .fill(rgbToColor(rgb: field.color))
//                    .scaledToFit()
//                    HStack{
//                        VStack{
//                            Text(field.name)
//                            ZStack{
//                                Text(String(format: "%.2f", field.budget))
//                                    .foregroundStyle(rgbToColor(rgb: field.color)).colorInvert()
//                            }
//                            NavigationLink(){
//                                ResultView()
//                                    .navigationTitle(field.name)
//                                
//                                
//                            } label: {
//                                Image(systemName: field.name).resizable().aspectRatio(contentMode: .fit).frame(width: 20,height: 20)
//                            }
//                        }
//                    }
//            }
//            .overlay{
//                         RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(.white, lineWidth: 3)
//                     }
//                     .shadow(radius: 5)
//        }
        
//        func addMoney(money: Double, fieldID: Int){
//            if fieldArray.contains(where: {$0.id == fieldID}) {
//                budget.self=money+budget
//                fieldArray[id-1] = FieldView(fieldColor: field.fieldColor, fieldName: field.fieldName, id: fieldID, budget: budget)
//                buttonClicked = true
//            } else {
//               //item could not be found
//            }
//        }
   // }

//struct budgetAlteringView: View {
//    @State var score = 0
//    let currencyFormatter: NumberFormatter = {
//            let formatter = NumberFormatter()
//            formatter.usesGroupingSeparator = true
//            formatter.numberStyle = .currency
//            formatter.locale = Locale.current
//            return formatter
//        }()
//    
//    var body: some View {
//
//            VStack {
//                TextField("Enter your score", value: $score, formatter: currencyFormatter)
//                            .padding()
//                Text("Your score was \(score).")
//                    }
//                
//    }
//}

//struct ResultView: View {
//@Environment(\.dismiss) var dismiss
//    
//        var body: some View {
//            Button("ADD", role: .destructive, action: {addValue()}).foregroundColor(Color.blue)
//            Button("DEDUCT", role: .destructive, action: {addValue()}).foregroundColor(Color.red)
//        }
//        
//        func addValue(){
//            dismiss()
//        }
//    }

//func colorToRgb(color: Color) -> [CGFloat]{
//    var rgb = [CGFloat]()
//    let components = UIColor(color).cgColor.components
//
//    rgb.append(components![0])
//    rgb.append(components![1])
//    rgb.append(components![2])
//
//    
//    return rgb
//}
//
//func rgbToColor(rgb: [CGFloat]) -> Color{
//    let color = Color(red: rgb[0], green: rgb[1], blue: rgb[2])
//    
//    return color
//}


//func testSave(field: Field, forKey defaultName: String = "FIELD_KEY") {  // or forKey defaultName: String = dataKey
//    guard let data = try? NSKeyedArchiver.archivedData(withRootObject: field, requiringSecureCoding: false) else { return }
//   defaults.set(data, forKey: defaultName)
//    defaults.synchronize()
//    print(field.name)
//}
//func getFieldsFromArchive(forKey defaultName: String = "FIELD_KEY") {  // or forKey defaultName: String = dataKey
//    guard let data = defaults.data(forKey: defaultName) else { return }
//        guard let fieldData = (try? NSKeyedUnarchiver.unarchivedObject(ofClass: Field.self, from: data)) else { return }
//        fieldArray.append(fieldData.computeData(data: fieldData) ?? Field())
//    print("cowabunga")
//    print(fieldData.name)
//
//}
