//
//  ViewController.m
//  DemoOfShowActionSheetView
//
//  Created by 吴 吴 on 16/9/2.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "WJQShowActionSheetView.h"

#define AppHeight                      [UIScreen mainScreen].bounds.size.height
#define AppWidth                       [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI

- (void)setupUI {
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showBtn.frame = CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 40);
    showBtn.backgroundColor = [UIColor redColor];
    [showBtn setTitle:@"弹出" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
}

#pragma mark - 按钮点击事件 结束隐藏并移除

- (void)showBtnPressed {
    CGRect frame = CGRectMake(0,0,AppWidth,AppHeight);
    WJQShowActionSheetView *showActionSheetView = [[WJQShowActionSheetView alloc]initWithFrame:frame];
    [showActionSheetView showInView:[UIApplication sharedApplication].delegate.window];
    [showActionSheetView setTouchResult:^(NSInteger index) {
        [self shareWithTouchIndex:index];
    }];
}

- (void)shareWithTouchIndex:(NSInteger)index {
    switch (index) {
        case 0:
            NSLog(@"QQ");
            break;
        case 1:
            NSLog(@"微信");
            break;
        case 2:
            NSLog(@"朋友圈");
            break;
        case 3:
            NSLog(@"微博");
            break;
            
        default:
            break;
    }
}

@end
