//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/9/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
