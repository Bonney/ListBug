//
//  ContentView.swift
//  ListBug
//
//  Created by Jason Ji on 2/25/20.
//  Copyright © 2020 Jason Ji. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("One")) {
                    ForEach(0..<5) { i in
                        NavigationLink(destination: DetailView(value: i)) {
                            Text("Thing \(i)")
                        }.frame(minWidth: 200, idealHeight: 30, alignment: .leading)
                    }
                }
                Section(header: Text("Two")) {
                    ForEach(6..<10) { j in
                        NavigationLink(destination: DetailView(value: j)) {
                            Text("Item \(j)")
                        }.frame(minWidth: 200, idealHeight: 30, alignment: .leading)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }.listStyle(myListStyle())
    }

    func myListStyle() -> some ListStyle {
        #if os(macOS)
        return SidebarListStyle()       // Incorrectly duplicates items in the first section.
        #else
        return DefaultListStyle()       // Correctly displays items in both sections on macOS and iOS.
        #endif

    }
}

struct DetailView: View {
    var value: Int

    var body: some View {
        VStack {
            Text("Selected \(value)").frame(maxWidth: .infinity, maxHeight: .infinity)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
