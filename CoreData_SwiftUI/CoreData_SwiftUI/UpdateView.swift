//
//  UpdateView.swift
//  CoreData_SwiftUI
//
//  Created by Trinh Thai on 10/10/20.
//

import SwiftUI

struct UpdateView: View {
    @ObservedObject var viewModel: ListViewModel
    var body: some View {
        VStack(spacing: 20) {
            TextField("Update Here", text: $viewModel.updateText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: viewModel.updateData) {
                Text("Update")
            }
        }.padding()
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(viewModel: ListViewModel())
    }
}
