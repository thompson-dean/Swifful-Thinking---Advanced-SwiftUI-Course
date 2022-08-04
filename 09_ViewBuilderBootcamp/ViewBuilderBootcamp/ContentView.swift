//
//  ContentView.swift
//  ViewBuilderBootcamp
//
//  Created by Dean Thompson on 2022/08/03.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(description)
                .font(.callout)
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: "description")
            
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
