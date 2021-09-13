//
//  HiUIHander.m
//  RouterDemo
//
//  Created by four on 2021/3/13.
//  Copyright © 2020 Four. All rights reserved.
//

#import "HiUIHander.h"

CGFloat hi_attribute_frame(CGRect frame, NSLayoutAttribute attribute) {
    switch (attribute) {
        case NSLayoutAttributeLeft:
        case NSLayoutAttributeLeading:
            return CGRectGetMinX(frame);
            
        case NSLayoutAttributeRight:
        case NSLayoutAttributeTrailing:
            return CGRectGetMaxX(frame);
            
        case NSLayoutAttributeTop:
            return CGRectGetMinY(frame);
            
        case NSLayoutAttributeBottom:
            return CGRectGetMaxY(frame);
            
        case NSLayoutAttributeWidth:
            return CGRectGetWidth(frame);
            
        case NSLayoutAttributeHeight:
            return CGRectGetHeight(frame);
            
        case NSLayoutAttributeCenterX:
            return CGRectGetMidX(frame);
            
        case NSLayoutAttributeCenterY:
            return CGRectGetMidY(frame);

        default:
            return 0;
    }
}

@implementation UIView (HiUIHander)

// 获取所有父类
- (NSArray *)superViews {
    UIView *view = self.superview;
    
    if (!view) return @[];
    
    NSMutableArray *result = [NSMutableArray array];
    while (view) {
        [result addObject:view];
        view = view.superview;
    }
    return result;
}

- (UIView *)superViewWithView:(UIView *)view {
    
    // 位置关系
    UIView *superview = self.superview;
    NSMutableArray *superviews = [NSMutableArray array];
    // view2 在 view1 中
    while (superview) {
        [superviews addObject:superview];
        if ([superview isEqual:view]) break;
        superview = superview.superview;
    }
    
    if (!superview) {
        // view1 在 view2 中 或者是 view2 的superview 中
        superview = view;
        while (superview) {
            if ([superview isEqual:self] || [superviews containsObject:superview]) break;
            superview = superview.superview;
        }
    }
    
    return superview;
}

- (CGRect)convertToView:(UIView *)view {
    CGRect frame = self.frame;

    if (!view) return frame;
    frame = [self.superview convertRect:frame toView:view];
    return frame;
}

- (CGFloat)frameForAtrribute:(NSLayoutAttribute)attribute {
    return hi_attribute_frame(self.frame, attribute);
}

- (CGFloat)boundsForAtrribute:(NSLayoutAttribute)attribute {
    return hi_attribute_frame(self.bounds, attribute);
}

@end
