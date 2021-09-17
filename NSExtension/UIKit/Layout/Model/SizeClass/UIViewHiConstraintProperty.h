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

@end

NS_ASSUME_NONNULL_END
