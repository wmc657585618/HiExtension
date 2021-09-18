//
//  UIViewHiSizeClassConstraint.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClassConstraint.h"
#import "UIViewHiSizeClassFile.h"

@implementation UIView (HiSizeClassConstraint)

- (void)hi_activateConstraints:(HiSizeClass)sizeClass {
    [self hi_deactivateAllConstraints];
    HiViewConstraint *constraint = [self hi_getAvailableBuilderWithSizeClass:sizeClass];
    [constraint activateConstraints];
}

- (void)hi_deactivateConstraints:(HiSizeClass)sizeClass {
    HiViewConstraint *constraint = [self hi_getAvailableBuilderWithSizeClass:sizeClass];
    [constraint deactivateConstraints];
}

#pragma mark *********** make ***********
- (void)hi_constraints_rr_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_rr block:block];
}

- (void)hi_constraints_rc_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_rc block:block];
}

- (void)hi_constraints_ra_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_ra block:block];
}

- (void)hi_constraints_cr_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_cr block:block];
}

- (void)hi_constraints_cc_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_cc block:block];
}

- (void)hi_constraints_ca_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_ca block:block];
}

- (void)hi_constraints_ar_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_ar block:block];
}

- (void)hi_constraints_ac_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_ac block:block];
}

- (void)hi_constraints_aa_make:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block {
    [self hi_constraints_makeWithSizeClass:HiSizeClass_aa block:block];
}

- (void)hi_deactivateAllConstraints{

    if (self.hi_sizeOptions & HiSizeOptions_rr)
        [self.hi_builder_rr deactivateConstraints];
    
    if (self.hi_sizeOptions & HiSizeOptions_rc)
        [self.hi_builder_rc deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_ra)
        [self.hi_builder_ra deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_cr)
        [self.hi_builder_cr deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_cc)
        [self.hi_builder_cc deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_ca)
        [self.hi_builder_ca deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_ar)
        [self.hi_builder_ar deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_ac)
        [self.hi_builder_ac deactivateConstraints];

    if (self.hi_sizeOptions & HiSizeOptions_aa)
        [self.hi_builder_aa deactivateConstraints];
}

@end
