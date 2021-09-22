//
//  UIViewHiSizeClassProperty.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClassProperty.h"
#import "UIViewHiSizeClassFile.h"

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
            
        case HiSizeClass_aa:
        {
            if (self.hi_property_aa) {
                self.hi_property_aa();
            }
        }
            break;
        case HiSizeClass_rr:
        {
            if (self.hi_property_rr) {
                self.hi_property_rr();
            }
        }
            break;
        case HiSizeClass_rc:
        {
            if (self.hi_property_rc) {
                self.hi_property_rc();
            }
        }
            break;
        case HiSizeClass_ra:
        {
            if (self.hi_property_ra) {
                self.hi_property_ra();
            }
        }
            break;
        case HiSizeClass_cr:
        {
            if (self.hi_property_cr) {
                self.hi_property_cr();
            }
        }
            break;
        case HiSizeClass_cc:
        {
            if (self.hi_property_cc) {
                self.hi_property_cc();
            }
        }
            break;
        case HiSizeClass_ca:
        {
            if (self.hi_property_ca) {
                self.hi_property_ca();
            }
        }
            break;
        case HiSizeClass_ar:
        {
            if (self.hi_property_ar) {
                self.hi_property_ar();
            }
        }
            break;
        case HiSizeClass_ac:
        {
            if (self.hi_property_ac) {
                self.hi_property_ac();
            }
        }
            break;
    }
}

@end
