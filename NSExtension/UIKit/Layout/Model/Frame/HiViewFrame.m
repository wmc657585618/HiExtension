//
//  HiViewFrame.m
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiViewFrame.h"
#import "HiFrameHander.h"
#import "HiFrameLayoutModel.h"

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
        self.view.frame = CGRectMake(self.leftValue, self.topValue, self.widthValue, self.heightValue);
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


- (CGFloat)leftValue {
    if (_left) return self.left.frame;
    if (_right && _width) return _right.frame + _width.frame;
    if (_width && _centerX) return _centerX.frame - _width.frame * 0.5;
    
    return 0;
}

- (CGFloat)rightValue {
    if (_right) return _right.frame;
    if (_centerX && _width) return _centerX.frame + _width.frame * 0.5;
    if (_left && _width) return _left.frame + _width.frame;
    
    return 0;

}

- (CGFloat)topValue {
    if (_top) return _top.frame;
    if (_bottom && _height) return _bottom.frame - _height.frame;
    if (_centerY && _height) return _centerY.frame - _height.frame * 0.5;
    
    return 0;

}

- (CGFloat)bottomValue {
    if (_bottom) return _bottom.frame;
    if (_height && _top) return _top.frame + _height.frame;
    if (_height && _centerY) return _centerY.frame + _height.frame * 0.5;
    
    return 0;

}

- (CGFloat)centerXValue {
    if (_centerX) return _centerX.frame;
    if (_left && _width) return _left.frame + _width.frame * 0.5;
    if (_right && _width ) return _right.frame - _width.frame * 0.5;
    
    return 0;
}

- (CGFloat)centerYValue {
    if (_centerY) return _centerY.frame;
    if (_top && _height) return _top.frame + _height.frame * 0.5;
    if (_bottom && _height) return _bottom.frame - _height.frame * 0.5;
    
    return 0;

}

- (CGFloat)widthValue {
    if (_width) return _width.frame;
    if (_left && _right) return _left.frame + _right.frame;
    
    return 0;
}

- (CGFloat)heightValue  {
    if (_height) return _height.frame;
    if (_bottom && _top) return _bottom.frame - _top.frame;
    
    return 0;
}

@end
