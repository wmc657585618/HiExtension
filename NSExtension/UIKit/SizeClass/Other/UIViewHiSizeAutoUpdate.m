//
//  UIViewHiSizeAutoUpdate.m
//  HiExension
//
//  Created by four on 2021/9/22.
//

#import "UIViewHiSizeAutoUpdate.h"
#import "NSObjectHiExtension.h"
#import "UIViewHiSizeClassConstraint.h"
#import "UIViewHiSizeClassProperty.h"

static BOOL kAutoUpdate = true;
@implementation UIView (HiSizeAutoUpdate)

+ (void)load {
    [self hi_exchange_instanceMethod:@selector(hi_layoutSubviews) newSelector:@selector(layoutSubviews)];
}

- (void)hi_layoutSubviews {
    [self hi_layoutSubviews];
    if(kAutoUpdate){
        [self hi_updateSizeProperty];
        [self hi_updateSizeContraints];
    }
}

+ (void)hi_setAutoUpdate:(BOOL)autoUpdate {
    kAutoUpdate = autoUpdate;
}

@end
