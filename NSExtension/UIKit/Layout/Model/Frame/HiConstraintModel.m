//
//  HiConstraintModel.m
//  HiUIKit
//
//  Created by four on 2021/2/19.
//

#import "HiConstraintModel.h"
#import "HiOptions.h"
#import "HiUIHander.h"

@interface HiConstraintModel ()

@property (nonatomic, weak) UIView *constraintView;
@property (nonatomic, weak) NSLayoutConstraint *layoutConstraint;

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, assign) NSLayoutAttribute attribute1;
@property (nonatomic, assign) NSLayoutRelation relate;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, assign) NSLayoutAttribute attribute2;
@property (nonatomic, assign) CGFloat constraint;
@property (nonatomic, assign) CGFloat mult;

@end


@implementation HiConstraintModel

- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    self = [super init];
    if (self) {
        self.mult = 1.0;
        self.view1 = view;
        self.attribute1 = attribute;
    }
    return self;
}

- (HiConstraintModel *)left {
    self.attribute2 = NSLayoutAttributeLeft;
    return self;
}

- (HiConstraintModel *)right {
    self.attribute2 = NSLayoutAttributeRight;
    return self;
}

- (HiConstraintModel *)top {
    self.attribute2 = NSLayoutAttributeTop;
    return self;
}

- (HiConstraintModel *)bottom {
    self.attribute2 = NSLayoutAttributeBottom;
    return self;
}

- (HiConstraintModel *)width {
    self.attribute2 = NSLayoutAttributeWidth;
    return self;
}

- (HiConstraintModel *)height {
    self.attribute2 = NSLayoutAttributeHeight;
    return self;
}

- (HiConstraintModel *)centerX {
    self.attribute2 = NSLayoutAttributeCenterX;
    return self;
}

- (HiConstraintModel *)centerY {
    self.attribute2 = NSLayoutAttributeCenterY;
    return self;
}

- (NSLayoutConstraint *)layout {
    
    NSLayoutConstraint *layout = nil;
    
    if ([self.view1 isEqual:self.view2] && self.attribute1 == self.attribute2) {
#ifdef DEBUG
        @throw [NSException exceptionWithName:@"HiConstraint" reason:@"不能依赖自身相同属性" userInfo:nil];
#endif
        return layout;
    }
    
    // 大小
    if (self.attribute1 == NSLayoutAttributeWidth || self.attribute1 == NSLayoutAttributeHeight) {
        layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.constraint];
        [self.view1 addConstraint:layout];
        self.constraintView = self.view1;
        self.layoutConstraint = layout;
        return layout;
    }
    
    // 自己
    if (!self.view2) {
        layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:self.view1.superview attribute:self.attribute1 multiplier:self.mult constant:self.constraint];
        
        [self.view1.superview addConstraint:layout];
        self.constraintView = self.view1.superview;
        self.layoutConstraint = layout;
        return layout;
    }
    
    if (NSLayoutAttributeNotAnAttribute == self.attribute2) self.attribute2 = self.attribute1;
    layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:self.view2 attribute:self.attribute2 multiplier:self.mult constant:self.constraint];
    self.layoutConstraint = layout;
    
    // 相同坐标系
    if ([self.view1.superview isEqual:self.view2.superview]) {
        [self.view1.superview addConstraint:layout];
        return layout;
    }

    // 包含
    if ([self.view1.superview isEqual:self.view2]) {
        [self.view2 addConstraint:layout];
        self.constraintView = self.view2;
        return layout;
    }
    
    if ([self.view2.superview isEqual:self.view1]) {
        [self.view1 addConstraint:layout];
        self.constraintView = self.view1;
        return layout;
    }
    
    UIView *superview = [self.view1 superViewWithView:self.view2];
    [superview addConstraint:layout];
    self.constraintView = superview;
    return layout;
}

/// MARK:- subclass
- (HiConstraintModel *(^)(CGFloat))multiplier {
    __weak typeof(self) weak = self;
    return ^(CGFloat value) {
        __strong typeof(weak) strong = weak;
        strong.mult = value;
        return strong;
    };
}

- (__kindof HiConstraintModel * _Nonnull (^)(CGFloat))lessValue {
    self.relate = NSLayoutRelationLessThanOrEqual;
    return [self value];
}

- (__kindof HiConstraintModel * _Nonnull (^)(CGFloat))greaterValue {
    self.relate = NSLayoutRelationGreaterThanOrEqual;
    return [self value];
}

- (__kindof HiConstraintModel *(^)(CGFloat))value {
    __weak typeof(self) weak = self;
    return ^(CGFloat value) {
        __strong typeof(weak) strong = weak;
        strong.constraint = value;
        return strong;
    };
}

- (void (^)(void))autoValue {
    __weak typeof(self) weak = self;
    return ^(void) {
        __strong typeof(weak) strong = weak;
        strong.constraint = 0;
        strong.relate = NSLayoutRelationGreaterThanOrEqual;
    };
}

- (__kindof HiConstraintModel *(^)(UIView *))less {
    __weak typeof(self) weak = self;
    return ^(UIView *view) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view;
        strong.relate = NSLayoutRelationLessThanOrEqual;
        return strong;
    };
}

- (__kindof HiConstraintModel *(^)(UIView *))greater {
    __weak typeof(self) weak = self;
    return ^(UIView *view) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view;
        strong.relate = NSLayoutRelationGreaterThanOrEqual;
        return strong;
    };
}

- (__kindof HiConstraintModel *(^)(UIView *))equal {
    __weak typeof(self) weak = self;
    return ^(UIView *view) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view;
        strong.relate = NSLayoutRelationEqual;
        return strong;
    };
}

- (void)remove {
    [self.constraintView removeConstraint:self.layoutConstraint];
}

- (NSLayoutConstraint *)getConstraint {
    return self.layoutConstraint;
}

@end

@implementation HiConstraintHorizontal0Model
@end

@implementation HiConstraintHorizontal1Model

- (HiConstraintHorizontal0Model * _Nonnull (^)(UIView * _Nonnull))less{
    return [super less];
}

- (HiConstraintHorizontal0Model * _Nonnull(^)(UIView * _Nonnull))greater {
    return [super greater];
}

- (HiConstraintHorizontal0Model * _Nonnull(^)(UIView * _Nonnull))equal {
    return [super equal];
}

@end

@implementation HiConstraintVertical0Model
@end

@implementation HiConstraintVertical1Model

- (HiConstraintVertical0Model * _Nonnull (^)(UIView * _Nonnull))less{
    return [super less];
}

- (HiConstraintVertical0Model * _Nonnull(^)(UIView * _Nonnull))greater {
    return [super greater];
}

- (HiConstraintVertical0Model * _Nonnull(^)(UIView * _Nonnull))equal {
    return [super equal];
}

@end

@implementation HiConstraintSize0Model
@end

@implementation HiConstraintSize1Model

- (HiConstraintSize0Model * _Nonnull (^)(UIView * _Nonnull))less{
    return [super less];
}

- (HiConstraintSize0Model * _Nonnull(^)(UIView * _Nonnull))greater {
    return [super greater];
}

- (HiConstraintSize0Model * _Nonnull(^)(UIView * _Nonnull))equal {
    return [super equal];
}

@end
