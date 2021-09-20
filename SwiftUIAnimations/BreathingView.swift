//
//  CalmTheFuckDownView.swift
//  SwiftUIAnimations
//
//  Created by Logan Koshenka on 8/13/21.
//

import SwiftUI

struct BreathingView: View {
    @State var scale = false
    @State var rotate = false
    @State var move = false
    
    @State var isInhaling = true
    @State var isHolding = false
    @State var isExhaling = false
    @State var setCount = 0
    
    let inhaleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var inhaleTime = 4
    
    let holdTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var holdTime = 7
    
    let exhaleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var exhaleTime = 8
    
    var body: some View {
        ZStack {
            
            BreathingAnimationView(move: $move, scale: $scale, rotate: $rotate, isInhaling: $isInhaling)
            
            if isInhaling {
                Text("Inhale: \(inhaleTime)")
                    .onReceive(inhaleTimer) { _ in
                        if inhaleTime > 1 {
                            inhaleTime -= 1
                        } else {
                            isInhaling = false
                            isHolding = true
                            inhaleTime = 5
                        }
                    }
            }
            
            if isHolding {
                Text("Hold: \(holdTime)")
                    .onReceive(holdTimer) { _ in
                        if holdTime > 1 {
                            holdTime -= 1
                        } else {
                            isHolding = false
                            isExhaling = true
                            holdTime = 8
                            move.toggle()
                            scale.toggle()
                            rotate.toggle()
                        }
                    }
            }
            
            if isExhaling {
                Text("Exhale: \(exhaleTime)")
                    .onReceive(exhaleTimer) { _ in
                        if exhaleTime > 1 {
                            exhaleTime -= 1
                        } else {
                            isExhaling = false
                            isInhaling = true
                            exhaleTime = 9
                            move.toggle()
                            scale.toggle()
                            rotate.toggle()
                        }
                    }
            }
    }
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingView()
    }
}

struct BreathingAnimationView: View {
    @Binding var move: Bool
    @Binding var scale: Bool
    @Binding var rotate: Bool
    @Binding var isInhaling: Bool
    
    var body: some View {
        ZStack {
            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? -90 : 0)
                
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? 90 : 0)
            }
            .opacity(0.5)
            
            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? -90 : 0)
                
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? 90 : 0)
            }
            .opacity(0.5)
            .rotationEffect(.degrees(60))
            
            ZStack {
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? -90 : 0)
                
                Circle().fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .bottom, endPoint: .top))
                    .frame(width: 120, height: 120)
                    .offset(y: move ? 90 : 0)
            }
            .opacity(0.5)
            .rotationEffect(.degrees(120))
        }
        .rotationEffect(.degrees(rotate ? 90 : 0))
        .scaleEffect(scale ? 1.25 : 1/4)
        // .animation(.easeInOut.repeatForever(autoreverses: true).speed(0.075))
        .animation(.easeInOut.speed(isInhaling ? 0.075 : 0.0375))
        .onAppear {
            move.toggle()
            scale.toggle()
            rotate.toggle()
        }
        .transition(.opacity)
    }
}
