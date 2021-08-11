//
//  UIRadius.m
//  FourUILab
//
//  Created by four on 2021/4/7.
//

#import "HiCorners.h"

@interface HiCornersMaker : NSObject

+ (UIBezierPath *)drawCornersLineInRect:(CGRect)rect withCorners:(HICorners)corners;
+ (CAShapeLayer *)drawCornersLayerInRect:(CGRect)rect withCorners:(HICorners)corners;

@end

@implementation HiCornersMaker

+ (id)drawCornersLineInRect:(CGRect)rect withCorners:(HICorners)corners{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [self drawRadiusLineInRect:rect withRadius:corners bezierPath:bezierPath];
    return bezierPath;
}

+ (CAShapeLayer *)drawCornersLayerInRect:(CGRect)rect withCorners:(HICorners)corners {
    CAShapeLayer *maskLayer = [[CAShapeLayer  alloc]  init];
    maskLayer.frame = rect;
    maskLayer.path =  [[self drawCornersLineInRect:rect withCorners:corners] CGPath];
    
    return maskLayer;
}

+ (void)drawRadiusLineInRect:(CGRect)rect withRadius:(HICorners)corners bezierPath:(UIBezierPath *)bezierPath{
    
    CGFloat x = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat radius1 = corners.radius1; // 半径
    CGFloat radius2 = corners.radius2; // 半径
    CGFloat radius3 = corners.radius3; // 半径
    CGFloat radius4 = corners.radius4; // 半径
    
    CGFloat angle1 = 0;
    CGFloat angle2 = M_PI_2;
    CGFloat angle3 = M_PI;
    CGFloat angle4 = M_PI_2 * 3;
    
    CGPoint center1 = CGPointMake(x + width - radius1, y + height - radius1);
    CGPoint center2 = CGPointMake(x + radius2, y + height - radius2);
    CGPoint center3 = CGPointMake(x + radius3, y + radius3);
    CGPoint center4 = CGPointMake(x + width - radius4, y + radius4);

    CGPoint point1 = CGPointMake(x + radius2, y + height);
    CGPoint point2 = CGPointMake(x, radius3);
    CGPoint point3 = CGPointMake(x + width - radius4, y);
    CGPoint point4 = CGPointMake(x + width, y + height - radius1);

    [bezierPath moveToPoint:point4];
    if (radius1 > 0) [bezierPath addArcWithCenter:center1 radius:radius1 startAngle:angle1 endAngle:angle2 clockwise:YES];
    if (!CGPointEqualToPoint(bezierPath.currentPoint, point1)) {
        [bezierPath addLineToPoint:point1];
    }
    
    if (radius2 > 0) [bezierPath addArcWithCenter:center2 radius:radius2 startAngle:angle2 endAngle:angle3 clockwise:YES];
    if (!CGPointEqualToPoint(bezierPath.currentPoint, point2)) {
        [bezierPath addLineToPoint:point2];
    }
    

    if (radius3 > 0) [bezierPath addArcWithCenter:center3 radius:radius3 startAngle:angle3 endAngle:angle4 clockwise:YES];
    if (!CGPointEqualToPoint(bezierPath.currentPoint, point3)) {
        [bezierPath addLineToPoint:point3];
    }

    if (radius4 > 0) [bezierPath addArcWithCenter:center4 radius:radius4 startAngle:angle4 endAngle:angle1 clockwise:YES];
    if (!CGPointEqualToPoint(bezierPath.currentPoint, point4)) {
        [bezierPath addLineToPoint:point4];
    }
    
    [bezierPath closePath];
}

@end


@implementation HiCornersShapeLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.fillColor = nil;
        self.corners = HICornersZero;
        self.lineWidth = 0;
        self.backgroundColor = UIColor.clearColor.CGColor;
    }
    return self;
}

- (void)layoutSublayers {
    [super layoutSublayers];
    
    if (HICornersEqualCorners(self.corners, HICornersZero) && 0 == self.lineWidth) return;
    CAShapeLayer *mask = [HiCornersMaker drawCornersLayerInRect:self.bounds withCorners:self.corners];
    self.mask = mask;
    self.path = mask.path;
}

- (void)setCorners:(HICorners)corners {
    if (HICornersEqualCorners(corners, _corners)) return;
    _corners = corners;
    [self setNeedsLayout];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (borderWidth == self.lineWidth) return;
    self.lineWidth = borderWidth;
    [self setNeedsLayout];
}

- (void)setBorderColor:(CGColorRef)borderColor {
    if (borderColor == self.strokeColor) return;
    self.strokeColor = borderColor;
    [self setNeedsLayout];
}


@end
