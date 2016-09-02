//
//  ViewController.m
//  UIViewTest
//
//  Created by 梁兴胜 on 16/9/2.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import "ViewController.h"
#import "SmallView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.没有给定 frame,此时 SmallView的imageView 已经大小为0了
//    SmallView *small = [[SmallView alloc] init];
    SmallView *small = [[SmallView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:small];
    //约束和 frame 不一致,SmallView的imageView 已经大小为0了,只对SmallView起效果了
    [small mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.mas_equalTo(self.view).mas_offset(30);
        make.leading.mas_equalTo(self.view).mas_offset(30);
    }];
    
    
    //2.frame 和约束不一致，使用的是约束，无所谓啦
    //SmallView *small = [[SmallView alloc] init];
//    SmallView *small = [[SmallView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    [self.view addSubview:small];
//    //约束和 frame 不一致，使用的是约束，无所谓啦
//    [small mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.top.mas_equalTo(self.view).mas_offset(30);
//        make.leading.mas_equalTo(self.view).mas_offset(30);
//    }];
    
}



@end
