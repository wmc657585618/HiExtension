//
//  HiFrameLayoutModel.h
//  HiUIKit
//
//  Created by four on 2021/2/18.
//

#import <UIKit/UIKit.h>
#import "HiFramDefine.h"

NS_ASSUME_NONNULL_BEGIN

@class HiViewFrame;
@interface HiFrameLayoutModel : NSObject

/// @param view == layout 中的 item1
- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute builder:(HiViewFrame *)builder;

@property (nonatomic,readonly) HiFloatBlock(HiFrameLayoutModel, value);
@property (nonatomic,readonly) HiFloatBlock(HiFrameLayoutModel, multiplier);

@property (nonatomic,readonly) HiFrameLayoutModel *left;                         //左侧
@property (nonatomic,readonly) HiFrameLayoutModel *right;                        //右侧
@property (nonatomic,readonly) HiFrameLayoutModel *top;                          //上方
@property (nonatomic,readonly) HiFrameLayoutModel *bottom;                       //下方
@property (nonatomic,readonly) HiFrameLayoutModel *width;                        //宽度
@property (nonatomic,readonly) HiFrameLayoutModel *height;                       //高度
@property (nonatomic,readonly) HiFrameLayoutModel *centerX;                      //X轴中心
@property (nonatomic,readonly) HiFrameLayoutModel *centerY;                      //Y轴中心

@property (nonatomic,readonly) HiFrameLayoutModel *relate;                       //依赖自身属性
@property (nonatomic,readonly) HiFrameBlock(HiFrameLayoutModel, equal);

@property (nonatomic,readonly) CGFloat frame;

@end

NS_ASSUME_NONNULL_END
