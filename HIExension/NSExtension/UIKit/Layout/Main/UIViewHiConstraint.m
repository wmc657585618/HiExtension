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

- (void)hi_constraints_make:(void(^)(id<HiViewConstraintBuilder> builder))block {
    NSAssert(self.superview, @"Super view is nil");

    if (block) {
        NSAssert(self.hi_builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(self.hi_builder);
        [self.hi_builder updateFrame];
    }
    block = nil;
}

- (void)hi_frame_make:(void(^)(id<HiViewFrameBuilder> builder))block {
    NSAssert(self.superview, @"Super view is nil");
    
    if (block) {
        HiViewFrame *builder = [[HiViewFrame alloc] initWithView:self];
        block(builder);
        [builder updateFrame];
        builder = nil;
    }
    
    block = nil;
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
