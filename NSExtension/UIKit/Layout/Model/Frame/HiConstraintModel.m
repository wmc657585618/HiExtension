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

@property (nonatomic, weak) UIView *constraintView; // 添加约束的 view
@property (nonatomic, weak) NSLayoutConstraint *layoutConstraint;

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, assign) NSLayoutAttribute attribute1;
@property (nonatomic, assign) NSLayoutRelation relate;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, assign) NSLayoutAttribute attribute2;
@property (nonatomic, assign) CGFloat mult;
@property (nonatomic, assign) CGFloat constraint;

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

#pragma mark *********** layout ***********
- (NSLayoutConstraint *)layout {
    
    // 防止重复创建
    if (self.layoutConstraint) return self.layoutConstraint;
    
    NSLayoutConstraint *layout = nil;
    if ([self.view1 isEqual:self.view2] && self.attribute1 == self.attribute2) {
#ifdef DEBUG
        @throw [NSException exceptionWithName:@"HiConstraint" reason:@"不能依赖自身相同属性" userInfo:nil];
#endif
        return layout;
    }
    
    
    // 不依赖 其它 view
    if (!self.view2) {
        
        if (self.attribute1 == NSLayoutAttributeWidth || self.attribute1 == NSLayoutAttributeHeight) {
            
            layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:self.mult constant:self.constraint];
            
        } else {
            
            layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:self.view1.superview attribute:self.attribute1 multiplier:self.mult constant:self.constraint];
        }
        
        
        [self.view1.superview addConstraint:layout];
        self.constraintView = self.view1.superview;
        self.layoutConstraint = layout;
        return layout;
    }
    
    // 依赖相同属性
    // 没有设置 attribute2
    if (NSLayoutAttributeNotAnAttribute == self.attribute2) self.attribute2 = self.attribute1;
    
    layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:self.view2 attribute:self.attribute2 multiplier:self.mult constant:self.constraint];
    self.layoutConstraint = layout;
    
    // 位置关系
    // view2 在 view1 中
    // view1 在 view2 中
    // view1 和 view2 在不同的 view 中
    // 相同坐标系
    UIView *superview = self.view2;
    NSMutableArray *superviews = [NSMutableArray array];
    // view2 在 view1 中
    while (superview) {
        [superviews addObject:superview];
        if ([superview isEqual:self.view1]) break;
        superview = superview.superview;
    }
    
    // view1 在 view2 中 或者是 view2 的superview 中
    superview = self.view1;
    while (superview) {
        if ([superview isEqual:self.view2] || [superviews containsObject:superview]) break;
        superview = superview.superview;
    }

    [superview addConstraint:layout];
    self.constraintView = superview;
    return layout;
}

- (void)remove {
    [self.constraintView removeConstraint:self.layoutConstraint];
}

- (NSLayoutConstraint *)getConstraint {
    return self.layoutConstraint;
}

#pragma mark *********** protocol ***********
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

#pragma mark *********** relate ***********
- (HiConstraintModel * _Nonnull (^)(UIView * _Nonnull))equal {
    __weak typeof(self) weak = self;
    return ^(UIView * view2) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view2;
        strong.relate = NSLayoutRelationEqual;
        return strong;
    };
}

- (HiConstraintModel * _Nonnull (^)(UIView * _Nonnull))less {
    
    __weak typeof(self) weak = self;
    return ^(UIView * view2) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view2;
        strong.relate = NSLayoutRelationLessThanOrEqual;
        return strong;
    };
}

- (HiConstraintModel * _Nonnull (^)(UIView * _Nonnull))greater {
    
    __weak typeof(self) weak = self;
    return ^(UIView * view2) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view2;
        strong.relate = NSLayoutRelationGreaterThanOrEqual;
        return strong;
    };
}

- (void (^)(CGFloat))min {
    __weak typeof(self) weak = self;
    return ^(CGFloat v) {
        __strong typeof(weak) strong = weak;
        strong.constraint = v;
        strong.relate = NSLayoutRelationGreaterThanOrEqual;
    };
}

- (void (^)(CGFloat))max {
    __weak typeof(self) weak = self;
    return ^(CGFloat v) {
        __strong typeof(weak) strong = weak;
        strong.constraint = v;
        strong.relate = NSLayoutRelationLessThanOrEqual;
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

#pragma mark *********** multiplier ***********

- (id<HiConstraint> (^)(CGFloat))multiplier {
    __weak typeof(self) weak = self;
    return ^(CGFloat v) {
        __strong typeof(weak) strong = weak;
        strong.mult = v;
        return strong;
    };
}

- (void (^)(CGFloat))value {
    __weak typeof(self) weak = self;
    return ^(CGFloat v) {
        __strong typeof(weak) strong = weak;
        strong.constraint = v;
    };
}

@end

