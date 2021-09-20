//
//  HomeView.swift
//  HomeView
//
//  Created by Logan Koshenka on 9/13/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        Button(action: { }) {
            Text("Start".uppercased())
                .font(.system(size: 36, weight: .regular))
                .foregroundStyle(
                    .linearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
