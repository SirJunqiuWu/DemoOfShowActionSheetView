//
//  WJQShowActionSheetView.m
//  DemoOfShowActionSheetView
//
//  Created by 吴 吴 on 16/9/2.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "WJQShowActionSheetView.h"

@implementation WJQShowActionSheetView
{
    /**
     *  全局退出按钮
     */
    UIButton *resginBtn;
    
    /**
     *  操作目标视图
     */
    UIView   *targetView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0];
    
    resginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,self.frame.size.width,self.frame.size.height)];
    resginBtn.backgroundColor = [UIColor clearColor];
    [resginBtn addTarget:self action:@selector(resginBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:resginBtn];
    
    targetView = [[UIView alloc] initWithFrame:CGRectMake(0,self.frame.size.height, self.frame.size.width,[WJQShowActionSheetView getHeight])];
    targetView.backgroundColor = [UIColor redColor];
    [self addSubview:targetView];
}

- (void)showInView:(UIView *)view {
    [UIView animateWithDuration:0.3f animations:^{
        resginBtn.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.3];
        CGFloat y = view.frame.size.height - targetView.frame.size.height;
        CGFloat width = view.frame.size.width;
        CGFloat hight = targetView.frame.size.height;
        targetView.frame = CGRectMake(0, y, width, hight);
        [view addSubview:self];
    }];
}

#pragma mark - 按钮点击事件

- (void)resginBtnPressed {
    [UIView animateWithDuration:0.3f animations:^{
        resginBtn.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.0f];
        targetView.frame = CGRectMake(0, self.frame.size.height,targetView.frame.size.width,targetView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - 获取视图高度

+ (CGFloat)getHeight {
    CGFloat totalH = 0.0;
    totalH +=22+14+20+25+51+31;
    return totalH;
}

@end
