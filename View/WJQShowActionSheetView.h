//
//  WJQShowActionSheetView.h
//  DemoOfShowActionSheetView
//
//  Created by 吴 吴 on 16/9/2.
//  Copyright © 2016年 JackWu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJQShowActionSheetView : UIView


/**
 *  将自己显示在某个view上
 *
 *  @param view 指定view
 */
- (void)showInView:(UIView *)view;

+ (CGFloat)getHeight;

@end
