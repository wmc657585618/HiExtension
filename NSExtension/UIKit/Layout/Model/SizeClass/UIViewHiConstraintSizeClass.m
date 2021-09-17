//
//  UIViewHiConstraintSizeClass.m
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import "UIViewHiConstraintSizeClass.h"
#import "UIViewHiConstraintProperty.h"

@implementation UIView (HiSizeClass)

- (void)hi_deactivateAllConstraints{

    [self.hi_builder_rr deactivateConstraints];
    [self.hi_builder_rc deactivateConstraints];
    [self.hi_builder_ra deactivateConstraints];
    [self.hi_builder_cr deactivateConstraints];
    [self.hi_builder_cc deactivateConstraints];
    [self.hi_builder_ca deactivateConstraints];
    [self.hi_builder_ar deactivateConstraints];
    [self.hi_builder_ac deactivateConstraints];
    [self.hi_builder_aa deactivateConstraints];
}

- (void)hi_activateConstraints:(HiSizeClass)sizeClass {

    if (1 == self.hi_aa_instanced) return;
    
    [self hi_deactivateAllConstraints];
    HiViewConstraint *constraint = [self hi_getBuilderWithSizeClass:sizeClass];
    [constraint activateConstraints];
}

- (void)hi_deactivateConstraints:(HiSizeClass)sizeClass {
    
    if (1 == self.hi_aa_instanced) return;

    HiViewConstraint *constraint = [self hi_getBuilderWithSizeClass:sizeClass];
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

- (HiSizeClass)hi_sizeClass {
    return [self hi_getSizeClass];
}

@end
