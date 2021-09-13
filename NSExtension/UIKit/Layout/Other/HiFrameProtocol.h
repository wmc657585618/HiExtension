//
//  HiFrameProtocol.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiFrameLayoutProtocol.h"
#import "HiConstraintLayoutProtocol.h"

@protocol HiViewFrameBuilder <NSObject>

@property (nonatomic,readonly) id<HiFrameLayoutModel> left;                         //左侧
@property (nonatomic,readonly) id<HiFrameLayoutModel> right;                        //右侧
@property (nonatomic,readonly) id<HiFrameLayoutModel> top;                          //上方
@property (nonatomic,readonly) id<HiFrameLayoutModel> bottom;                       //下方
@property (nonatomic,readonly) id<HiFrameLayoutModel> width;                        //宽度
@property (nonatomic,readonly) id<HiFrameLayoutModel> height;                       //高度
@property (nonatomic,readonly) id<HiFrameLayoutModel> centerX;                      //X轴中心
@property (nonatomic,readonly) id<HiFrameLayoutModel> centerY;                      //Y轴中心

@end

@protocol HiViewConstraintBuilder <NSObject>

@property (nonatomic,readonly) id<HiConstraintHorizontal0> left;
@property (nonatomic,readonly) id<HiConstraintHorizontal0> right;
@property (nonatomic,readonly) id<HiConstraintVertical0> top;
@property (nonatomic,readonly) id<HiConstraintVertical0> bottom;
@property (nonatomic,readonly) id<HiConstraintSize0> width;
@property (nonatomic,readonly) id<HiConstraintSize0> height;
@property (nonatomic,readonly) id<HiConstraintHorizontal0> centerX;
@property (nonatomic,readonly) id<HiConstraintVertical0> centerY;

@end
