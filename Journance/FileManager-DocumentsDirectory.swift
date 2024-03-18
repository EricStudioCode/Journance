//
//  FileManager-DocumentsDirectory.swift
//  Journance
//
//  Created by Eric  on 17.11.23.
//

import Foundation

extension FileManager{
    static var documentsDirectory: URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
