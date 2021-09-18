//
//  UIViewHiSizeClass.h
//  HiExension
//
//  Created by four on 2021/9/18.
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

typedef NS_OPTIONS(NSUInteger, HiSizeOptions) {
    HiSizeOptions_none = 0,
    HiSizeOptions_aa = 1 << 0,
    HiSizeOptions_ra = 1 << 1,
    HiSizeOptions_rr = 1 << 2,
    HiSizeOptions_rc = 1 << 3,
    HiSizeOptions_ca = 1 << 4,
    HiSizeOptions_cr = 1 << 5,
    HiSizeOptions_cc = 1 << 6,
    HiSizeOptions_ar = 1 << 7,
    HiSizeOptions_ac = 1 << 8,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiSizeClass)

/// 当前 size class
@property (nonatomic, readonly) HiSizeClass hi_sizeClass;

/// 对比 options, 返回 有效的 size class.
- (HiSizeClass)hi_getAvailableSizeClass:(HiSizeClass)sizeClass options:(HiSizeOptions)options;

- (HiSizeOptions)hi_size2options:(HiSizeClass)sizeClass;

@end

NS_ASSUME_NONNULL_END
