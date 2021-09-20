//
//  ContentView.swift
//  SwiftUIAnimations
//
//  Created by Logan Koshenka on 8/13/21.
//

import SwiftUI

struct ContentView: View {
    @State var rotateBell = false
    
    var body: some View {
        Image(systemName: "bell.fill")
            .font(.system(size: 125))
            .rotationEffect(Angle(degrees: rotateBell ? -45 : 45), anchor: .top)
            .animation(Animation.spring().repeatCount(10))
            .onAppear {
                rotateBell.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
