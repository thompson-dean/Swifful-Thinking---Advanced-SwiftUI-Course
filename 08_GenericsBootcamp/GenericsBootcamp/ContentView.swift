//
//  ContentView.swift
//  GenericsBootcamp
//
//  Created by Dean Thompson on 2022/08/02.
//

import SwiftUI

struct StringModel {
    
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct BoolModel {
    
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

class ViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, World!")
    @Published var boolModel = BoolModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
    }
    
}

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        VStack {
            Text(vm.stringModel.info ?? "No Data")
            Text(vm.boolModel.info?.description ?? "No data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
