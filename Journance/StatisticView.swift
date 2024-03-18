//
//  StatisticView.swift
//  Journance
//
//  Created by Eric  on 02.12.23.
//

import SwiftUI

struct StatisticView: View {
    @EnvironmentObject var history: History
    
    var body: some View {
        VStack{
            ChartView(fieldsPerMonth: history.fields)
        }
    }
}

//#Preview {
//    StatisticView()
//}
