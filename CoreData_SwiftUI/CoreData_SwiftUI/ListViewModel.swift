//
//  ListViewModel.swift
//  CoreData_SwiftUI
//
//  Created by Trinh Thai on 10/9/20.
//

import SwiftUI
import CoreData

class ListViewModel: ObservableObject {
    let context = PersistenceController.shared.container.viewContext
    @Published var data: [NSManagedObject] = []
    @Published var text: String = ""
    @Published var selectedObject: NSManagedObject = NSManagedObject()
    @Published var updateText: String = ""
    @Published var isUpdating: Bool = false
    init() {
        readData()
    }
    
    func readData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        do {
            data = try context.fetch(request) as! [NSManagedObject]
        } catch let  error {
            print("Error fetching core data: \(error), \(error.localizedDescription)")
        }
    }
    
    func writeData() {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context)
        entity.setValue(text, forKey: "name")
        do {
            try context.save()
            data.append(entity)
            text = ""
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(offsets: IndexSet) {
        //EXAMPLE CODE OF APPLE
//        offsets.map { items[$0] }.forEach(viewContext.delete)
        
        for index in offsets {
            let object = data[index]
            context.delete(object)
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
            data.remove(at: index)
        }
    }
    
    func updateData() {
        if let index = data.firstIndex(of: selectedObject) {
            let object = data[index]
            object.setValue(updateText, forKey: "name")
            do {
                try context.save()
                data[index] = object
                isUpdating.toggle()
                updateText = ""
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func getName(for object: NSManagedObject) -> String {
        return object.value(forKey: "name") as! String
    }
    
    func openUpdateView(object: NSManagedObject) {
        selectedObject = object
        isUpdating.toggle()
    }
    
    
    //EXAMPLE CODE OF APPLE
    
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    
    
}

