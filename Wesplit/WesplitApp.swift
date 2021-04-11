//
//  WesplitApp.swift
//  Wesplit
//
//  Created by boyer on 2021/4/11.
//

import SwiftUI

@main
struct WesplitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
