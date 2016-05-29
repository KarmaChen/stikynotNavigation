//
//  NewTipViewController.m
//  stikynotNavigation
//
//  Created by Karma on 16/5/29.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "NewTipViewController.h"
#import "Global.h"

@implementation NewTipViewController
-(void)viewDidLoad{
    //根据设备计算偏移量
    CGFloat offsetY;
    if (IS_IPHONE_6AND6S) {
        offsetY = -8;
    }else if(IS_IPHONE_6PAND6SP) {
        offsetY = -15;
    }else {
        offsetY = 0;
    }
    //左侧按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_long_bg_n"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_long_bg_p"] forState:UIControlStateHighlighted];
    [leftBtn setTitle:@"列表" forState:UIControlStateNormal];
    [leftBtn setTitle:@"列表" forState:UIControlStateHighlighted];
    [leftBtn.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
    //文字的偏移
    leftBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 7, 0, 0);
    [leftBtn addTarget:self action:@selector(clickLeftBarButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 56, 44)];
    [leftView addSubview:leftBtn];
    //调整位置
    leftView.bounds = CGRectOffset(leftView.bounds, 10, offsetY);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    //右侧按钮
    UIButton *rightBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn1.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [rightBtn1 setImage:[UIImage imageNamed:@"btn_send"] forState:UIControlStateNormal];
    [rightBtn1 setImage:[UIImage imageNamed:@"btn_send"] forState:UIControlStateHighlighted];
    [rightBtn1 addTarget:self action:@selector(clickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightView1 addSubview:rightBtn1];
    //调整位置
    rightView1.bounds = CGRectOffset(rightView1.bounds, -10, offsetY);
    UIBarButtonItem *rightBarButtonItem1 = [[UIBarButtonItem alloc] initWithCustomView:rightView1];
    
    UIButton *rightBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn2.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [rightBtn2 setImage:[UIImage imageNamed:@"btn_camera"] forState:UIControlStateNormal];
    [rightBtn2 setImage:[UIImage imageNamed:@"btn_camera"] forState:UIControlStateHighlighted];
    [rightBtn2 addTarget:self action:@selector(clickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightView2 addSubview:rightBtn2];
    //调整位置
    rightView2.bounds = CGRectOffset(rightView2.bounds, -10, offsetY);
    
    
    
    UIBarButtonItem *rightBarButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:rightView2];
    //添加两个
    NSArray *rightItems = @[rightBarButtonItem1,rightBarButtonItem2];
    self.navigationItem.rightBarButtonItems = rightItems;

}
-(void)clickLeftBarButton{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)clickRightBarButton{
    
}
@end
