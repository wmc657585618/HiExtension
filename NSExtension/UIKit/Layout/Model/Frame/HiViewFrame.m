//
//  HiViewFrame.m
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiViewFrame.h"
#import "HiFrameHander.h"

@interface HiViewFrame ()
@property (nonatomic,assign) HiViewOptions options;

@property (nonatomic,readwrite) HiFrameLayoutModel *left;                         //左侧
@property (nonatomic,readwrite) HiFrameLayoutModel *right;                        //右侧
@property (nonatomic,readwrite) HiFrameLayoutModel *top;                          //上方
@property (nonatomic,readwrite) HiFrameLayoutModel *bottom;                       //下方
@property (nonatomic,readwrite) HiFrameLayoutModel *width;                        //宽度
@property (nonatomic,readwrite) HiFrameLayoutModel *height;                       //高度
@property (nonatomic,readwrite) HiFrameLayoutModel *centerX;                      //X轴中心
@property (nonatomic,readwrite) HiFrameLayoutModel *centerY;                      //Y轴中心

@property (nonatomic,weak) UIView *view;

@end

@implementation HiViewFrame

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.options = HiViewOptionsNone;
        self.view = view;
    }
    return self;
}

- (void)updateFrame{
    if ([HiOptions availableViewOptions:self.options]) {
        self.view.frame = [HiFrameHander frameForBuilder:self withOptions:self.options];
    }
}

- (HiFrameLayoutModel *)modelForAttribute:(NSLayoutAttribute)attribute {
    self.options = [HiOptions viewOptions:self.options forAttribute:attribute];
    return [[HiFrameLayoutModel alloc] initWithView:self.view attribute:attribute builder:self];
}

- (HiFrameLayoutModel *)left {
    if (!_left) {
        _left = [self modelForAttribute:NSLayoutAttributeLeft];
    }
    return _left;
}

- (HiFrameLayoutModel *)right {
    if (!_right) {
        _right = [self modelForAttribute:NSLayoutAttributeRight];
    }
    return _right;
}

- (HiFrameLayoutModel *)top {
    if (!_top) {
        _top = [self modelForAttribute:NSLayoutAttributeTop];
    }
    return _top;
}

- (HiFrameLayoutModel *)bottom {
    if (!_bottom) {
        _bottom = [self modelForAttribute:NSLayoutAttributeBottom];
    }
    return _bottom;
}

- (HiFrameLayoutModel *)width {
    if (!_width) {
        _width = [self modelForAttribute:NSLayoutAttributeWidth];
    }
    return _width;
}

- (HiFrameLayoutModel *)height {
    if (!_height) {
        _height = [self modelForAttribute:NSLayoutAttributeHeight];
    }
    return _height;
}

- (HiFrameLayoutModel *)centerX {
    if (!_centerX) {
        _centerX = [self modelForAttribute:NSLayoutAttributeCenterX];
    }
    return _centerX;
}

- (HiFrameLayoutModel *)centerY {
    if (!_centerY) {
        _centerY = [self modelForAttribute:NSLayoutAttributeCenterY];
    }
    return _centerY;
}

@end
