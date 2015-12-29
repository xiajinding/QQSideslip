//
//  LeftViewController.m
//  QQSideslip
//
//  Created by Lemon on 15/12/28.
//  Copyright © 2015年 LemonXia. All rights reserved.
//

#import "LeftViewController.h"
#import "AppBaseViewController.h"
#import "AppEngineManager.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray  *titleListArray;
@property (nonatomic, strong) UIImageView  *avatarImageView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleListArray = @[@"开通会员", @"QQ钱包", @"网上营业厅", @"个性装扮", @"我的收藏", @"我的相册", @"我的文件"];
    
    _listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200,self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _listTableView.dataSource = self;
    _listTableView.delegate = self;
    _listTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_listTableView];
    self.view.frame = CGRectMake(-(self.view.frame.size.width - self.view.frame.size.width / 6), 0, self.view.frame.size.width - self.view.frame.size.width / 6, kScreenHeight);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titleListArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentify = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = _titleListArray[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppBaseViewController *baseVC = [AppEngineManager sharedInstance].baseViewController;
    [baseVC homeControllerAppear];
 
}

@end
