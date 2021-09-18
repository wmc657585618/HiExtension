//
//  HiViewConstraintBuilder.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "HiViewConstraintBuilder.h"
#import "NSObjectHiExtension.h"

@implementation UIView (HiViewConstraintBuilder)

- (NSInteger)hi_sizeOptions {
    return [self hi_integerValuePropertyForKey:_cmd];
}

- (void)setHi_sizeOptions:(NSInteger)hi_sizeOptions {
    [self hi_addIntegerValuePropertyForKey:@selector(hi_sizeOptions) value:hi_sizeOptions];
}

- (HiViewConstraint *)hi_builderWithSEL:(SEL)sel {
    
    HiViewConstraint *_builer = [self hi_getValueForKey:sel];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:sel value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_cr {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_cc {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_ca {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_rr {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_rc {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_ra {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_ar {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_ac {
    return [self hi_builderWithSEL:_cmd];
}

- (HiViewConstraint *)hi_builder_aa {
    return [self hi_builderWithSEL:_cmd];
}

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


- (HiSizeOptions)hi_optionsWithSizeClass:(HiSizeClass)sizeClass {
    switch (sizeClass) {
        case HiSizeClass_aa:
            return HiSizeOptions_aa;
            
        case HiSizeClass_rr:
            return HiSizeOptions_rr;

        case HiSizeClass_rc:
            return HiSizeOptions_rc;

        case HiSizeClass_ra:
            return HiSizeOptions_ra;

        case HiSizeClass_cr:
            return HiSizeOptions_cr;

        case HiSizeClass_cc:
            return HiSizeOptions_cc;

        case HiSizeClass_ca:
            return HiSizeOptions_ca;

        case HiSizeClass_ar:
            return HiSizeOptions_ar;

        case HiSizeClass_ac:
            return HiSizeOptions_ac;
    }
}

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
    
    self.hi_sizeOptions = self.hi_sizeOptions | [self hi_optionsWithSizeClass:sizeClass];
    return [self hi_makeBuilderWithSizeClass:sizeClass];
}

- (HiViewConstraint *)hi_getAvailableBuilderWithSizeClass:(HiSizeClass)sizeClass {
    // 如果 aa 创建 了, 不能 创建其它的
    if (self.hi_sizeOptions & HiSizeOptions_aa) return self.hi_builder_aa;
    
    // 如果 ra 创建 了, 不能 创建 r*
    if (self.hi_sizeOptions & HiSizeOptions_ra) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return self.hi_builder_ra;
    }

    // 如果 ca 创建 了, 不能 创建 c*
    if (self.hi_sizeOptions & HiSizeOptions_ca) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return self.hi_builder_ra;
    }

    // 如果 ac 创建 了, 不能 创建 *c
    if (self.hi_sizeOptions & HiSizeOptions_ac) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return self.hi_builder_ra;
    }
    
    // 如果 ar 创建 了, 不能 创建 *r
    if (self.hi_sizeOptions & HiSizeOptions_ar) {
        if (HiSizeClass_ar == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_cr == sizeClass)
            return self.hi_builder_ra;
    }
    
    return [self hi_getBuilderWithSizeClass:sizeClass];
}

@end
