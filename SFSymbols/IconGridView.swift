//
//  IconGridView.swift
//  SFSymbols
//
//  Created by mac on 23/03/24.
//

import SwiftUI

struct IconGridView: View {
    @Binding var selectedIcon: String
    @Binding var isColor: Bool
    @StateObject var vm = IconStoreViewModel()
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: vm.columns) {
                    ForEach(vm.filteredIcons, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .renderingMode(isColor ? .original : .template)
                            .font(.title)
                            .padding()
                            .onTapGesture {
                                selectedIcon = symbol
                                dismiss()
                            }
                    }
                }
            }
            .overlay(alignment: .bottomTrailing,content: {
                Button {
                    isColor.toggle()
                } label: {
                    Image(systemName: "wifi")
                        .renderingMode(isColor ? .template : .original)
                        .font(.title2)
                        .padding(20)
                        .background(.thinMaterial, in: Circle())
                }.tint(.primary)
            })
            .searchable(text: $vm.searchText)
            .navigationTitle("Icons")
        }
    }
}

struct IconGridView_Previews: PreviewProvider {
    static var previews: some View {
        IconGridView(selectedIcon: .constant(""), isColor: .constant(true))
    }
}
