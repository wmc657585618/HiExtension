//
//  HiFrameLayoutModel.m
//  HiUIKit
//
//  Created by four on 2021/2/18.
//

#import "HiFrameLayoutModel.h"
#import "HiUIHander.h"
#import "HiViewFrame.h"

@interface HiFrameLayoutModel ()

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, assign) NSLayoutAttribute attribute1;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, assign) NSLayoutAttribute attribute2;
@property (nonatomic, assign) CGFloat constraint;
@property (nonatomic, assign) CGFloat mult;

@property (nonatomic, weak) HiViewFrame *builder;
@property (nonatomic, assign) BOOL layout; // 是否已经计算过. 依赖自身可能已经计算过
@property (nonatomic, assign) CGFloat result; // 储存计算结果

@end

@implementation HiFrameLayoutModel

- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute builder:(HiViewFrame *)builder
{
    self = [super init];
    if (self) {
        self.mult = 1.0;
        self.view1 = view;
        self.attribute1 = attribute;
        self.builder = builder;
    }
    return self;
}

- (HiFrameLayoutModel *)left {
    self.attribute2 = NSLayoutAttributeLeft;
    return self;
}

- (HiFrameLayoutModel *)right {
    self.attribute2 = NSLayoutAttributeRight;
    return self;
}

- (HiFrameLayoutModel *)top {
    self.attribute2 = NSLayoutAttributeTop;
    return self;
}

- (HiFrameLayoutModel *)bottom {
    self.attribute2 = NSLayoutAttributeBottom;
    return self;
}

- (HiFrameLayoutModel *)width {
    self.attribute2 = NSLayoutAttributeWidth;
    return self;
}

- (HiFrameLayoutModel *)height {
    self.attribute2 = NSLayoutAttributeHeight;
    return self;
}

- (HiFrameLayoutModel *)centerX {
    self.attribute2 = NSLayoutAttributeCenterX;
    return self;
}

- (HiFrameLayoutModel *)centerY {
    self.attribute2 = NSLayoutAttributeCenterY;
    return self;
}

- (HiFrameLayoutModel *)relate {
    self.view2 = self.view1;
    return self;
}

- (HiFrameLayoutModel * _Nonnull (^)(UIView * _Nonnull))equal {
    __weak typeof(self) weak = self;
    return ^(UIView *view) {
        __strong typeof(weak) strong = weak;
        strong.view2 = view;
        return strong;
    };
}

- (HiFrameLayoutModel * _Nonnull (^)(CGFloat))multiplier {
    __weak typeof(self) weak = self;
    return ^(CGFloat value) {
        __strong typeof(weak) strong = weak;
        strong.mult = value;
        return strong;
    };
}

- (HiFrameLayoutModel * _Nonnull (^)(CGFloat))value {
    __weak typeof(self) weak = self;
    return ^(CGFloat value) {
        __strong typeof(weak) strong = weak;
        strong.constraint = value;
        return strong;
    };
}

- (CGFloat)valueWithAttribute:(NSLayoutAttribute)attribute {
    switch (attribute) {
        case NSLayoutAttributeLeft:
            return self.builder.left.frame;
            
        case NSLayoutAttributeRight:
            return self.builder.right.frame;

        case NSLayoutAttributeTop:
            return self.builder.top.frame;

        case NSLayoutAttributeBottom:
            return self.builder.bottom.frame;

        case NSLayoutAttributeWidth:
            return self.builder.width.frame;

        case NSLayoutAttributeHeight:
            return self.builder.height.frame;

        case NSLayoutAttributeCenterX:
            return self.builder.centerX.frame;

        case NSLayoutAttributeCenterY:
            return self.builder.centerY.frame;

        default:
            return 0;
    }
}

- (BOOL)isSizeAttribute:(NSLayoutAttribute)attribute {
    return attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight;
}

// 非自身
- (CGFloat)otherView {
    
    // 可能没有给 attribute2 (直接 和 attribute1 相同)
    NSLayoutAttribute attribute2 = NSLayoutAttributeNotAnAttribute == self.attribute2 ? self.attribute1 : self.attribute2;
    
    // 相同坐标系
    if ([self.view1.superview isEqual:self.view2.superview]) {
        CGFloat v = [self.view2 frameForAtrribute:attribute2];
        return v * self.mult + self.constraint;
    }
    
    // view1 是 view2 的子视图
    if ([self.view1.superview isEqual:self.view2]) {
        CGFloat v = [self.view2 boundsForAtrribute:attribute2];
        return v * self.mult + self.constraint;
    }
    
    CGRect frame = [self.view2 convertToView:self.view1.superview];
    CGFloat v = hi_attribute_frame(frame, attribute2);
    return v * self.mult + self.constraint;
}

// 计算结果
- (CGFloat)layoutResult {
    
    // 设置自身属性
    if (!self.view2) {
        if ([self isSizeAttribute:self.attribute1]) return self.constraint;
        // 相对 super view.
        CGFloat v = [self.view1.superview boundsForAtrribute:self.attribute1];
        return self.constraint + v;
    }
    
    // 依赖自身属性
    if ([self.view1 isEqual:self.view2]) {
#ifdef DEBUG
        if (self.attribute2 == self.attribute1) {
            @throw [NSException exceptionWithName:@"HiConstraint" reason:@"不能依赖自身相同属性" userInfo:nil];
        }
         
        if (NSLayoutAttributeNotAnAttribute == self.attribute2) {
            @throw [NSException exceptionWithName:@"HiConstraint" reason:@"必须添加自身属性" userInfo:nil];
        }
#endif
        
        CGFloat v = [self valueWithAttribute:self.attribute2];
        return v * self.mult + self.constraint;
    }
    
    return [self otherView];
}

- (CGFloat)frame {
    if (!self.layout) {
        self.layout = true;
        self.result = [self layoutResult];
    }
    
    return self.result;
}

@end
