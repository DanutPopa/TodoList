//
//  ContentView.swift
//  TodoList
//
//  Created by Danut Popa on 24.12.2024.
//

import SwiftUI

struct ListView: View {
    @StateObject private var listViewModel = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(.plain)
                }
                
            }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        }
        .environmentObject(listViewModel)
    }
}

#Preview {
    ListView()
}
