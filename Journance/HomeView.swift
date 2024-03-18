//
//  HomeView.swift
//  Journance
//
//  Created by Eric  on 19.11.23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var histor = History()
    @State var showAddScreen = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeView()
}
