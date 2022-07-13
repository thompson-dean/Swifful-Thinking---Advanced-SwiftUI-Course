//
//  MatchedGeometryEffectBootcamp.swift
//  MatchedGeometry
//
//  Created by Dean Thompson on 2022/06/29.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
            VStack {
                
                if !isClicked {
                    RoundedRectangle(cornerRadius: 25.0)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: 100, height: 100)
                        
                }
                
                Spacer()
                
                if isClicked {
                    RoundedRectangle(cornerRadius: 25.0)
                        .matchedGeometryEffect(id: "rectangle", in: namespace)
                        .frame(width: 300, height: 200)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .onTapGesture {
                withAnimation(.easeInOut) {
                    self.isClicked.toggle()
                }
            }
    }
}

struct MatchedGeometryEffectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffectExample2()
            .previewInterfaceOrientation(.portrait)
    }
}

struct MatchedGeometryEffectExample2: View {
    
    let categories: [String] = ["Home", "Popular", "Saved"]
    @State private var selected: String = ""
    @Namespace private var namespace
    
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.5))
                            .matchedGeometryEffect(id: "category_background", in: namespace)
                            .frame(width: 35, height: 2)
                            .offset( y: 10)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .primary)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}
