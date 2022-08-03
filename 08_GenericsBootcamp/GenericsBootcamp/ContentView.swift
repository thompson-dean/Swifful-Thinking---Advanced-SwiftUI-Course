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

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class ViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello, World!")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericModel(info: "Hello, World!")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
        
    }
    
}

struct GenericView<T: View>: View {
    let content: T
    
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
        
    }
}

struct ContentView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        VStack {
            GenericView(content: Text("custom content"), title:  "Jazz" )
            
            Text(vm.stringModel.info ?? "No Data")
            Text(vm.boolModel.info?.description ?? "No Data")
            Text(vm.genericStringModel.info ?? "No Data")
            Text(vm.genericBoolModel.info?.description ?? "No Data")
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
