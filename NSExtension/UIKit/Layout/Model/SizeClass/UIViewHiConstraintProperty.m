//
//  UIViewHiConstraintProperty.m
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import "UIViewHiConstraintProperty.h"

@implementation UIView (HiConstraintProperty)

- (HiViewConstraint *)hi_builder {
    return [self hi_getAvailableBuilderWithSizeClass:[self hi_getSizeClass]];
}

- (void)hi_constraints_WithBuilder:(HiViewConstraint *)builder sizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    HIAssert(self.superview, @"Super view is nil");
        
    if (block) {
        HIAssert(builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(builder);
        [builder updateFrame];
    }
    
    // 不是当前 size class 不激活
    if (![self hi_activateConstraintsWithSize:sizeClass]) {
        [builder deactivateConstraints];
    }
}

- (BOOL)hi_activateConstraintsWithSize:(HiSizeClass)sizeClass {
    if (HiSizeClass_aa == sizeClass) return true;
    
    if (HiSizeClass_ra == sizeClass) {
        HiSizeClass _size = [self hi_getSizeClass];
        return HiSizeClass_rr == _size || HiSizeClass_ra == _size || HiSizeClass_rc == _size;
    }
    
    if (HiSizeClass_ca == sizeClass) {
        HiSizeClass _size = [self hi_getSizeClass];
        return HiSizeClass_ca == _size || HiSizeClass_cc == _size || HiSizeClass_cr == _size;
    }
    
    if (HiSizeClass_ar == sizeClass) {
        HiSizeClass _size = [self hi_getSizeClass];
        return HiSizeClass_cr == _size || HiSizeClass_ar == _size || HiSizeClass_rr == _size;
    }
    
    if (HiSizeClass_ac == sizeClass) {
        HiSizeClass _size = [self hi_getSizeClass];
        return HiSizeClass_ac == _size || HiSizeClass_cc == _size || HiSizeClass_rc == _size;
    }
    
    return sizeClass == [self hi_getSizeClass];
}

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    
    HiViewConstraint *builder = [self hi_constraints_makeWithSizeClass:sizeClass];
    [self hi_constraints_WithBuilder:builder sizeClass:sizeClass block:block];
}

- (void)hi_constraints_updateWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    
    HiViewConstraint *builder = [self hi_getAvailableBuilderWithSizeClass:sizeClass];
    [builder removeAllConstraints];
    [self hi_constraints_WithBuilder:builder sizeClass:sizeClass block:block];
}

- (HiSizeClass)hi_getSizeClass {

    if (UIUserInterfaceSizeClassRegular == self.traitCollection.horizontalSizeClass) {
        if (UIUserInterfaceSizeClassRegular == self.traitCollection.verticalSizeClass) {
            return HiSizeClass_rr;
        }
        if (UIUserInterfaceSizeClassCompact == self.traitCollection.verticalSizeClass) {
            return HiSizeClass_rc;
        }
        
        return HiSizeClass_ra;
    }
    
    if (UIUserInterfaceSizeClassCompact == self.traitCollection.horizontalSizeClass) {
        if (UIUserInterfaceSizeClassRegular == self.traitCollection.verticalSizeClass) {
            return HiSizeClass_cr;
        }
        if (UIUserInterfaceSizeClassCompact == self.traitCollection.verticalSizeClass) {
            return HiSizeClass_cc;
        }
        
        return HiSizeClass_ca;
    }
    
    if (UIUserInterfaceSizeClassRegular == self.traitCollection.verticalSizeClass) {
        return HiSizeClass_ar;
    }
    if (UIUserInterfaceSizeClassCompact == self.traitCollection.verticalSizeClass) {
        return HiSizeClass_ac;
    }
    return HiSizeClass_aa;
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
