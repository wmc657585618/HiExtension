//
//  HiViewConstraintBuilder.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "HiViewConstraintBuilder.h"
#import "UIViewHiSizeClassFile.h"

@implementation UIView (HiViewConstraintBuilder)

- (HiViewConstraint *)hi_getBuilderWithSizeClass:(HiSizeClass)sizeClass {
    
    switch (sizeClass) {
            
        case HiSizeClass_rr:
        {
            if (self.hi_sizeOptions & HiSizeOptions_rr)
                return self.hi_builder_rr;
        }
            
        case HiSizeClass_rc:
        {
            if (self.hi_sizeOptions & HiSizeOptions_rr)
                return self.hi_builder_rc;
        }
        case HiSizeClass_ra:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ra)
                return self.hi_builder_ra;
        }
            
        case HiSizeClass_cr:
        {
            if (self.hi_sizeOptions & HiSizeOptions_cr)
                return self.hi_builder_cr;
        }
        case HiSizeClass_cc:
        {
            if (self.hi_sizeOptions & HiSizeOptions_cc)
                return self.hi_builder_cc;
        }
        case HiSizeClass_ca:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ca)
                return self.hi_builder_ca;
        }
        case HiSizeClass_ar:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ar)
                return self.hi_builder_ar;
        }
        case HiSizeClass_ac:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ac)
                return self.hi_builder_ac;
        }
        case HiSizeClass_aa:
        {
            if (self.hi_sizeOptions & HiSizeOptions_aa)
                return self.hi_builder_aa;
        }
    }
    
    return nil;
}


#ifdef DEBUG
- (void)hi_checkOptionsWithSizeClass:(HiSizeClass)sizeClass {
    // 如果 aa 创建 了, 不能 创建其它的
    if (self.hi_sizeOptions & HiSizeOptions_aa) {
        HIAssert(false, @"you have made contraints in (aa , **) class.");
    }
    
    if (HiSizeOptions_aa == sizeClass && HiSizeOptions_none != self.hi_sizeOptions) {
        HIAssert(false, @"you have made contraints in (aa , **) class.");
    }
    
    // 如果 ra 创建 了, 不能 创建 r*
    if (self.hi_sizeOptions & HiSizeOptions_ra || HiSizeClass_ra == sizeClass) {
        if (self.hi_sizeOptions & HiSizeOptions_ra || self.hi_sizeOptions & HiSizeOptions_rc || self.hi_sizeOptions & HiSizeOptions_rr) {
            HIAssert(false, @"you have made contraints in (ra , r*) class.");
        }
    }

    // 如果 ca 创建 了, 不能 创建 c*
    if (self.hi_sizeOptions & HiSizeOptions_ca || HiSizeClass_ra == sizeClass) {
        if (self.hi_sizeOptions & HiSizeOptions_ca || self.hi_sizeOptions & HiSizeOptions_cc || self.hi_sizeOptions & HiSizeOptions_cr) {
            HIAssert(false, @"you have made contraints in (ca , c*) class.");
        }
    }

    // 如果 ac 创建 了, 不能 创建 *c
    if (self.hi_sizeOptions & HiSizeOptions_ac || HiSizeClass_ac == sizeClass) {
        if (self.hi_sizeOptions & HiSizeOptions_ac || self.hi_sizeOptions & HiSizeOptions_cc || self.hi_sizeOptions & HiSizeOptions_rc) {
            HIAssert(false, @"you have made contraints in (ac , *c) class.");
        }
    }
    
    // 如果 ar 创建 了, 不能 创建 *r
    if (self.hi_sizeOptions & HiSizeOptions_ar || HiSizeClass_ar == sizeClass) {
        if (self.hi_sizeOptions & HiSizeOptions_ar || self.hi_sizeOptions & HiSizeOptions_rr || self.hi_sizeOptions & HiSizeOptions_cr) {
            HIAssert(false, @"you have made contraints in (ar , *r) class.");
        }
    }
}
#endif

- (HiViewConstraint *)hi_makeBuilderWithSizeClass:(HiSizeClass)sizeClass {

    switch (sizeClass) {
            
        case HiSizeClass_rr:
        {
            if (self.hi_sizeOptions & HiSizeOptions_rr)
                return self.hi_builder_rr;
        }
            
        case HiSizeClass_rc:
        {
            if (self.hi_sizeOptions & HiSizeOptions_rr)
                return self.hi_builder_rc;
        }
        case HiSizeClass_ra:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ra)
                return self.hi_builder_ra;
        }
            
        case HiSizeClass_cr:
        {
            if (self.hi_sizeOptions & HiSizeOptions_cr)
                return self.hi_builder_cr;
        }
        case HiSizeClass_cc:
        {
            if (self.hi_sizeOptions & HiSizeOptions_cc)
                return self.hi_builder_cc;
        }
        case HiSizeClass_ca:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ca)
                return self.hi_builder_ca;
        }
        case HiSizeClass_ar:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ar)
                return self.hi_builder_ar;
        }
        case HiSizeClass_ac:
        {
            if (self.hi_sizeOptions & HiSizeOptions_ac)
                return self.hi_builder_ac;
        }
        case HiSizeClass_aa:
        {
            if (self.hi_sizeOptions & HiSizeOptions_aa)
                return self.hi_builder_aa;
        }
    }
    
    return nil;
}

- (HiViewConstraint *)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass {
#ifdef DEBUG
    [self hi_checkOptionsWithSizeClass:sizeClass];
#endif
    
    if (self.hi_sizeOptions & [self hi_size2options:sizeClass]) {
        HIAssert(false, @"不能重复创建, 更新 使用 update");
    }
    
    self.hi_sizeOptions = self.hi_sizeOptions | [self hi_size2options:sizeClass];
    return [self hi_makeBuilderWithSizeClass:sizeClass];
}

- (HiViewConstraint *)hi_getAvailableBuilderWithSizeClass:(HiSizeClass)sizeClass {
    return [self hi_getBuilderWithSizeClass:[self hi_getAvailableSizeClass:sizeClass options:self.hi_sizeOptions]];
}

@end
