//
//  AddView.swift
//  TodoList
//
//  Created by Danut Popa on 24.12.2024.
//

import SwiftUI

struct AddView: View {
    @State private var itemText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Enter the item name", text: $itemText)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }
            }
            .padding()

        }
        .navigationTitle("Add an Item 🖊️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
