//
//  UIViewHiConstraintProperty.m
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import "UIViewHiConstraintProperty.h"
#import "NSObjectHiExtension.h"

@implementation UIView (HiConstraintProperty)

- (HiViewConstraint *)hi_builder {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_cr {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_cc {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_ca {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_rr {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_rc {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_ra {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_ar {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_ac {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}

- (HiViewConstraint *)hi_builder_aa {
    HiViewConstraint *_builer = [self hi_getValueForKey:_cmd];
    if (!_builer) {
        _builer = [[HiViewConstraint alloc] initWithView:self];
        [self hi_addRetainNonatomicPropertyForKey:_cmd value:_builer];
    }
    return _builer;
}
@end
