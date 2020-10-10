//
//  ListView.swift
//  CoreData_SwiftUI
//
//  Created by Trinh Thai on 10/9/20.
//

import SwiftUI

struct ListView: View {
    @StateObject var vm = ListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.data, id: \.objectID) { obj in
                    Text(vm.getName(for: obj))
                        .onTapGesture { vm.openUpdateView(object: obj) }
                }.onDelete(perform: vm.deleteData)
            }.listStyle(InsetGroupedListStyle())
            
            HStack {
                TextField("Data here", text: $vm.text)
                Button(action: vm.writeData) {
                    Text("Save")
                }
            }.padding()
        }
        .sheet(isPresented: $vm.isUpdating) {
            UpdateView(viewModel: vm)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
