//
//  FieldInfo.swift
//  Journance
//
//  Created by Eric  on 25.11.23.
//

import Foundation

struct FieldInfo : Identifiable, Codable, Equatable{
    var id: UUID
    var infoProtocoll : [Date : String]
}
