//
//  TechNewsSwiftUIApp.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 13/07/22.
//

import SwiftUI

@main
struct TechNewsSwiftUIApp: App {
    let newsObj  = NewsManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(newsObj)
        }
    }
}
