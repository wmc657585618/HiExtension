//
//  HiFrameHander.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import "HiOptions.h"

NS_ASSUME_NONNULL_BEGIN

@class HiViewFrame;
@interface HiFrameHander : NSObject

+ (CGRect)frameForBuilder:(HiViewFrame *)builder withOptions:(HiViewOptions)options;

@end

NS_ASSUME_NONNULL_END
