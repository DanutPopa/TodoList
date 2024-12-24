//
//  TodoListApp.swift
//  TodoList
//
//  Created by Danut Popa on 24.12.2024.
//

import SwiftUI

/*
 MVVM - Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct TodoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
