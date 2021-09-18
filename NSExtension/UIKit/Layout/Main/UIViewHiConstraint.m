//
//  UIViewHiConstraintExtension.m
//  RouterDemo
//
//  Created by four on 2020/5/18.
//  Copyright © 2020 Four. All rights reserved.
//

#import "UIViewHiConstraint.h"
#import "HiViewFrame.h"
#import "UIViewHiSizeClassFile.h"

@implementation UIView (HiViewLayout)

- (NSArray<NSLayoutConstraint *> *)hi_constraints_instance:(void (^)(id<HiViewConstraintBuilder> _Nullable))block {
    HIAssert(self.superview, @"Super view is nil");

    if (block) {
        self.translatesAutoresizingMaskIntoConstraints = false;
        HiViewConstraint *_builer = [[HiViewConstraint alloc] initWithView:self];
        block(_builer);
        [_builer updateFrame];
        return _builer.allConstraints;
    }
    
    return nil;
}

- (void)hi_constraints_make:(void(^)(id<HiViewConstraintBuilder> builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_aa block:block];
}

- (void)hi_constraints_update:(void (^)(id<HiViewConstraintBuilder> _Nullable))block {
    [self hi_constraints_updateWithSizeClass:HiSizeClass_aa block:block];
}

- (void)hi_frame_make:(void(^)(id<HiViewFrameBuilder> builder))block {
    HIAssert(self.superview, @"Super view is nil");
    
    if (block) {
        HiViewFrame *builder = [[HiViewFrame alloc] initWithView:self];
        block(builder);
        [builder updateFrame];
    }    
}

- (void)hi_removeConstraint:(NSLayoutAttribute)attribute {
    [self.hi_builder removeConstraint:attribute];
}

- (void)hi_removeAllConstraints {
    [self.hi_builder removeAllConstraints];
}

- (NSLayoutConstraint *)hi_constraint:(NSLayoutAttribute)attribute {
    return [self.hi_builder constraint:attribute];
}

- (NSArray<NSLayoutConstraint *> *)hi_allConstraints {
    return self.hi_builder.allConstraints;
}

@end

@implementation UIView (HiViewContraintUpdate)

- (void)hi_updateAttribute:(NSLayoutAttribute)attribute constraint:(CGFloat)constraint {
    [self.hi_builder updateAttribute:attribute constraint:constraint];
}

- (void)hi_updateTop:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeTop constraint:constraint];
}

- (void)hi_updateBottom:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeBottom constraint:constraint];
}

- (void)hi_updateLeft:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeLeft constraint:constraint];
}

- (void)hi_updateRight:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeRight constraint:constraint];
}

- (void)hi_updateCenterX:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeCenterX constraint:constraint];
}

- (void)hi_updateCenterY:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeCenterY constraint:constraint];
}

- (void)hi_updateWidth:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeWidth constraint:constraint];
}

- (void)hi_updateHeight:(CGFloat)constraint {
    [self.hi_builder updateAttribute:NSLayoutAttributeHeight constraint:constraint];
}

#pragma mark *********** reset ***********
- (void)hi_resetAttribute:(NSLayoutAttribute)attribute constraint:(void(^)(id))constraint {
    [self.hi_builder resetAttribute:attribute constraint:constraint];
}

- (void)hi_resetTop:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeTop constraint:constraint];
}

- (void)hi_resetBottom:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeBottom constraint:constraint];
}

- (void)hi_resetLeft:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeLeft constraint:constraint];
}

- (void)hi_resetRight:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeRight constraint:constraint];
}

- (void)hi_resetCenterX:(void(^_Nullable)(id<HiConstraintHorizontal0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeCenterX constraint:constraint];
}

- (void)hi_resetCenterY:(void(^_Nullable)(id<HiConstraintVertical0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeCenterY constraint:constraint];
}

- (void)hi_resetWidth:(void(^_Nullable)(id<HiConstraintSize0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeWidth constraint:constraint];
}

- (void)hi_resetHeight:(void(^_Nullable)(id<HiConstraintSize0> _Nullable constraint))constraint {
    [self hi_resetAttribute:NSLayoutAttributeHeight constraint:constraint];
}

@end


@implementation UIView (HiViewAnimations)

- (void)hi_animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations {
    
    if (animations) {
        animations();
        [UIView animateWithDuration:duration animations:^{
            [self.hi_builder animateLayout];
        }];
    }
}

- (void)hi_animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion  {
    
    if (animations) {
        animations();
        [UIView animateWithDuration:duration delay:delay options:options animations:^{
            [self.hi_builder animateLayout];
        } completion:completion];
    }
}

- (void)hi_animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion {
    if (animations) {
        animations();
        [UIView animateWithDuration:duration animations:^{
            [self.hi_builder animateLayout];
        } completion:completion];
    }
}

- (void)hi_animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion {
    if (animations) {
        animations();
        [UIView animateWithDuration:duration delay:delay usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:options animations:^{
            [self.hi_builder animateLayout];
        } completion:completion];
    }
}

@end

@implementation UIView (HiViewComplex)

- (void)hi_horizotalHuggingPriority:(UILayoutPriority)priority {
    [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)hi_verticallHuggingPriority:(UILayoutPriority)priority {
    [self setContentHuggingPriority:priority forAxis:UILayoutConstraintAxisVertical];
}

- (void)hi_horizotalCompressionPriority:(UILayoutPriority)priority {
    [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisHorizontal];
}

- (void)hi_verticallCompressionPriority:(UILayoutPriority)priority {
    [self setContentCompressionResistancePriority:priority forAxis:UILayoutConstraintAxisVertical];
}

@end
