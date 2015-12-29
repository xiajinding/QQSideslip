//
//  AppEngineManager.h
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppBaseViewController;    //相当于整个容器
@class MainTabBarViewController; //包含TabBar的类

@interface AppEngineManager : NSObject

@property (nonatomic, strong)AppBaseViewController    *baseViewController;
@property (nonatomic, strong)MainTabBarViewController *mainTabBarController;

+ (instancetype)sharedInstance;

@end
