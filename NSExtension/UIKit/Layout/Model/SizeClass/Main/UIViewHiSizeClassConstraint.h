//
//  UIViewHiSizeClassConstraint.h
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import "HiFrameProtocol.h"
#import "UIViewHiSizeClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiSizeClassConstraint)

- (void)hi_constraints_rr_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_rc_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_ra_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_constraints_cr_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_cc_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_ca_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_constraints_ar_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_ac_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;
- (void)hi_constraints_aa_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_activateConstraints:(HiSizeClass)sizeClass;
- (void)hi_deactivateConstraints:(HiSizeClass)sizeClass;
- (void)hi_deactivateAllConstraints;

@end

NS_ASSUME_NONNULL_END
