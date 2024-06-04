//
//  BackgroundAnimateScheduler.swift
//  BadIcon
//
//  Created by 刘易斯 on 2024/06/03.
//

import Foundation
import BackgroundTasks

class BackgroundAnimateScheduler {
    static let shared = BackgroundAnimateScheduler()
    
    func scheduleAnimation() {
        BGTaskScheduler.shared.getPendingTaskRequests { requests in
            print("\(requests.count) task pending.")
            guard requests.isEmpty else { return }
            
            let request = BGProcessingTaskRequest(identifier: "com.nltv.BadIcon.animate")
            request.earliestBeginDate = nil
            request.requiresExternalPower = false
            request.requiresNetworkConnectivity = false
            
            do {
                try BGTaskScheduler.shared.submit(request)
                BGTaskScheduler.shared._simulateLaunchForTask(withIdentifier: "com.nltv.BadIcon.animate")
            } catch {
                print("Apple rejected our request :(\n\(error)")
            }
        }
    }
    
    func executeAnimation(task: BGProcessingTask) {
        // scheduleAnimation()
        
        print("Hooray! We got background execution privilege. Starting animator...")
        
        IconAnimator.shared.startAnimation() {
            task.setTaskCompleted(success: true)
        }
    }
}
