//
//  WJQShowActionSheetView.m
//  DemoOfShowActionSheetView
//
//  Created by 吴 吴 on 16/9/2.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import "WJQShowActionSheetView.h"

/**
 *  UIColor
 */
#define UIColorFromRGB(rgbValue)	    UIColorFromRGBA(rgbValue,1.0)

#define UIColorFromRGBA(rgbValue,a)	    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

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
    targetView.backgroundColor = [UIColor whiteColor];
    [self addSubview:targetView];
    
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 11, targetView.frame.size.width,14)];
    titleLbl.textColor = UIColorFromRGB(0x676A74);
    titleLbl.font = [UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.text = @"分享到";
    [targetView addSubview:titleLbl];
    
    UIView *redLine = [[UIView alloc]initWithFrame:CGRectMake((targetView.frame.size.width-30)/2, titleLbl.frame.origin.y+14+19, 30, 1)];
    redLine.backgroundColor = UIColorFromRGB(0xFF4444);
    [targetView addSubview:redLine];

    
    float btnW    = 50.0;
    float gap     = (targetView.frame.size.width - btnW *4)/5;
    for (int i = 0; i <4; i ++)
    {
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.frame = CGRectMake(gap*(i+1)+btnW*i, redLine.frame.origin.y+1+25, 50, 51);
        [shareBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"shareIcon_%i",i]] forState:UIControlStateNormal];
        shareBtn.tag = 100 + i ;
        [shareBtn addTarget:self action:@selector(shareBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [targetView addSubview:shareBtn];
    }
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

- (void)shareBtnPressed:(UIButton *)sender {
    NSInteger index = sender.tag - 100;
    if (_TouchResult)
    {
        _TouchResult(index);
    }
}

#pragma mark - 获取视图高度

+ (CGFloat)getHeight {
    CGFloat totalH = 0.0;
    totalH +=22+14+20+25+51+31;
    return totalH;
}

@end
