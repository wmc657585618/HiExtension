//
//  UIViewHiConstraintExtension.h
//  RouterDemo
//
//  Created by four on 2020/5/18.
//  Copyright © 2020 Four. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HiFrameProtocol.h"

@interface UIView (HiViewLayout)

/// 只能创建 constraints, 不能有后续操作
- (NSArray<NSLayoutConstraint *> *_Nullable)hi_constraints_instance:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

/// default is aa.
- (void)hi_constraints_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_update:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_frame_make:(void(^_Nullable)(id<HiViewFrameBuilder> _Nullable builder))block;

- (void)hi_removeAllConstraints;
- (void)hi_removeConstraint:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *_Nonnull)hi_constraint:(NSLayoutAttribute)attribute;

@property (nonatomic, readonly) NSArray<NSLayoutConstraint *> * _Nonnull hi_allConstraints;

@end

@interface UIView (HiViewContraintUpdate)

/// 更新 constraint
- (void)hi_updateAttribute:(NSLayoutAttribute)attribute constraint:(CGFloat)constraint;

- (void)hi_updateTop:(CGFloat)constraint;

- (void)hi_updateBottom:(CGFloat)constraint;

- (void)hi_updateLeft:(CGFloat)constraint;

- (void)hi_updateRight:(CGFloat)constraint;

- (void)hi_updateCenterX:(CGFloat)constraint;

- (void)hi_updateCenterY:(CGFloat)constraint;

- (void)hi_updateWidth:(CGFloat)constraint;

- (void)hi_updateHeight:(CGFloat)constraint;

/**
 如果之前有 才重置
 */
- (void)hi_resetTop:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint;

- (void)hi_resetBottom:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint;

- (void)hi_resetLeft:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint;

- (void)hi_resetRight:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint;

- (void)hi_resetCenterX:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint;

- (void)hi_resetCenterY:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint;

- (void)hi_resetWidth:(void(^_Nullable)(id<HiConstraintSize0> _Nullable constraint))constraint;

- (void)hi_resetHeight:(void(^_Nullable)(id<HiConstraintSize0> _Nullable constraint))constraint;

@end


@interface UIView (HiViewAnimations)

- (void)hi_animateWithDuration:(NSTimeInterval)duration animations:(void (^_Nullable)(void))animations;

- (void)hi_animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^_Nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;

- (void)hi_animateWithDuration:(NSTimeInterval)duration animations:(void (^_Nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;

- (void)hi_animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^_Nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion;

@end


@interface UIView (HiViewComplex)

- (void)hi_horizotalHuggingPriority:(UILayoutPriority)priority;
- (void)hi_verticallHuggingPriority:(UILayoutPriority)priority;
- (void)hi_horizotalCompressionPriority:(UILayoutPriority)priority;
- (void)hi_verticallCompressionPriority:(UILayoutPriority)priority;

@end
