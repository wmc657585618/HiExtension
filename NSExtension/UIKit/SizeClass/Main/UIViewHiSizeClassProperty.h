//
//  UIViewHiSizeClassProperty.h
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiSizeClassProperty)

- (void)hi_property_rr_make:(void(^)(void))block;
- (void)hi_property_rc_make:(void(^)(void))block;
- (void)hi_property_ra_make:(void(^)(void))block;

- (void)hi_property_cr_make:(void(^)(void))block;
- (void)hi_property_cc_make:(void(^)(void))block;
- (void)hi_property_ca_make:(void(^)(void))block;

- (void)hi_property_ar_make:(void(^)(void))block;
- (void)hi_property_ac_make:(void(^)(void))block;
- (void)hi_property_aa_make:(void(^)(void))block;

- (void)hi_updateSizeProperty;

@end

NS_ASSUME_NONNULL_END
