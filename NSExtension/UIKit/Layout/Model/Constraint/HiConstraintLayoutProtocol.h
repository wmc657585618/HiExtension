//
//  HiConstraintLayoutProtocol.h
//  HiExension
//
//  Created by four on 2021/9/13.
//

#import <UIKit/UIKit.h>

@protocol HiConstraint <NSObject>

// 直接设置值
@property (nonatomic, readonly) void(^value)(CGFloat);

@end


@protocol HiConstraintMultiplier <HiConstraint>

@property (nonatomic, readonly) id<HiConstraint> (^multiplier)(CGFloat);

@end

@protocol HiConstraintLimit <NSObject>

@property (nonatomic, readonly) void (^max)(CGFloat);
@property (nonatomic, readonly) void (^min)(CGFloat);

@end


@protocol HiConstraintVertical1 <HiConstraint>

@property (nonatomic, readonly) id<HiConstraintMultiplier> top;
@property (nonatomic, readonly) id<HiConstraintMultiplier> bottom;
@property (nonatomic, readonly) id<HiConstraintMultiplier> centerY;

@end

@protocol HiConstraintVertical0 <HiConstraint, HiConstraintLimit>

@property (nonatomic, readonly) id<HiConstraintVertical1>(^less)(UIView *); // <=
@property (nonatomic, readonly) id<HiConstraintVertical1>(^equal)(UIView *); // ==
@property (nonatomic, readonly) id<HiConstraintVertical1>(^greater)(UIView *); // >==

@end


@protocol HiConstraintSize1 <HiConstraint>

@property (nonatomic, readonly) id<HiConstraintMultiplier> width;
@property (nonatomic, readonly) id<HiConstraintMultiplier> height;

@end

@protocol HiConstraintSize0 <HiConstraint, HiConstraintLimit>

@property (nonatomic, readonly) id<HiConstraintSize1>(^less)(UIView *); // <=
@property (nonatomic, readonly) id<HiConstraintSize1>(^equal)(UIView *); // ==
@property (nonatomic, readonly) id<HiConstraintSize1>(^greater)(UIView *); // >==

/**
 如果是 UILabel 的 height 要设置 preferredMaxLayoutWidth
 */
@property (nonatomic, readonly) void(^warpcontent)(void);

@end


@protocol HiConstraintHorizontal1 <HiConstraint>

@property (nonatomic, readonly) id<HiConstraintMultiplier> left;
@property (nonatomic, readonly) id<HiConstraintMultiplier> right;
@property (nonatomic, readonly) id<HiConstraintMultiplier> centerX;

@end

@protocol HiConstraintHorizontal0 <HiConstraint, HiConstraintLimit>

@property (nonatomic, readonly) id<HiConstraintHorizontal1>(^less)(UIView *); // <=
@property (nonatomic, readonly) id<HiConstraintHorizontal1>(^equal)(UIView *); // ==
@property (nonatomic, readonly) id<HiConstraintHorizontal1>(^greater)(UIView *); // >==

@end

/**
 直接设置值    model1 -> value
 设置相同属性值 model1 -> relate -> value
 设置依赖值    model1 -> relate -> multiplier -> value
 
 */

