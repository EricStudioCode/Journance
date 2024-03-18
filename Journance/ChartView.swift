//
//  ChartView.swift
//  Journance
//
//  Created by Eric  on 02.12.23.
//

import SwiftUI
import Charts

struct ChartView: View {
    //@State var aa = 0.0
    var fieldsPerMonth: [Field]
    @State var moneySpentPerMonth = 0.0
    
    var body: some View {
        VStack{
            Text("Monthly Expenses: \(String(format: "%.2f", moneySpentPerMonth))")
            Section{
                if(!fieldsPerMonth.isEmpty){
                    Chart {
                        ForEach(fieldsPerMonth, id: \.id) { field in
                            SectorMark(
                                angle: .value("Field", field.budget)
                                ,angularInset: 2.0
                            )
                            .foregroundStyle(rgbToColor(rgb: field.color))
                            .annotation(position: .overlay) {
                                Text(field.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .frame(height: 500)
                }else{
                    Text("You have no statistics yet.")
                }
            }
            .onAppear{
                moneySpentPerMonth = getMonthlyExpense()
            }
        }
    }
    
    func getMonthlyExpense() -> Double{
        var expense = 0.0
        for field in fieldsPerMonth{
            expense += field.budget
        }
        return expense
    }
}


//#Preview {
//    ChartView(history)
//}
