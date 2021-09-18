//
//  UIViewHiSizeClass.m
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import "UIViewHiSizeClass.h"
#import "NSObjectHiExtension.h"

@implementation UIView (HiSizeClass)

//+ (void)load {
//    [self hi_exchange_instanceMethod:@selector(hi_layoutSubviews) newSelector:@selector(layoutSubviews)];
//}
//
//- (void)hi_layoutSubviews {
//    [self hi_layoutSubviews];
////    [self hi_activateConstraints:self.hi_sizeClass];
//}


- (HiSizeClass)hi_sizeClass {
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

- (HiSizeClass)hi_getAvailableSizeClass:(HiSizeClass)sizeClass options:(HiSizeOptions)options{
    // 如果 aa 创建 了
    if (options & HiSizeOptions_aa) return HiSizeClass_aa;
    
    // 如果 ra 创建 了
    if (options & HiSizeOptions_ra) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return HiSizeClass_ra;
    }

    // 如果 ca 创建 了
    if (options & HiSizeOptions_ca) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return HiSizeClass_ra;
    }

    // 如果 ac 创建 了
    if (options & HiSizeOptions_ac) {
        if (HiSizeClass_rc == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_ra == sizeClass)
            return HiSizeClass_ra;
    }
    
    // 如果 ar 创建 了
    if (options & HiSizeOptions_ar) {
        if (HiSizeClass_ar == sizeClass || HiSizeClass_rr == sizeClass || HiSizeClass_cr == sizeClass)
            return HiSizeClass_ra;
    }
    
    // 没有 包含 any 返回当前
    return sizeClass;
}

- (HiSizeOptions)hi_size2options:(HiSizeClass)sizeClass {
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

@end
