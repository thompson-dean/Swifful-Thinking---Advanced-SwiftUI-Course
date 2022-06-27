//
//  ViewModifierBootcamp.swift
//  CustomModifiers
//
//  Created by Dean Thompson on 2022/06/27.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
        
    }
}

extension View {
    func withDefaultButtonFormatting(with backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello World!")
                .font(.headline)
                .withDefaultButtonFormatting()
            
            Text("Hello Keiko!")
                .font(.subheadline)
                .withDefaultButtonFormatting(with: .red)
            
            Text("Hello!!!")
                .font(.title)
                .withDefaultButtonFormatting(with: .green)
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
