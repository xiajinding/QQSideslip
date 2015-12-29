//
//  MainTabBarViewController.m
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MessageViewController.h"
#import "ContactsViewController.h"
#import "ActiveViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createSubViewControllers];
    
    [self setTabBarItems];
}


- (void)createSubViewControllers {
    MessageViewController *limitVC = [[MessageViewController alloc]init];
    UINavigationController *limitNav = [[UINavigationController alloc]initWithRootViewController:limitVC];
    
    ContactsViewController  *saleVC = [[ContactsViewController alloc]init];
    UINavigationController *saleNav = [[UINavigationController alloc]initWithRootViewController:saleVC];
    
    ActiveViewController  *sale = [[ActiveViewController alloc]init];
    UINavigationController *salNav = [[UINavigationController alloc]initWithRootViewController:sale];
    
    self.viewControllers = @[limitNav,saleNav,salNav];
}

#pragma mark 设置所有的分栏元素项
- (void)setTabBarItems {
    // 这里这样设置title会有点问题，在自己的类里面再定义就会出错
    NSArray *titleArray = @[@"消息",@"联系人",@"动态"];
    NSArray *normalImgArray = @[@"relationship_normal.png",@"message_normal.png",@"foundNew_normal.png"];
    NSArray *selectedImgArray = @[@"relationship_selected.png",@"message_selected.png",@"foundNew_selected.png"];
    //循环设置信息
    for (int i = 0; i<3; i++) {
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[i] image:[UIImage imageNamed:normalImgArray[i]] selectedImage:[[UIImage imageNamed:selectedImgArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        vc.tabBarItem.tag = i;
        
        
    }
    //tabbar的背景图片
    //        self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    //item被选中时背景文字颜色
    //权限最高
    [[UITabBarItem appearance]setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    //self.navigationController.navigationBar 这个的话会有一个专题改不了，所以这用最高权限
    //获取导航条最高权限
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
}
@end
