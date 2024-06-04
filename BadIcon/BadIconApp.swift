//
//  BadIconApp.swift
//  BadIcon
//
//  Created by 刘易斯 on 2024/06/02.
//

import SwiftUI
import BackgroundTasks

@main
struct BadIconApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.nltv.BadIcon.animate", using: DispatchQueue.main) { task in
            print("Starting background task...")
            BackgroundAnimateScheduler.shared.executeAnimation(task: task as! BGProcessingTask)
        }
        print("Registered background task.")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                print("App goes into background, try to sumbit animation request now...")
                BackgroundAnimateScheduler.shared.scheduleAnimation()
            }
        }
    }

}
