//
//  UIViewHiConstraintProperty.h
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import <UIKit/UIKit.h>
#import "HiViewConstraint.h"
#import "UIViewHiEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiConstraintProperty)

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder;

/** siz class */
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_cr;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_cc;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ca;

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_rr;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_rc;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ra;

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ar;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ac;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_aa;

- (HiViewConstraint *)hi_getBuilderWithSizeClass:(HiSizeClass)sizeClass;
- (HiSizeClass)hi_getSizeClass;

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

/// hi_builder_aa 是否创建
/// hi_builder_aa 不能和其它共存
/// 0 - 没有
/// 1 - 已经创建
/// 2 - 已经创建其它
@property (nonatomic, assign) NSInteger hi_aa_instanced;

@end

NS_ASSUME_NONNULL_END
