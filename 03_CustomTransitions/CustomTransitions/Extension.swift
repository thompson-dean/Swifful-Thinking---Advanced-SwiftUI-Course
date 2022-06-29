//
//  Extension.swift
//  CustomTransitions
//
//  Created by Dean Thompson on 2022/06/29.
//

import Foundation
import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
    }
}

struct PressableButtonStyle: ButtonStyle {

    let scaledAmount: Double

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)

    }
}

extension View {
    func withDefaultButtonViewModifier() -> some View {
        self.modifier(DefaultButtonViewModifier())
    }
}

extension View {
    func withPressableButton(scaledAmount: Double = 1.01) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}
