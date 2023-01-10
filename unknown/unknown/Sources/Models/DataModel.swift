//
//  DataModel.swift
//  unknown
//
//  Created by Nikita Alpatiev on 1/10/23.
//

import Foundation

struct Cell {
    var title: String
    var subtitle: String
    var image: String
}

struct DataSource {
    
    var successful = false
    
    static var cells = [Cell]()
    
    func getCell(with path: IndexPath) {
        // returns cell
    }
    func editCell(with path: IndexPath) {
        // edit cell in a specific position
    }
    
    init() {
        // imagine that data loads from somewhere
        
        successful = true
        
        DataSource.cells = [
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1"),
            Cell(title: "book1", subtitle: "subtitle", image: "book1")
        ]
    }
}
