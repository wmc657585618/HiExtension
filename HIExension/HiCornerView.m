//
//  HiCornerView.m
//  HIExension
//
//  Created by four on 2021/6/28.
//

#import "HiCornerView.h"

@implementation HiCornerView
+ (Class)layerClass {
    return [HiCornersShapeLayer class];
}

- (HiCornersShapeLayer *)shaper {
    if ([self.layer isKindOfClass:[HiCornersShapeLayer class]]) {
        return (HiCornersShapeLayer *)self.layer;
    }
    return nil;
}

- (void)setCorners:(HICorners)corners {
    _corners = corners;
    HiCornersShapeLayer *layer = [self shaper];
    layer.corners = corners;
}

@end
