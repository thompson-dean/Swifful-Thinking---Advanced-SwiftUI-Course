//
//  ContentView.swift
//  AnimatableDataBootcamp
//
//  Created by Dean Thompson on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animate: Bool = true
    
    var body: some View {
        
        ZStack {
            PacMan(offsetAmount: animate ? 20 : 0.0001)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 0 : 30)
                .frame(width: 250, height: 250)
                
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var animatableData: Double {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    var cornerRadius: Double
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX  - cornerRadius, y: rect.maxY))

            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct PacMan: Shape {
    
    var animatableData: CGFloat {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    var offsetAmount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -offsetAmount),
                endAngle: Angle(degrees: offsetAmount),
                clockwise: true)
        }
    }
}
