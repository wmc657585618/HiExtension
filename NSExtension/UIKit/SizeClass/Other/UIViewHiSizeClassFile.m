//
//  UIViewHiSizeClassFile.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClassFile.h"
#import "NSObjectHiExtension.h"

#define hi_add(_op) - (void)setHi_property_##_op:(void (^)(void))hi_property_##_op {\
[self hi_addPropertyValue:hi_property_##_op forKey:@selector(hi_property_##_op) sizeOption:HiSizeOptions_##_op];\
}\
- (void (^)(void))hi_property_##_op {\
return [self hi_getValueForKey:_cmd];\
}

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

- (void)hi_addPropertyValue:(id _Nullable)value forKey:(const void *)key sizeOption:(HiSizeOptions)option {
    BOOL res = self.hi_propertyOptions & option;

    if (value) {
        // 有值 添加
        if (!res) self.hi_propertyOptions = self.hi_propertyOptions | option;
    } else {
        if (res) self.hi_propertyOptions = self.hi_propertyOptions & (~option); // 清空 移除
    }
    [self hi_addCopyNonatomicPropertyForKey:key value:value];
}

#pragma mark *********** property ***********
- (NSInteger)hi_propertyOptions {
    return [self hi_integerValuePropertyForKey:_cmd];
}

- (void)setHi_propertyOptions:(NSInteger)hi_propertyOptions {
    [self hi_addIntegerValuePropertyForKey:@selector(hi_propertyOptions) value:hi_propertyOptions];
}

hi_add(aa)
hi_add(ar)
hi_add(ac)

hi_add(ca)
hi_add(cr)
hi_add(cc)

hi_add(rr)
hi_add(ra)
hi_add(rc)

@end
