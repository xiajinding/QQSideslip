//
//  AppEngineManager.m
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "AppEngineManager.h"
#import "AppBaseViewController.h"
#import "MainTabBarViewController.h"

static  AppEngineManager *sharesElement = nil;
@implementation AppEngineManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharesElement = [[self alloc]init];
    });
    return sharesElement;
}

- (instancetype)init {
    
    if (self = [super init]) {
        // 初始化Controller
        self.baseViewController = [[AppBaseViewController alloc]init];
        self.mainTabBarController = [[MainTabBarViewController alloc]init];
    }
    return self;
}
@end
