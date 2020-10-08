//
//  ListView.swift
//  CoreData_SwiftUI
//
//  Created by Trinh Thai on 10/9/20.
//

import SwiftUI

struct ListView: View {
    @State var viewModel = "Test"// TODO:
    var body: some View {
        VStack {
            List {
                ForEach(0 ..< 5) { item in
                    Text("Hello, World!")
                        .onTapGesture {
                            print("onTapGesture")
                    }
                }.onDelete(perform: { indexSet in
                    print("delete at \(indexSet)")
            })
            }.listStyle(InsetGroupedListStyle())
            
            HStack {
                TextField("Enter data", text: $viewModel)
                Button(action: {}, label: {
                    Text("Save")
                })
            }.padding()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
