//
//  ContentView.swift
//  TodoList
//
//  Created by Danut Popa on 24.12.2024.
//

import SwiftUI

struct ListView: View {
    @State private var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third!"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    Text("Destination")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}


