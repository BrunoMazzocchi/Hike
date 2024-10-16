//
//  ContentView.swift
//  Hike
//
//  Created by Bruno Mazzocchi on 14/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        CardView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
