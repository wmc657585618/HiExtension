//
//  HiViewConstraint.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import <UIKit/UIKit.h>
#import "HiFrameProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HiViewConstraint : NSObject<HiViewConstraintBuilder>

@property (nonatomic, assign, readonly) BOOL avaliable;

- (instancetype)initWithView:(UIView *)view;
- (void)updateFrame;
- (void)removeAllConstraints;
- (void)removeConstraint:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint *)constraint:(NSLayoutAttribute)attribute;
- (void)animateLayout;

/// 更新 constraint
- (void)updateAttribute:(NSLayoutAttribute)attribute constraint:(CGFloat)constraint;

/// 如果之前有 才重置
- (void)resetAttribute:(NSLayoutAttribute)attribute constraint:(void(^)(id))constraint;

@property (nonatomic, readonly) NSArray<NSLayoutConstraint *> *allConstraints;

@end

NS_ASSUME_NONNULL_END
