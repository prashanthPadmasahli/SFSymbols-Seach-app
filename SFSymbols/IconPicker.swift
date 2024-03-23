//
//  IconPicker.swift
//  SFSymbols
//
//  Created by mac on 23/03/24.
//

import SwiftUI

struct IconPicker: View {
    @State var showSheet = false
    @State var isColor = false
    @Binding var selectedIcon: String
    let title: String
    
    var body: some View {
        Button {
            self.showSheet = true
        } label: {
            HStack {
                Text(title)
                    .padding(.trailing, 40)
                Image(systemName: selectedIcon)
                    .renderingMode(isColor ? .original : .template)
                    .font(.title)
            }
            .foregroundColor(.primary)
        }
        .sheet(isPresented: $showSheet) {
            IconGridView(selectedIcon: $selectedIcon, isColor: $isColor)
        }
    }
}

struct IconPicker_Previews: PreviewProvider {
    static var previews: some View {
        IconPicker(selectedIcon: .constant("person"), title: "Select an icon")
    }
}
