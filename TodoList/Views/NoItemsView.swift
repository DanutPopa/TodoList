//
//  NoItemsView.swift
//  TodoList
//
//  Created by Danut Popa on 27.12.2024.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animate = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    Text("There are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                        .padding(.bottom, 20)
                    NavigationLink {
                        AddView()
                    } label: {
                        Text("Add Something 🥳")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .padding(.horizontal, animate ? 30 : 50)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                }
                .multilineTextAlignment(.center)
                .padding(40)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50: 30)
                .onAppear(perform: addAnimation)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Title")
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
