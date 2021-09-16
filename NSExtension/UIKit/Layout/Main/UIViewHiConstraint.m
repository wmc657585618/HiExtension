//
//  UIViewHiConstraintExtension.m
//  RouterDemo
//
//  Created by four on 2020/5/18.
//  Copyright © 2020 Four. All rights reserved.
//

#import "UIViewHiConstraint.h"
#import "NSObjectHiExtension.h"
#import "HiViewFrame.h"
#import "HiViewConstraint.h"

@interface UIView (HiConstraintProperty)

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder;

@end

@implementation UIView (HiViewLayout)

- (HiViewConstraint *)hi_builder {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (NSArray<NSLayoutConstraint *> *)hi_constraints_instance:(void (^)(id<HiViewConstraintBuilder> _Nullable))block {
    NSAssert(self.superview, @"Super view is nil");

    if (block) {
        NSAssert(self.hi_builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        HiViewConstraint *_builer = [[HiViewConstraint alloc] initWithView:self];

        block(_builer);
        [_builer updateFrame];
        return _builer.allConstraints;
    }
    
    return nil;
}
- (void)hi_constraints_make:(void(^)(id<HiViewConstraintBuilder> builder))block {
    NSAssert(self.superview, @"Super view is nil");

    if (block) {
        NSAssert(self.hi_builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(self.hi_builder);
        [self.hi_builder updateFrame];
    }
}

- (void)hi_frame_make:(void(^)(id<HiViewFrameBuilder> builder))block {
    NSAssert(self.superview, @"Super view is nil");
    
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

#pragma mark *********** animations ***********

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

#pragma mark *********** update ***********
- (void)hi_updateAttribute:(NSLayoutAttribute)attribute constraint:(CGFloat)constraint {
    [self.hi_builder updateAttribute:attribute constraint:constraint];
}

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

- (NSArray<NSLayoutConstraint *> *)hi_allConstraints {
    return self.hi_builder.allConstraints;
}

@end
