//
//  UIViewHiSizeClassProperty.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClassProperty.h"
#import "UIViewHiSizeClassFile.h"

#define hi_case(_v_)         case HiSizeClass_##_v_:\
{if (self.hi_property_##_v_) self.hi_property_##_v_();} break;

@implementation UIView (HiSizeClassProperty)

- (void)hi_property_rr_make:(void(^)(void))block {
    self.hi_property_rr = block;
}

- (void)hi_property_rc_make:(void(^)(void))block {
    self.hi_property_rc = block;
}

- (void)hi_property_ra_make:(void(^)(void))block {
    self.hi_property_ra = block;
}

- (void)hi_property_cr_make:(void(^)(void))block {
    self.hi_property_cr = block;
}

- (void)hi_property_cc_make:(void(^)(void))block {
    self.hi_property_cc = block;
}

- (void)hi_property_ca_make:(void(^)(void))block {
    self.hi_property_ca = block;
}

- (void)hi_property_ar_make:(void(^)(void))block {
    self.hi_property_ar = block;
}

- (void)hi_property_ac_make:(void(^)(void))block {
    self.hi_property_ac = block;
}

- (void)hi_property_aa_make:(void(^)(void))block {
    self.hi_property_aa = block;
}

- (void)hi_updateSizeProperty {
    
    if (HiSizeOptions_none == self.hi_propertyOptions) return;
    
    HiSizeClass _size = [self hi_getAvailableSizeClass:self.hi_sizeClass options:self.hi_propertyOptions];
    
    switch (_size) {
        hi_case(aa)
        hi_case(rr)
        hi_case(rc)
        hi_case(ra)
        hi_case(cr)
        hi_case(cc)
        hi_case(ca)
        hi_case(ar)
        hi_case(ac)
    }
}

@end
