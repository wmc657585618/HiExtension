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
    
    if (!view) return nil;
    
    NSArray *arr1 = [self superViews];
    NSArray *arr2 = [view superViews];
    NSSet *set = [NSSet setWithArray:arr2];
    for (NSUInteger i = 0; i < arr1.count; ++i) {
        UIView *targetView = arr1[i];
        if ([set containsObject:targetView]) return targetView;
    }
    
    return nil;
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
