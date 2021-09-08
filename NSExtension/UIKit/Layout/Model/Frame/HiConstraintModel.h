//
//  HiConstraintModel.h
//  HiUIKit
//
//  Created by four on 2021/2/19.
//

#import <UIKit/UIKit.h>
#import "HiFramDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface HiConstraintModel : NSObject

- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

@property (nonatomic,readonly) NSLayoutConstraint *layout;

@property (nonatomic,readonly) HiFloatBlock(HiConstraintModel, multiplier);

@property (nonatomic,readonly) HiFloatBlock(__kindof HiConstraintModel, value);
@property (nonatomic, readonly, copy) HiFloatBlock(__kindof HiConstraintModel, max);
@property (nonatomic, readonly, copy) HiFloatBlock(__kindof HiConstraintModel, min);
@property (nonatomic, copy) void(^autoValue)(void);

- (void)remove;
- (NSLayoutConstraint *)getConstraint;

@end

@interface HiConstraintHorizontal0Model : HiConstraintModel

@property (nonatomic,readonly) HiConstraintModel *left;                         //左侧
@property (nonatomic,readonly) HiConstraintModel *right;                        //右侧
@property (nonatomic,readonly) HiConstraintModel *centerX;                      //X轴中心

@end

@interface HiConstraintHorizontal1Model : HiConstraintModel

@property (nonatomic, readonly, copy) HiFrameBlock(HiConstraintHorizontal0Model, less);
@property (nonatomic, readonly, copy) HiFrameBlock(HiConstraintHorizontal0Model, equal);
@property (nonatomic, readonly, copy) HiFrameBlock(HiConstraintHorizontal0Model, greater);

@end

@interface HiConstraintVertical0Model : HiConstraintModel

@property (nonatomic,readonly) HiConstraintModel *top;                          //上方
@property (nonatomic,readonly) HiConstraintModel *bottom;                       //下方
@property (nonatomic,readonly) HiConstraintModel *centerY;                      //Y轴中心

@end

@interface HiConstraintVertical1Model : HiConstraintModel

@property (nonatomic, readonly) HiFrameBlock(HiConstraintVertical0Model, less);
@property (nonatomic, readonly) HiFrameBlock(HiConstraintVertical0Model, equal);
@property (nonatomic, readonly) HiFrameBlock(HiConstraintVertical0Model, greater);

@end

@interface HiConstraintSize0Model : HiConstraintModel

@property (nonatomic,readonly) HiConstraintModel *width;                        //宽度
@property (nonatomic,readonly) HiConstraintModel *height;                       //高度

@end

@interface HiConstraintSize1Model : HiConstraintModel

@property (nonatomic, readonly) HiFrameBlock(HiConstraintSize0Model, less);
@property (nonatomic, readonly) HiFrameBlock(HiConstraintSize0Model, equal);
@property (nonatomic, readonly) HiFrameBlock(HiConstraintSize0Model, greater);

@end

NS_ASSUME_NONNULL_END
