//
//  Task.swift
//  TODO
//
//  Created by Adel Diaz on 29/09/23.
//

import Foundation

struct Task: Identifiable, Codable {
    
var id: String = UUID().uuidString
var name: String
var date: Date = Date()
    
    init(id: String, name: String, date: Date){
        self.id = id
        self.name = name
        self.date = date
    }
    

}
