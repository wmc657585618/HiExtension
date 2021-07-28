//
//  HIContraintMake.m
//  HIExension
//
//  Created by four on 2021/7/23.
//

#import "HIContraintMake.h"

@implementation UIView (HIContraintMake)

- (void)throwException:(NSString *)exception {
#ifdef DEBUG
        @throw [NSException exceptionWithName:@"HiConstraint" reason:exception userInfo:nil];
#endif
}

/// 命中自身相同属性
- (BOOL)checkView:(id)view attribute1:(NSLayoutAttribute)attr1 attribute2:(NSLayoutAttribute)attr2 {
    
    if (!self.superview) {
        [self throwException:@"superview is nil"];
        return false;
    }
    
    if ([self isEqual:view] && attr1 == attr2) {
        [self throwException:@"不能依赖自身相同属性"];
        return false;
    }
    
    return true;
}

/// 是否合法
- (BOOL)checkVertical:(NSLayoutAttribute)attribute {
    if (NSLayoutAttributeBottom == attribute || NSLayoutAttributeTop == attribute || NSLayoutAttributeCenterY == attribute) return true;

    [self throwException:@"只能依赖 top bottom cententY"];

    return false;
}

/// 是否合法
- (BOOL)checkHorizontal:(NSLayoutAttribute)attribute {
    if (NSLayoutAttributeRight == attribute || NSLayoutAttributeLeft == attribute || NSLayoutAttributeCenterX == attribute) return true;
    
    [self throwException:@"只能依赖 left right cententX"];

    return false;
}

/// 是否合法
- (BOOL)checkSize:(NSLayoutAttribute)attribute {
    if (NSLayoutAttributeWidth == attribute || NSLayoutAttributeHeight == attribute) return true;
    
    [self throwException:@"只能依赖 width height"];

    return false;
}

- (NSLayoutConstraint *)hi_constraintWithAttribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c {

    if ([self checkView:view2 attribute1:attr1 attribute2:attr2]) {
        return nil;
    }
    
    bool avilable = false;
    switch (attr1) {
            
        case NSLayoutAttributeLeft:
        case NSLayoutAttributeRight:
        case NSLayoutAttributeCenterX:
            avilable = [self checkHorizontal:attr2];
            
            break;
        case NSLayoutAttributeTop:
        case NSLayoutAttributeBottom:
        case NSLayoutAttributeCenterY:
            avilable = [self checkVertical:attr2];
            
            break;
        case NSLayoutAttributeWidth:
        case NSLayoutAttributeHeight:
            avilable = [self checkSize:attr2];
            
            break;
        default:
            break;
    }
    
    if (avilable) {
        return [NSLayoutConstraint constraintWithItem:self attribute:attr1 relatedBy:relation toItem:view2 attribute:attr2 multiplier:multiplier constant:c];;
    }

    return nil;
}

- (NSLayoutConstraint *)hi_left_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_right_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_top_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_bottom_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_width_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {

    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_height_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_centerX_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

- (NSLayoutConstraint *)hi_centerY_relatedBy:(NSLayoutRelation)relation toItem:(nullable id)view2 attribute:(NSLayoutAttribute)attr multiplier:(CGFloat)multiplier constant:(CGFloat)c {
    
    return [self hi_constraintWithAttribute:NSLayoutAttributeLeft relatedBy:relation toItem:view2 attribute:attr multiplier:multiplier constant:c];
}

@end
