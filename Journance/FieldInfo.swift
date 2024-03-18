//
//  FieldInfo.swift
//  Journance
//
//  Created by Eric  on 25.11.23.
//

import Foundation

struct FieldInfo : Identifiable, Codable, Equatable{
    let id : UUID
    let date : Date
    let info : String
    let value : Double
   // var value = 0
}
