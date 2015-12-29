//
//  AppBaseViewController.m
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "AppBaseViewController.h"
#import "LeftViewController.h"
#import "MainTabBarViewController.h"
#import "AppEngineManager.h"

@interface AppBaseViewController ()
{
    
    UIImageView     *backgroundIV;
    UIView          *baseView;
    CGFloat          displacementOfLeftViewController;
    CGPoint          centerOfLeftViewAtBeginning;
    CGPoint          centerOfBaseViewController;
    CGFloat          realDistance;
    
}

@end

@implementation AppBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;//这里设置YES才能设置自己navigation的Title
//    [AppEngineManager sharedInstance].mainTabBarController.tabBar.hidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControllers];
    
    //初始化背景的图片和黑色遮盖层
    [self configBackgroundElement];
}

- (void)initControllers {
    // 在AppEngineManage 类里面没有初始化的话_leftViewController是打不出来的
    _leftViewController = [[LeftViewController alloc]init];
    _mainTabBarController = [AppEngineManager sharedInstance].mainTabBarController;

}

- (void)configBackgroundElement {
    //注意添加覆盖的顺序
    backgroundIV = [[UIImageView alloc]init];
    backgroundIV.image = [UIImage imageNamed:@"WeakUp.jpg"];
    backgroundIV.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:backgroundIV];
    
    //动画初始参数
    centerOfLeftViewAtBeginning = _leftViewController.view.center;
    centerOfBaseViewController  = self.view.center;
    
    //把侧滑菜单加入跟控制器
    [self.view addSubview:_leftViewController.view];
    
    baseView = [[UIView alloc]initWithFrame:self.view.frame];
    baseView =_mainTabBarController.view;
    [self.view addSubview:baseView];
    
    // 滑动手势
    self.panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureOnBaseVC:)];
    [baseView addGestureRecognizer:self.panGesture];
    
    // 点击手势
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(homeControllerAppear)];
}

//左边的控制器
- (void)leftControllerAppear {
    //
    [baseView addGestureRecognizer:self.tapGesture];
    //在这里提前刷洗防止tableView留下上次选中的状态
    [_leftViewController.listTableView reloadData];
    displacementOfLeftViewController = centerOfBaseViewController.x + kScreenWidth - kScreenWidth / 6;;
    [self doAnimationWithType:@"left"];
//    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)homeControllerAppear{
    
    [baseView removeGestureRecognizer:self.tapGesture];
    displacementOfLeftViewController = self.view.center.x;
    [self doAnimationWithType:@"home"];
}

//处理动画
- (void)doAnimationWithType:(NSString *)type {
    [UIView animateWithDuration:0.5 animations:^{
        baseView.center = CGPointMake(displacementOfLeftViewController, self.view.center.y);
        if ([type isEqualToString:@"left"]) {
            _leftViewController.view.center = CGPointMake(centerOfLeftViewAtBeginning.x + displacementOfLeftViewController - self.view.center.x, centerOfLeftViewAtBeginning.y);
        }
        if ([type isEqualToString:@"home"]) {
            
            _leftViewController.view.center = CGPointMake(centerOfLeftViewAtBeginning.x , centerOfLeftViewAtBeginning.y);
        }
    }];
    
}
- (void)gestureOnBaseVC:(UIPanGestureRecognizer *)recognizer {
    realDistance = [recognizer translationInView:self.view].x;
    
    //结束时，自动激活停靠动作
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if (realDistance > kScreenWidth / 3) {
            [self leftControllerAppear];
        } else {
            [self homeControllerAppear];
        }
        return; //这是需要return，因为停止状态了;
    }
}

@end
