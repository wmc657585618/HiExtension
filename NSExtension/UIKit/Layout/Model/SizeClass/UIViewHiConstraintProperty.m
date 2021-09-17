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

- (HiSizeClass)hi_getSizeClass {
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

- (HiViewConstraint *)hi_builder {
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
            return self.hi_builder_rr;
            
        case HiSizeClass_rc:
            return self.hi_builder_rc;
            
        case HiSizeClass_ra:
            return self.hi_builder_ra;
            
        case HiSizeClass_cr:
            return self.hi_builder_cr;
            
        case HiSizeClass_cc:
            return self.hi_builder_cc;
            
        case HiSizeClass_ca:
            return self.hi_builder_ca;
            
        case HiSizeClass_ar:
            return self.hi_builder_ar;
            
        case HiSizeClass_ac:
            return self.hi_builder_ac;
            
        case HiSizeClass_aa:
            return self.hi_builder_aa;
    }
}

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block{
    
    BOOL res = (2 == self.hi_aa_instanced && HiSizeClass_aa == sizeClass) || (1 == self.hi_aa_instanced);
    
    NSAssert(!res, @"you have made contraints in (aa , **) class.");
    
    self.hi_aa_instanced = HiSizeClass_aa == sizeClass ? 1 : 2;
    
    NSAssert(self.superview, @"Super view is nil");
    HiViewConstraint *builder = [self hi_getBuilderWithSizeClass:sizeClass];
    
    if (block) {
        NSAssert(builder.avaliable, @"you have made contraints. please remove all constraints");
        self.translatesAutoresizingMaskIntoConstraints = false;
        block(builder);
        [builder updateFrame];
    }
    
    if (HiSizeClass_aa == sizeClass) return;
    
    // 不是当前 size class 不激活
    if (sizeClass != [self hi_getSizeClass]) {
        NSArray *array = builder.allConstraints;
        if (array)[NSLayoutConstraint deactivateConstraints:array];
    }
}

- (NSInteger)hi_aa_instanced {
    return [self hi_integerValuePropertyForKey:_cmd];
}

- (void)setHi_aa_instanced:(NSInteger)hi_aa_instanced {
    [self hi_addIntegerValuePropertyForKey:@selector(hi_aa_instanced) value:hi_aa_instanced];
}

@end
