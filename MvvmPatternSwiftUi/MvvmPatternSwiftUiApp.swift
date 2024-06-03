//
//  MvvmPatternSwiftUiApp.swift
//  MvvmPatternSwiftUi
//
//  Created by Priyanshi on 27/05/24.
//

import SwiftUI

@main
struct MvvmPatternSwiftUiApp: App {
    var body: some Scene {
        WindowGroup{
//            let service = UserService()
            let viewModel = ContentViewModel()
            ContentView(viewModel: viewModel)
        
        }
    }
}
