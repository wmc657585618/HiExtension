//
//  UIViewHiConstraintProperty.h
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import <UIKit/UIKit.h>
#import "UIViewHiEnum.h"
#import "HiViewConstraintBuilder.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiConstraintProperty)

/// 当前 可用的 builder
/// 不同 size clas 可能是不同的 builder
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder;

- (HiSizeClass)hi_getSizeClass;

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_updateWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_deactivateAllConstraints;

@end

NS_ASSUME_NONNULL_END
