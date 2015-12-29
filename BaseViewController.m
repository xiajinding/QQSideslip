//
//  BaseViewController.m
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "BaseViewController.h"
#import "AppEngineManager.h"
#import "AppBaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(gotoleftView)];
    leftItem.image = [UIImage imageNamed:@"letf_slide.png"];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)gotoleftView {
    [[AppEngineManager sharedInstance].baseViewController leftControllerAppear];
}

@end
