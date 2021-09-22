//
//  UIViewHiSizeAutoUpdate.h
//  HiExension
//
//  Created by four on 2021/9/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiSizeAutoUpdate)

/// default is true.
+ (void)hi_setAutoUpdate:(BOOL)autoUpdate;

@end

NS_ASSUME_NONNULL_END
