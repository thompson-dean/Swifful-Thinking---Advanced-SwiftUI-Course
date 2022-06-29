//
//  TransitionsBootcamp.swift
//  CustomTransitions
//
//  Created by Dean Thompson on 2022/06/29.
//

import SwiftUI

struct TransitionsBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button {
                    showView.toggle()
                } label: {
                    Text("BUTTON")
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .bottom)
                    ))
                    .animation(.easeInOut)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsBootcamp()
    }
}
