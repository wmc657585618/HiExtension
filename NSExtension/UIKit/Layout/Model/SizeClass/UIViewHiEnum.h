//
//  UIViewHiEnum.h
//  HiExension
//
//  Created by four on 2021/9/17.
//

#import <UIKit/UIKit.h>

/*
 ra 包含: rc, rr
 ca 包含: cc, cr
 aa 包含所有
 */
typedef enum : NSUInteger {
    HiSizeClass_aa,
    HiSizeClass_rr,
    HiSizeClass_rc,
    HiSizeClass_ra,
    HiSizeClass_cr,
    HiSizeClass_cc,
    HiSizeClass_ca,
    HiSizeClass_ar,
    HiSizeClass_ac,
} HiSizeClass;
