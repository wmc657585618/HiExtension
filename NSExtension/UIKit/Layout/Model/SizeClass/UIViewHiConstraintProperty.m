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
    return self.hi_builder_aa;
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
            
        case HiSizeClass_none:
        case HiSizeClass_aa:
            return self.hi_builder_aa;
    }
}
@end
