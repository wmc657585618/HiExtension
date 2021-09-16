//
//  HiViewConstraint.m
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiViewConstraint.h"
#import "HiOptions.h"
#import "HiConstraintModel.h"

@interface HiViewConstraint ()
@property (nonatomic, weak) UIView *view;
@property (nonatomic,assign) HiViewOptions options;

@property (nonatomic,readwrite) HiConstraintModel *left;
@property (nonatomic,readwrite) HiConstraintModel *right;
@property (nonatomic,readwrite) HiConstraintModel *centerX;

@property (nonatomic,readwrite) HiConstraintModel *top;
@property (nonatomic,readwrite) HiConstraintModel *bottom;
@property (nonatomic,readwrite) HiConstraintModel *centerY;

@property (nonatomic,readwrite) HiConstraintModel *width;
@property (nonatomic,readwrite) HiConstraintModel *height;

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
    return [[HiConstraintModel alloc] initWithView:self.view attribute:attribute];
}

- (HiConstraintModel *)left {
    if (!_left) {
        _left = [self modelForAttribute:NSLayoutAttributeLeft];
    }
    return _left;
}

- (HiConstraintModel *)right {
    if (!_right) {
        _right = [self modelForAttribute:NSLayoutAttributeRight];
    }
    return _right;
}

- (HiConstraintModel *)top {
    if (!_top) {
        _top = [self modelForAttribute:NSLayoutAttributeTop];
    }
    return _top;
}

- (HiConstraintModel *)bottom {
    if (!_bottom) {
        _bottom = [self modelForAttribute:NSLayoutAttributeBottom];
    }
    return _bottom;
}

- (HiConstraintModel *)width {
    if (!_width) {
        _width = [self modelForAttribute:NSLayoutAttributeWidth];
    }
    return _width;
}

- (HiConstraintModel *)height {
    if (!_height) {
        _height = [self modelForAttribute:NSLayoutAttributeHeight];
    }
    return _height;
}

- (HiConstraintModel *)centerX {
    if (!_centerX) {
        _centerX = [self modelForAttribute:NSLayoutAttributeCenterX];
    }
    return _centerX;
}

- (HiConstraintModel *)centerY {
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
    return [[self modelWithAttribute:attribute] getConstraint];
}

- (HiConstraintModel *)modelWithAttribute:(NSLayoutAttribute)attribute {
    switch (attribute) {
        case NSLayoutAttributeLeft:
            return _left;

        case NSLayoutAttributeRight:
            return _right;

        case NSLayoutAttributeCenterX:
            return _centerX;
        
        case NSLayoutAttributeTop:
            return _top;

        case NSLayoutAttributeBottom:
            return _bottom;

        case NSLayoutAttributeCenterY:
            return _centerY;
            
        case NSLayoutAttributeWidth:
            return _width;

        default:
            return _height;
    }
}

- (BOOL)avaliable {
    return HiViewOptionsNone == self.options;
}

- (void)animateLayout {
    [_left animate];
    [_right animate];
    [_top animate];
    [_bottom animate];
    [_centerX animate];
    [_centerY animate];
    [_width animate];
    [_height animate];
}

- (void)updateAttribute:(NSLayoutAttribute)attribute constraint:(CGFloat)constraint {
    NSLayoutConstraint *c = [self constraint:attribute];
    c.constant = constraint;
}

- (void)resetAttribute:(NSLayoutAttribute)attribute constraint:(void(^)(id))constraint {

    HiConstraintModel *model = [self modelWithAttribute:attribute];
    if (model && constraint) {
        constraint(model);
        [model remove];
        [model layout];
    }
}
@end
