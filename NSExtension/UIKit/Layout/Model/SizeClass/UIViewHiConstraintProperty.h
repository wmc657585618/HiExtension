//
//  UIViewHiConstraintProperty.h
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import <UIKit/UIKit.h>
#import "HiViewConstraint.h"
#import "UIViewHiEnum.h"

#ifdef DEBUG
#define HIAssert(condition, desc)    NSAssert(condition, desc)
#else
#define HIAssert(condition, desc)
#endif

typedef NS_OPTIONS(NSUInteger, HiSizeOptions) {
    HiSizeOptions_none = 0,
    HiSizeOptions_aa = 1 << 0,
    HiSizeOptions_ra = 1 << 1,
    HiSizeOptions_rr = 1 << 2,
    HiSizeOptions_rc = 1 << 3,
    HiSizeOptions_ca = 1 << 4,
    HiSizeOptions_cr = 1 << 5,
    HiSizeOptions_cc = 1 << 6,
    HiSizeOptions_ar = 1 << 7,
    HiSizeOptions_ac = 1 << 8,
};

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

@property (nonatomic, assign) NSInteger hi_sizeOptions;

- (void)hi_deactivateAllConstraints;

@end

NS_ASSUME_NONNULL_END
