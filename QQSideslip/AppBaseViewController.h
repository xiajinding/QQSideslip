//
//  AppBaseViewController.h
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftViewController;
@class MainTabBarViewController;

@interface AppBaseViewController : UIViewController

@property (nonatomic, strong) LeftViewController       *leftViewController;
@property (nonatomic, strong) MainTabBarViewController *mainTabBarController;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

- (void)homeControllerAppear;
- (void)leftControllerAppear;

@end
