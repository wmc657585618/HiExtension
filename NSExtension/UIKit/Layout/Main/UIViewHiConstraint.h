//
//  UIViewHiConstraintExtension.h
//  RouterDemo
//
//  Created by four on 2020/5/18.
//  Copyright © 2020 Four. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HiConstraintModel.h"
#import "HiFrameProtocol.h"

@interface UIView (HiViewLayout)

- (void)hi_constraints_make:(void(^)(id<HiViewConstraintBuilder> builder))block;
- (void)hi_frame_make:(void(^)(id<HiViewFrameBuilder> builder))block;

- (void)hi_removeAllConstraints;
- (void)hi_removeConstraint:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint *)hi_constraint:(NSLayoutAttribute)attribute;

- (void)hi_horizotalHuggingPriority:(UILayoutPriority)priority;
- (void)hi_verticallHuggingPriority:(UILayoutPriority)priority;
- (void)hi_horizotalCompressionPriority:(UILayoutPriority)priority;
- (void)hi_verticallCompressionPriority:(UILayoutPriority)priority;

@end
