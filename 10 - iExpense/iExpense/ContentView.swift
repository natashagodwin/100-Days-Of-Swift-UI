//
//  ContentView.swift
//  iExpense
//
//  Created by Natasha Godwin on 5/31/21.
//

import SwiftUI


struct ContentView: View {
  @ObservedObject var expenses = Expenses()
  @State private var addExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount, specifier: "%.2f")")
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    self.addExpense = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $addExpense) {
            // Pass the expenses object to AddView. 
            AddView(expenses: self.expenses)
        }
    }
    
    func delete(at location: IndexSet) {
        expenses.items.remove(atOffsets: location)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
