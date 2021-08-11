//
//  HiFrameProtocol.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import <Foundation/Foundation.h>
#import "HiFrameLayoutModel.h"
#import "HiConstraintModel.h"

@protocol HiViewFrameBuilder <NSObject>

@property (nonatomic,readonly) HiFrameLayoutModel *left;                         //左侧
@property (nonatomic,readonly) HiFrameLayoutModel *right;                        //右侧
@property (nonatomic,readonly) HiFrameLayoutModel *top;                          //上方
@property (nonatomic,readonly) HiFrameLayoutModel *bottom;                       //下方
@property (nonatomic,readonly) HiFrameLayoutModel *width;                        //宽度
@property (nonatomic,readonly) HiFrameLayoutModel *height;                       //高度
@property (nonatomic,readonly) HiFrameLayoutModel *centerX;                      //X轴中心
@property (nonatomic,readonly) HiFrameLayoutModel *centerY;                      //Y轴中心

@end

@protocol HiViewConstraintBuilder <NSObject>

@property (nonatomic,readonly) HiConstraintHorizontal1Model *left;
@property (nonatomic,readonly) HiConstraintHorizontal1Model *right;
@property (nonatomic,readonly) HiConstraintVertical1Model *top;
@property (nonatomic,readonly) HiConstraintVertical1Model *bottom;
@property (nonatomic,readonly) HiConstraintSize1Model *width;
@property (nonatomic,readonly) HiConstraintSize1Model *height;
@property (nonatomic,readonly) HiConstraintHorizontal1Model *centerX;
@property (nonatomic,readonly) HiConstraintVertical1Model *centerY;

@end
