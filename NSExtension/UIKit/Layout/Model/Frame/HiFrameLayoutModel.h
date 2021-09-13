//
//  HiFrameLayoutModel.h
//  HiUIKit
//
//  Created by four on 2021/2/18.
//

#import <UIKit/UIKit.h>
#import "HiFramDefine.h"
#import "HiFrameLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class HiViewFrame;
@interface HiFrameLayoutModel : NSObject<HiFrameLayoutModel, HiFrameLayoutRelate, HiFrameLayoutModel2, HiFrameLayoutValue>

/// @param view == layout 中的 item1
- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute builder:(HiViewFrame *)builder;

@property (nonatomic,readonly) CGFloat frame;

@end

NS_ASSUME_NONNULL_END
