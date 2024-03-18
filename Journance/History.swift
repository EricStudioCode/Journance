//
//  History.swift
//  Journance
//
//  Created by Eric  on 17.11.23.
//

import Foundation

class History: ObservableObject{
    @Published var fields: [Field] //published, when changed notify all views including to reload this
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedFields")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            fields = try JSONDecoder().decode([Field].self, from: data)
        } catch {
            fields = []
        }
    }
    
    private func save() {
        do{
            let data = try JSONEncoder().encode(fields)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func add(_ field : Field){
        fields.insert(field , at: 0)
        save()
    }
    
    func delete(_ field: Field){
        if let index =  fields.firstIndex(of: field) {
            fields.remove(at: index)
            save()
        }
    }
    
    func updateField(_ field: Field,_ info: String,_ budget: Double){
        var copy = field.budgetHistory
        copy.append(FieldInfo(id: UUID(), date: Date(), info: info, value: budget))
        delete(field)
        add(Field(id: field.id, name: field.name, color: field.color, budget: field.budget+budget, budgetHistory: copy))
        save()
    }
}
