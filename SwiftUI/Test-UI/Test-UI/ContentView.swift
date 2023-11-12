//
//  ContentView.swift
//  Test-UI
//
//  Created by BS1161 on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            
            GroupBox {
                
                ScrollView(.vertical, showsIndicators: true) {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .font(.footnote)
                }
                
            } label: {
                Label(
                    title: { Text("Haider bhai Terms and condition") },
                    icon: { Image(systemName: "building.columns") }
                )
            }
            .frame(height: 300)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
