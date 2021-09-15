//
//  HiLayoutModel.m
//  HiExension
//
//  Created by four on 2021/9/14.
//

#import "HiLayoutModel.h"

@implementation HiLayoutModel

#pragma mark *********** instance ***********
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

#pragma mark *********** property ***********

- (instancetype)left {
    self.attribute2 = NSLayoutAttributeLeft;
    return self;
}

- (instancetype)right {
    self.attribute2 = NSLayoutAttributeRight;
    return self;
}

- (instancetype)top {
    self.attribute2 = NSLayoutAttributeTop;
    return self;
}

- (instancetype)bottom {
    self.attribute2 = NSLayoutAttributeBottom;
    return self;
}

- (instancetype)width {
    self.attribute2 = NSLayoutAttributeWidth;
    return self;
}

- (instancetype)height {
    self.attribute2 = NSLayoutAttributeHeight;
    return self;
}

- (instancetype)centerX {
    self.attribute2 = NSLayoutAttributeCenterX;
    return self;
}

- (instancetype)centerY {
    self.attribute2 = NSLayoutAttributeCenterY;
    return self;
}

#pragma mark *********** multiplier ***********
- (id (^)(CGFloat))multiplier {
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

#pragma mark *********** relate ***********
- (id(^)(UIView *))equal {
    __weak typeof(self) weak = self;
    return ^(UIView *view) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view;
        strong.relate = NSLayoutRelationEqual;
        return strong;
    };
}

@end
