//
//  UIViewHiSizeClassFile.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClassFile.h"
#import "NSObjectHiExtension.h"

@implementation UIView (HiConstraintProperty)

- (HiViewConstraint *)hi_builder {
    return [self hi_getAvailableBuilderWithSizeClass:self.hi_sizeClass];
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
        HiSizeClass _size = self.hi_sizeClass;
        return HiSizeClass_rr == _size || HiSizeClass_ra == _size || HiSizeClass_rc == _size;
    }
    
    if (HiSizeClass_ca == sizeClass) {
        HiSizeClass _size = self.hi_sizeClass;
        return HiSizeClass_ca == _size || HiSizeClass_cc == _size || HiSizeClass_cr == _size;
    }
    
    if (HiSizeClass_ar == sizeClass) {
        HiSizeClass _size = self.hi_sizeClass;
        return HiSizeClass_cr == _size || HiSizeClass_ar == _size || HiSizeClass_rr == _size;
    }
    
    if (HiSizeClass_ac == sizeClass) {
        HiSizeClass _size = self.hi_sizeClass;
        return HiSizeClass_ac == _size || HiSizeClass_cc == _size || HiSizeClass_rc == _size;
    }
    
    return sizeClass == self.hi_sizeClass;
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

@end

@implementation UIView (HiSizeClassFile)

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

#pragma mark *********** property ***********
- (NSInteger)hi_propertyOptions {
    return [self hi_integerValuePropertyForKey:_cmd];
}

- (void)setHi_propertyOptions:(NSInteger)hi_propertyOptions {
    [self hi_addIntegerValuePropertyForKey:@selector(hi_propertyOptions) value:hi_propertyOptions];
}

- (void)setHi_property_aa:(void (^)(void))hi_property_aa {
    HiSizeOptions option = HiSizeOptions_aa;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_aa) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_aa) value:hi_property_aa];
}

- (void (^)(void))hi_property_aa {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_ar:(void (^)(void))hi_property_ar {
    HiSizeOptions option = HiSizeOptions_ar;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_ar) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_ar) value:hi_property_ar];
}

- (void (^)(void))hi_property_ar {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_ac:(void (^)(void))hi_property_ac {
    HiSizeOptions option = HiSizeOptions_ac;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_ac) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_ac) value:hi_property_ac];
}

- (void (^)(void))hi_property_ac {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_cc:(void (^)(void))hi_property_cc {
    HiSizeOptions option = HiSizeOptions_cc;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_cc) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_cc) value:hi_property_cc];
}

- (void (^)(void))hi_property_cc {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_ca:(void (^)(void))hi_property_ca {
    HiSizeOptions option = HiSizeOptions_ca;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_ca) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_ca) value:hi_property_ca];
}

- (void (^)(void))hi_property_ca {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_cr:(void (^)(void))hi_property_cr {
    HiSizeOptions option = HiSizeOptions_cr;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_cr) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_cr) value:hi_property_cr];
}

- (void (^)(void))hi_property_cr {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_rr:(void (^)(void))hi_property_rr {
    HiSizeOptions option = HiSizeOptions_rr;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_rr) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_rr) value:hi_property_rr];
}

- (void (^)(void))hi_property_rr {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_ra:(void (^)(void))hi_property_ra {
    HiSizeOptions option = HiSizeOptions_ra;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_ra) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_ra) value:hi_property_ra];
}

- (void (^)(void))hi_property_ra {
    return [self hi_getValueForKey:_cmd];
}

- (void)setHi_property_rc:(void (^)(void))hi_property_rc {
    HiSizeOptions option = HiSizeOptions_rc;
    BOOL res = self.hi_propertyOptions & option;

    if (hi_property_rc) {
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option);
    }
    [self hi_addCopyNonatomicPropertyForKey:@selector(hi_property_rc) value:hi_property_rc];
}

- (void (^)(void))hi_property_rc {
    return [self hi_getValueForKey:_cmd];
}

@end
