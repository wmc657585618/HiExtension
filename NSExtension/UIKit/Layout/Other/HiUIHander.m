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
    UIView *view = self;
    NSMutableArray *result = [NSMutableArray array];
    while (view) {
        [result addObject:view];
        view = view.superview;
    }
    return result;
}

- (UIView *)superViewWithView:(UIView *)view {
    
    if ([view.superview isEqual:self]) return self;
    if ([self.superview isEqual:view]) return view;
    if ([self.superview isEqual:view.superview]) return view.superview;
    
    NSArray *views1 = [self superViews];
    NSArray *views2 = [view superViews];

    NSInteger i = views1.count - 1;
    NSInteger j = views2.count - 1;

    while (j > 0 && i > 0) {
        
        UIView *view1 = [views1 objectAtIndex:i];
        UIView *view2 = [views2 objectAtIndex:i];

        if ([view1 isEqual:view2]) return view1;
        j --;
        i --;
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
