//
//  HiViewConstraint.m
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiViewConstraint.h"
#import "HiOptions.h"

@interface HiViewConstraint ()
@property (nonatomic, weak) UIView *view;
@property (nonatomic,assign) HiViewOptions options;

@property (nonatomic,readwrite) HiConstraintHorizontal1Model *left;
@property (nonatomic,readwrite) HiConstraintHorizontal1Model *right;
@property (nonatomic,readwrite) HiConstraintHorizontal1Model *centerX;

@property (nonatomic,readwrite) HiConstraintVertical1Model *top;
@property (nonatomic,readwrite) HiConstraintVertical1Model *bottom;
@property (nonatomic,readwrite) HiConstraintVertical1Model *centerY;

@property (nonatomic,readwrite) HiConstraintSize1Model *width;
@property (nonatomic,readwrite) HiConstraintSize1Model *height;

@end

@implementation HiViewConstraint

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.options = HiViewOptionsNone;
    }
    return self;
}

- (__kindof HiConstraintModel *)modelForAttribute:(NSLayoutAttribute)attribute {
    self.options = [HiOptions viewOptions:self.options forAttribute:attribute];
    switch (attribute) {
        case NSLayoutAttributeLeft:
        case NSLayoutAttributeRight:
        case NSLayoutAttributeCenterX:
            return [[HiConstraintHorizontal1Model alloc] initWithView:self.view attribute:attribute];
        
        case NSLayoutAttributeTop:
        case NSLayoutAttributeBottom:
        case NSLayoutAttributeCenterY:
            return [[HiConstraintVertical1Model alloc] initWithView:self.view attribute:attribute];
       
        default:
            return [[HiConstraintSize1Model alloc] initWithView:self.view attribute:attribute];

    }
}

- (HiConstraintHorizontal1Model *)left {
    if (!_left) {
        _left = [self modelForAttribute:NSLayoutAttributeLeft];
    }
    return _left;
}

- (HiConstraintHorizontal1Model *)right {
    if (!_right) {
        _right = [self modelForAttribute:NSLayoutAttributeRight];
    }
    return _right;
}

- (HiConstraintVertical1Model *)top {
    if (!_top) {
        _top = [self modelForAttribute:NSLayoutAttributeTop];
    }
    return _top;
}

- (HiConstraintVertical1Model *)bottom {
    if (!_bottom) {
        _bottom = [self modelForAttribute:NSLayoutAttributeBottom];
    }
    return _bottom;
}

- (HiConstraintSize1Model *)width {
    if (!_width) {
        _width = [self modelForAttribute:NSLayoutAttributeWidth];
    }
    return _width;
}

- (HiConstraintSize1Model *)height {
    if (!_height) {
        _height = [self modelForAttribute:NSLayoutAttributeHeight];
    }
    return _height;
}

- (HiConstraintHorizontal1Model *)centerX {
    if (!_centerX) {
        _centerX = [self modelForAttribute:NSLayoutAttributeCenterX];
    }
    return _centerX;
}

- (HiConstraintVertical1Model *)centerY {
    if (!_centerY) {
        _centerY = [self modelForAttribute:NSLayoutAttributeCenterY];
    }
    return _centerY;
}

- (void)updateFrame {
    if ([HiOptions availableViewOptions:self.options]) {
        [_left layout];
        [_right layout];
        [_top layout];
        [_bottom layout];
        [_centerX layout];
        [_centerY layout];
        [_width layout];
        [_height layout];
    }
}

- (void)removeAllConstraints {
    self.options = HiViewOptionsNone;
    [_left remove];
    [_right remove];
    [_top remove];
    [_bottom remove];
    [_centerX remove];
    [_centerY remove];
    [_width remove];
    [_height remove];
    _left = nil;
    _right = nil;
    _top = nil;
    _bottom = nil;
    _centerX = nil;
    _centerY = nil;
    _width = nil;
    _height = nil;
}

- (void)removeConstraint:(NSLayoutAttribute)attribute {
    switch (attribute) {
        case NSLayoutAttributeLeft:
        {
            [_left remove];
            if(_left) self.options = self.options & (~HiViewOptionsLeft);
            _left = nil;
        }
            break;

        case NSLayoutAttributeRight:
        {
            [_right remove];
            if(_right) self.options = self.options & (~HiViewOptionsRight);
            _right = nil;
        }
            break;

        case NSLayoutAttributeCenterX:
        {
            [_centerX remove];
            if(_centerX) self.options = self.options & (~HiViewOptionsCenterX);
            _centerX = nil;
        }
            
            break;
        
        case NSLayoutAttributeTop:
        {
            [_top remove];
            if(_top) self.options = self.options & (~HiViewOptionsTop);
            _top = nil;
        }
            break;

        case NSLayoutAttributeBottom:
        {
            [_bottom remove];
            if(_bottom) self.options = self.options & (~HiViewOptionsLeft);
            _bottom = nil;
        }
            break;

        case NSLayoutAttributeCenterY:
        {
            [_centerY remove];
            if(_centerY) self.options = self.options & (~HiViewOptionsLeft);
            _centerY = nil;
        }
            break;
            
        case NSLayoutAttributeWidth:
        {
            [_width remove];
            if(_width) self.options = self.options & (~HiViewOptionsWidth);
            _width = nil;
        }
            break;

        default:
        {
            [_height remove];
            if(_height) self.options = self.options & (~HiViewOptionsHeight);
            _height = nil;
        }
            break;
    }
}

- (NSLayoutConstraint *)constraint:(NSLayoutAttribute)attribute {
    switch (attribute) {
        case NSLayoutAttributeLeft:
            return [_left getConstraint];

        case NSLayoutAttributeRight:
            return [_right getConstraint];

        case NSLayoutAttributeCenterX:
            return [_centerX getConstraint];
        
        case NSLayoutAttributeTop:
            return [_top getConstraint];

        case NSLayoutAttributeBottom:
            return [_bottom getConstraint];

        case NSLayoutAttributeCenterY:
            return [_centerY getConstraint];
            
        case NSLayoutAttributeWidth:
            return [_width getConstraint];

        default:
            return [_height getConstraint];
    }
}
@end
