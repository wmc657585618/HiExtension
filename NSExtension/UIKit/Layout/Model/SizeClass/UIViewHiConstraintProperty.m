//
//  UIViewHiConstraintProperty.m
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import "UIViewHiConstraintProperty.h"
#import "NSObjectHiExtension.h"

@implementation UIView (HiConstraintProperty)

- (HiViewConstraint *)hi_builderWithSEL:(SEL)sel {
    
    HiViewConstraint *_builer = [self hi_getValueForKey:sel];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:sel value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder {
    
    // 如果 aa 创建 了, 不能 创建其它的
    if (self.hi_sizeOptions & HiSizeOptions_aa) {
        return [self hi_getBuilderWithSizeClass:HiSizeClass_aa];
    }
    
    // 如果 ra 创建 了, 不能 创建 r*
    if (self.hi_sizeOptions & HiSizeOptions_ra) {
        return [self hi_getBuilderWithSizeClass:HiSizeClass_ra];
    }

    // 如果 ca 创建 了, 不能 创建 c*
    if (self.hi_sizeOptions & HiSizeOptions_ca) {
        return [self hi_getBuilderWithSizeClass:HiSizeClass_ca];
    }

    // 如果 ac 创建 了, 不能 创建 *c
    if (self.hi_sizeOptions & HiSizeOptions_ac) {
        return [self hi_getBuilderWithSizeClass:HiSizeClass_ac];
    }
    
    // 如果 ar 创建 了, 不能 创建 *r
    if (self.hi_sizeOptions & HiSizeOptions_ar) {
        return [self hi_getBuilderWithSizeClass:HiSizeClass_ar];
    }
    
    return [self hi_getBuilderWithSizeClass:[self hi_getSizeClass]];
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

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    
#ifdef DEBUG
    [self hi_checkOptionsWithSizeClass:sizeClass];
#endif
    
    self.hi_sizeOptions = self.hi_sizeOptions | [self hi_optionsWithSizeClass:sizeClass];
    HIAssert(self.superview, @"Super view is nil");
    HiViewConstraint *builder = [self hi_getBuilderWithSizeClass:sizeClass];
    
    if (block) {
        HIAssert(builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(builder);
        [builder updateFrame];
    }
    
    if (HiSizeClass_aa == sizeClass) return;
    
    // 不是当前 size class 不激活
    if (sizeClass != [self hi_getSizeClass]) {
        [builder deactivateConstraints];
    }
}

- (NSInteger)hi_sizeOptions {
    return [self hi_integerValuePropertyForKey:_cmd];
}

- (void)setHi_sizeOptions:(NSInteger)hi_sizeOptions {
    [self hi_addIntegerValuePropertyForKey:@selector(hi_sizeOptions) value:hi_sizeOptions];
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
