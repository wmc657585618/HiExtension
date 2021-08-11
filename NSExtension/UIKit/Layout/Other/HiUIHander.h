//
//  HiUIHander.h
//  RouterDemo
//
//  Created by four on 2021/3/13.
//  Copyright © 2020 Four. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern CGFloat hi_attribute_frame(CGRect frame, NSLayoutAttribute attribute);

@interface UIView (HiUIHander)

- (UIView *)superViewWithView:(UIView *)view;

- (CGRect)convertToView:(UIView *)view;
- (CGFloat)frameForAtrribute:(NSLayoutAttribute)attribute;
- (CGFloat)boundsForAtrribute:(NSLayoutAttribute)attribute;
@end

NS_ASSUME_NONNULL_END
