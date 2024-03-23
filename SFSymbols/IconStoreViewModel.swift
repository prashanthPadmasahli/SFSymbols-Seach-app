//
//  IconStoreViewModel.swift
//  SFSymbols
//
//  Created by mac on 23/03/24.
//

import Foundation
import SwiftUI

class IconStoreViewModel: ObservableObject {
    @Published var searchText = ""
    let columns = Array(repeating: GridItem(), count: 5)
    
    var filteredIcons: [String] {
        if searchText.isEmpty {
            return allSymbols
        } else {
            return allSymbols.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
}
