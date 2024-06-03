//
//  ContentViewModel.swift
//  MvvmPatternSwiftUi
//
//  Created by Priyanshi on 27/05/24.
//

import Foundation
import Combine


@MainActor
class ContentViewModel : ObservableObject {

    var Myview = ContentView()

    @Published var items: [UserModel] = []
    var cancellables = Set<AnyCancellable>()
    
    
//    func fetchItems() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
//
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: [UserModel].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error fetching items: \(error)")
//                }
//            }, receiveValue: { [weak self] items in
//                self?.items = items
//            })
//            .store(in: &cancellables)
//    }
//}
    

    
    func fetchItems() async  {
        do {
         
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            let (data, _) = try await URLSession.shared.data(from: url!)
            let decodedData = try JSONDecoder().decode([UserModel].self, from: data)
            print(decodedData)
//            DispatchQueue.main.async {
 //           self.items = decodedData
 //           print(self.items)
//            }
            await MainActor.run{
                                self.items = decodedData
                                print(self.items)
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

