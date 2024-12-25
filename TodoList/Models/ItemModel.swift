//
//  ItemModel.swift
//  TodoList
//
//  Created by Danut Popa on 25.12.2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    static var exampleItem = ItemModel(title: "Example item", isCompleted: false)
}
