//
//  BGTaskScheduler+Private.h
//  BadIcon
//
//  Created by 刘易斯 on 2024/06/03.
//

#ifndef BGTaskScheduler_Private_h
#define BGTaskScheduler_Private_h

@import BackgroundTasks;

@interface BGTaskScheduler (Private)

- (int)_simulateLaunchForTaskWithIdentifier:(NSString *)identifier;

@end


#endif /* BGTaskScheduler_Private_h */
