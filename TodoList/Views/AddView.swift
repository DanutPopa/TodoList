//
//  AddView.swift
//  TodoList
//
//  Created by Danut Popa on 24.12.2024.
//

import SwiftUI

struct AddView: View {
    @State private var itemText = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    
    var isTextValid: Bool {
        let trimmedText = itemText.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedText.isEmpty == false && itemText.count >= 3
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("Enter the item name", text: $itemText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: save) {
                        Text("Save".uppercased())
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .disabled(isTextValid == false)
                }
                .padding()
            }
            .navigationTitle("Add an Item 🖊️")
        }
    }
    
    func save() {
        listViewModel.addItem(title: itemText)
        dismiss()
    }
}

#Preview {
    AddView()
}
