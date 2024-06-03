//
//  ContentView.swift
//  MvvmPatternSwiftUi
//
//  Created by Priyanshi on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var viewModel = ContentViewModel()
    @State private var expandedItems: Set<Int> = []
    
    var body: some View {
     
     
        NavigationView {
            List(viewModel.items) { item in
                VStack {
                    HStack {
                        Button(action: {
                            if expandedItems.contains(item.id ?? 0) {
                                expandedItems.remove(item.id ?? 0)
                            } else {
                                expandedItems.insert(item.id ?? 0)
                            }
                        }) {
                            Image(systemName: "list.bullet.rectangle.fill")
                           
                        }
                        .padding(.leading, 8)
                        
                        VStack(alignment: .trailing) {
                            Text(item.title ?? "")
                                .font(.headline)
                        }
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    
                    if expandedItems.contains(item.id ?? 0) {
                        Text(item.body ?? "")
                            .font(.subheadline)
                            .padding(.leading, 32) // To align with the text above
                    }
                }
            }
            .navigationTitle("Information")

            
            //                .onAppear {
            //                    viewModel.fetchItems()
            //                }
            .task {
                await viewModel.fetchItems()
            }
            
        }
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}


