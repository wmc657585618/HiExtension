//
//  HiViewFrame.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import <UIKit/UIKit.h>
#import "HiFrameProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HiViewFrame : NSObject<HiViewFrameBuilder>
- (instancetype)initWithView:(UIView *)view;
- (void)updateFrame;

@end

NS_ASSUME_NONNULL_END
