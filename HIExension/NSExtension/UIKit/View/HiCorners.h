//
//  UIRadius.h
//  FourUILab
//
//  Created by four on 2021/4/7.
//

#import <UIKit/UIKit.h>

struct HICorners {
    CGFloat radius1; // right-bottom
    CGFloat radius2; // left-bottom
    CGFloat radius3; // left-top
    CGFloat radius4; // right-top
};

typedef struct HICorners HICorners;

static inline BOOL HICornersEqualCorners(HICorners c1, HICorners c2) {
    return c1.radius1 == c2.radius1 && c1.radius2 == c2.radius2 && c1.radius3 == c2.radius3 && c1.radius4 == c2.radius4;
}
static HICorners const HICornersZero = {0, 0, 0, 0};

static inline HICorners HICornersMake(CGFloat radius1, CGFloat radius2, CGFloat radius3, CGFloat radius4) {
    HICorners r = {radius1, radius2, radius3, radius4};
    return r;
}

NS_ASSUME_NONNULL_BEGIN

@interface HiCornersShapeLayer : CAShapeLayer

@property (nonatomic, assign) HICorners corners;

@end

NS_ASSUME_NONNULL_END
