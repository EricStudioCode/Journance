//
//  Field.swift
//  Journance
//
//  Created by Eric  on 18.10.23.
//
import SwiftUI


struct Field : Identifiable, Codable, Equatable{
    var id : UUID
    var name : String
    var color : [CGFloat]
    var budget : Double
    var budgetHistory = [FieldInfo(id: UUID(), date: Date(), info: "Creation", value: Double())]
    
    static var example = Field(id: UUID(), name: "test", color: [1,1,1], budget: 0.0, budgetHistory: [FieldInfo(id: UUID(), date: Date(), info: "", value: 0.0)])
    
    mutating func addFieldInfo(_ infoText: String){
        self.budgetHistory.append(FieldInfo(id: UUID(), date: Date(), info: infoText, value: 0.0))
    }
}
    
