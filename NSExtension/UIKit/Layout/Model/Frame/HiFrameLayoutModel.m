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

@property (nonatomic, weak) HiViewFrame *builder;
@property (nonatomic, strong) NSNumber *result;// 储存计算结果

@end

@implementation HiFrameLayoutModel

- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute builder:(HiViewFrame *)builder
{
    self = [super initWithView:view attribute:attribute];
    if (self) {
        self.builder = builder;
    }
    return self;
}

- (void (^)(CGFloat))value {
    __weak typeof(self) weak = self;
    return ^(CGFloat value) {
        __strong typeof(weak) strong = weak;
        strong.constraint = value;
        // 能算出先算出来
        strong.result = [self workout];
    };
}

- (NSNumber *)workout {
    // 设置自身属性
    if (!self.view2) {
        if ([self isSizeAttribute:self.attribute1]) return @(self.constraint);
        
        // 相对 super view.
        CGFloat v = [self.view1.superview boundsForAtrribute:self.attribute1];
        return @(self.constraint + v);
    }
    
    if (![self.view1 isEqual:self.view2]) {
        return @([self otherView]);
    }
    
    // 依赖 view1 自身属性
    return nil;
}

- (CGFloat)resultWithAttribute:(NSLayoutAttribute)attribute {

    switch (attribute) {
        case NSLayoutAttributeLeft:
            return self.builder.leftValue;
            
        case NSLayoutAttributeRight:
            return self.builder.rightValue;

        case NSLayoutAttributeTop:
            return self.builder.topValue;

        case NSLayoutAttributeBottom:
            return self.builder.bottomValue;

        case NSLayoutAttributeWidth:
            return self.builder.widthValue;

        case NSLayoutAttributeHeight:
            return self.builder.heightValue;

        case NSLayoutAttributeCenterX:
            return self.builder.centerXValue;

        case NSLayoutAttributeCenterY:
            return self.builder.centerYValue;

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

- (CGFloat)frame {
    if (self.result) return self.result.floatValue;
    
#ifdef DEBUG
        if (self.attribute2 == self.attribute1) {
            @throw [NSException exceptionWithName:@"HiConstraint" reason:@"不能依赖自身相同属性" userInfo:nil];
        }
         
        if (NSLayoutAttributeNotAnAttribute == self.attribute2) {
            @throw [NSException exceptionWithName:@"HiConstraint" reason:@"必须添加自身属性" userInfo:nil];
        }
#endif
    
    return [self resultWithAttribute:self.attribute2] * self.mult + self.constraint;
}

@end
