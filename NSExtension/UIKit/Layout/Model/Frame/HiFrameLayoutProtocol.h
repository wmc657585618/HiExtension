//
//  HiFrameLayoutProtocol.h
//  HiExension
//
//  Created by four on 2021/9/10.
//

#import <UIKit/UIKit.h>

@protocol HiFrameLayoutValue <NSObject>

// 直接设置值
@property (nonatomic, readonly) void(^value)(CGFloat);

@end


@protocol HiFrameLayoutModel2 <HiFrameLayoutValue>

@property (nonatomic, readonly) id<HiFrameLayoutValue> (^multiplier)(CGFloat);

@end


@protocol HiFrameLayoutRelate <HiFrameLayoutValue>

@property (nonatomic,readonly) id<HiFrameLayoutModel2> left;                         //左侧
@property (nonatomic,readonly) id<HiFrameLayoutModel2> right;                        //右侧
@property (nonatomic,readonly) id<HiFrameLayoutModel2> top;                          //上方
@property (nonatomic,readonly) id<HiFrameLayoutModel2> bottom;                       //下方
@property (nonatomic,readonly) id<HiFrameLayoutModel2> width;                        //宽度
@property (nonatomic,readonly) id<HiFrameLayoutModel2> height;                       //高度
@property (nonatomic,readonly) id<HiFrameLayoutModel2> centerX;                      //X轴中心
@property (nonatomic,readonly) id<HiFrameLayoutModel2> centerY;                      //Y轴中心

@end

@protocol HiFrameLayoutModel <HiFrameLayoutValue>

@property (nonatomic, readonly) id<HiFrameLayoutRelate> (^equal)(UIView *);

@end

/**
 直接设置值    model1 -> value
 设置相同属性值 model1 -> relate -> value
 设置依赖值    model1 -> relate -> multiplier -> value

 */
