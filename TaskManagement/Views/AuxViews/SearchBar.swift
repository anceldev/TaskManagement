//
//  SearchBar.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.vertical, 16)
                .padding(.leading, 16)
                .padding(.trailing, 14)
            //            TextField("Search...", text: $searchText)
            //                .foregroundStyle(searchText.isEmpty ? Color.textColor1 : .white)
            TextField(text: $searchText) {
                Text("Search")
                    .foregroundStyle(searchText.isEmpty ? .textColor1 : .white)
            }
            .frame(maxWidth: .infinity)
            Button {
                print("no text")
                self.searchText = ""
            } label: {
                Image(systemName: "xmark")
            }
            .buttonStyle(.customCircleButton(size: 32))
            .padding(.vertical, 12)
            .padding(.trailing, 10)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(.gray1)
        .clipShape(RoundedRectangle(cornerRadius: 11))
    }
}

#Preview {
    @State var searchText = ""
    return SearchBar(searchText: $searchText)
}
