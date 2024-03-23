//
//  ContentView.swift
//  SFSymbols
//
//  Created by mac on 23/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIcon = "person.circle"
    
    var body: some View {
        IconPicker(selectedIcon: $selectedIcon, title: "Select a icon")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
