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
    NSArray *array = nil;
    array = self.hi_builder_rr.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_rc.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_ra.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_cr.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_cc.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_ca.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_ar.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_ac.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
    
    array = self.hi_builder_aa.allConstraints;
    if (array)[NSLayoutConstraint deactivateConstraints:array];
}

- (NSArray *)hi_constraintsWithSizeClass:(HiSizeClass)sizeClass {
    HiViewConstraint *constraint = [self hi_getBuilderWithSizeClass:sizeClass];
    return constraint.allConstraints;
}

- (void)hi_activateConstraints:(HiSizeClass)sizeClass {
    [self hi_deactivateAllConstraints];
    
    NSArray *array = [self hi_constraintsWithSizeClass:sizeClass];
    if (array)[NSLayoutConstraint activateConstraints:array];
}

- (void)hi_deactivateConstraints:(HiSizeClass)sizeClass {
    NSArray *array = [self hi_constraintsWithSizeClass:sizeClass];
    if (array)[NSLayoutConstraint deactivateConstraints:array];
}

#pragma mark *********** make ***********
- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    NSAssert(self.superview, @"Super view is nil");
    HiViewConstraint *builder = [self hi_getBuilderWithSizeClass:sizeClass];
    
    if (block) {
        NSAssert(builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(builder);
        [builder updateFrame];
    }
    
    // 不是当前 size class 不激活
    if (sizeClass != self.hi_sizeClass) {
        NSArray *array = builder.allConstraints;
        if (array)[NSLayoutConstraint deactivateConstraints:array];
    }
}

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
    UIWindow *windon = [[UIApplication.sharedApplication delegate] window];
    
    if (UIUserInterfaceSizeClassRegular == windon.traitCollection.horizontalSizeClass) {
        if (UIUserInterfaceSizeClassRegular == windon.traitCollection.verticalSizeClass) {
            return HiSizeClass_rr;
        }
        if (UIUserInterfaceSizeClassCompact == windon.traitCollection.verticalSizeClass) {
            return HiSizeClass_rc;
        }
        
        return HiSizeClass_ra;
    }
    
    if (UIUserInterfaceSizeClassCompact == windon.traitCollection.horizontalSizeClass) {
        if (UIUserInterfaceSizeClassRegular == windon.traitCollection.verticalSizeClass) {
            return HiSizeClass_cr;
        }
        if (UIUserInterfaceSizeClassCompact == windon.traitCollection.verticalSizeClass) {
            return HiSizeClass_cc;
        }
        
        return HiSizeClass_ca;
    }
    
    if (UIUserInterfaceSizeClassRegular == windon.traitCollection.verticalSizeClass) {
        return HiSizeClass_ar;
    }
    if (UIUserInterfaceSizeClassCompact == windon.traitCollection.verticalSizeClass) {
        return HiSizeClass_ac;
    }
    return HiSizeClass_aa;
}
@end
