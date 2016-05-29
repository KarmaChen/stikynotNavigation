//
//  rootViewController.m
//  stikynotNavigation
//
//  Created by Karma on 16/5/29.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "rootViewController.h"
#import "Global.h"
#import "NewTipViewController.h"
@interface rootViewController ()

@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //根据设备计算偏移量
    CGFloat offsetY;
    if (IS_IPHONE_6AND6S) {
        offsetY = -8;
    }else if(IS_IPHONE_6PAND6SP) {
        offsetY = -15;
    }else {
        offsetY = 0;
    }
    
    //TitleView
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 33)];
    titleLabel.text = @"备忘录";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 33)];
    [centerView addSubview:titleLabel];
    centerView.bounds = CGRectOffset(centerView.bounds, 0, offsetY);
    self.navigationItem.titleView = centerView;
    
    //左侧按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [leftBtn setImage:[UIImage imageNamed:@"btn_about"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"btn_about"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(clickLeftBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftView addSubview:leftBtn];
    
    //调整位置
    leftView.bounds = CGRectOffset(leftView.bounds, 10, offsetY);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    
    //右侧按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [rightBtn setImage:[UIImage imageNamed:@"btn_new"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"btn_new"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(clickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightView addSubview:rightBtn];
    //调整位置
    rightView.bounds = CGRectOffset(rightView.bounds, -10, offsetY);
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

}
-(void)clickLeftBarButton{
    NSLog(@"%s", __func__);
}
-(void)clickRightBarButton{
    NSLog(@"%s", __func__);
    
    //创建新控制器
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewTipViewController *NewTipVC =[storyBoard instantiateViewControllerWithIdentifier:@"NewTipViewController"];
    [self.navigationController pushViewController:NewTipVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
