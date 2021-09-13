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

@property (nonatomic,readonly) CGFloat leftValue;                         //左侧
@property (nonatomic,readonly) CGFloat rightValue;                        //右侧
@property (nonatomic,readonly) CGFloat topValue;                          //上方
@property (nonatomic,readonly) CGFloat bottomValue;                       //下方
@property (nonatomic,readonly) CGFloat widthValue;                        //宽度
@property (nonatomic,readonly) CGFloat heightValue;                       //高度
@property (nonatomic,readonly) CGFloat centerXValue;                      //X轴中心
@property (nonatomic,readonly) CGFloat centerYValue;                      //Y轴中心

- (void)updateFrame;

@end

NS_ASSUME_NONNULL_END
