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

- (NSLayoutConstraint *)constraintView:(UIView *)view2 attri:(NSLayoutAttribute)attri {
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self.view1 attribute:self.attribute1 relatedBy:self.relate toItem:view2 attribute:attri multiplier:self.mult constant:self.constraint];
    [self.constraintView addConstraint:layout];
    
    return layout;
}
#pragma mark *********** layout ***********
- (NSLayoutConstraint *)layout {
    
    // 防止重复创建
    if (self.layoutConstraint) return self.layoutConstraint;
    
    UIView *view2 = nil;
    NSLayoutAttribute attri = NSLayoutAttributeNotAnAttribute;
    
    // 设置自身属性
    if (!self.view2) {
        
        // size
        if (self.attribute1 == NSLayoutAttributeWidth ||
            self.attribute1 == NSLayoutAttributeHeight) {
            
            self.constraintView = self.view1;
            
        } else {
            // origin
            // 相对 super, 约束 加在 super 上
            view2 = self.view1.superview;
            attri = self.attribute1;
            self.constraintView = self.view1.superview;
        }
        
    } else {
        
        // 依赖自身
        if ([self.view1 isEqual:self.view2]) {
            
            if (self.attribute1 == self.attribute2) {
            #ifdef DEBUG
                    @throw [NSException exceptionWithName:@"HiConstraint" reason:@"不能依赖自身相同属性" userInfo:nil];
            #endif
                    return nil;
            }
            
            // 不同属性依赖
            self.constraintView = self.view1.superview;
            attri = self.attribute2;
            view2 = self.view2;
            
        } else { // 依赖其它
        
            // 没有设置 attribute2
            if (NSLayoutAttributeNotAnAttribute == self.attribute2) self.attribute2 = self.attribute1;
            
            view2 = self.view2;
            attri = self.attribute2;
            
            self.constraintView = [self.view1 superViewWithView:self.view2];
        }
    }
    
    // 创建
    self.layoutConstraint = [self constraintView:view2 attri:attri];
    return self.layoutConstraint;
}

- (void)remove {
    [self.constraintView removeConstraint:self.layoutConstraint];
}

- (NSLayoutConstraint *)getConstraint {
    return self.layoutConstraint;
}

#pragma mark *********** relate ***********
- (HiConstraintModel * _Nonnull (^)(UIView * _Nonnull))equal {
    __weak typeof(self) weak = self;
    return ^(UIView * view2) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view2;
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

@end

