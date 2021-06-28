//
//  HiFrameHander.m
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import "HiFrameHander.h"
#import "HiViewFrame.h"

@implementation HiFrameHander

+ (CGRect)frameForBuilder:(HiViewFrame *)builder withOptions:(HiViewOptions)options{
    CGRect frame = CGRectZero;
    switch (options) {
        case 53:
            frame = [self frame53WithBuilder:builder];
            break;
        case 57:
            frame = [self frame57WithBuilder:builder];
            break;
        case 177:
            frame = [self frame177WithBuilder:builder];
            break;
        case 54:
            frame = [self frame54WithBuilder:builder];
            break;
        case 58:
            frame = [self frame58WithBuilder:builder];
            break;
        case 178:
            frame = [self frame178WithBuilder:builder];
            break;
        case 116:
            frame = [self frame116WithBuilder:builder];
            break;
        case 120:
            frame = [self frame120WithBuilder:builder];
            break;
        case 240:
            frame = [self frame240WithBuilder:builder];
            break;
        case 39:
            frame = [self frame39WithBuilder:builder];
            break;
        case 43:
            frame = [self frame43WithBuilder:builder];
            break;
        case 163:
            frame = [self frame163WithBuilder:builder];
            break;
        case 29:
            frame = [self frame29WithBuilder:builder];
            break;
        case 30:
            frame = [self frame30WithBuilder:builder];
            break;
        case 92:
            frame = [self frame92WithBuilder:builder];
            break;
        case 15:
            frame = [self frame15WithBuilder:builder];
            break;
        default:
            frame = CGRectZero;
    }
    return frame;
}

//  x-y-r-b : 15
+ (CGRect)frame15WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat y = builder.top.frame;
    CGFloat w = builder.right.frame - x;
    CGFloat h = builder.bottom.frame - y;
    return CGRectMake(x, y, w, h);
}

// x-y-b-w : 29
+ (CGRect)frame29WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat y = builder.top.frame;
    CGFloat w = builder.width.frame;
    CGFloat h = builder.bottom.frame - y;
    return CGRectMake(x, y, w, h);
}

// r-y-b-w : 30
+ (CGRect)frame30WithBuilder:(HiViewFrame *)builder {
    CGFloat w = builder.width.frame;
    CGFloat x = builder.right.frame - w;
    CGFloat y = builder.top.frame;
    CGFloat h = builder.bottom.frame - y;
    return CGRectMake(x, y, w, h);
}

//  x-r-y-h : 39
+ (CGRect)frame39WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat y = builder.top.frame;
    CGFloat w = builder.right.frame - x;
    CGFloat h = builder.height.frame;
    return CGRectMake(x, y, w, h);
}

// x-r-b-h : 43
+ (CGRect)frame43WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat h = builder.height.frame;
    CGFloat y = builder.bottom.frame - h;
    CGFloat w = builder.right.frame - x;
    return CGRectMake(x, y, w, h);
}

// x-y-w-h : 53
+ (CGRect)frame53WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat y = builder.top.frame;
    CGFloat w = builder.width.frame;
    CGFloat h = builder.height.frame;
    return CGRectMake(x, y, w, h);
}

// r-y-w-h : 54
+ (CGRect)frame54WithBuilder:(HiViewFrame *)builder {
    CGFloat w = builder.width.frame;
    CGFloat y = builder.top.frame;
    CGFloat x = builder.right.frame - w;
    CGFloat h = builder.height.frame;
    return CGRectMake(x, y, w, h);
}

// x-b-w-h : 57
+ (CGRect)frame57WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat h = builder.height.frame;
    CGFloat y = builder.bottom.frame - h;
    CGFloat w = builder.width.frame;
    return CGRectMake(x, y, w, h);
}

// r-b-w-h : 58
+ (CGRect)frame58WithBuilder:(HiViewFrame *)builder {
    CGFloat w = builder.width.frame;
    CGFloat h = builder.height.frame;
    CGFloat x = builder.right.frame - w;
    CGFloat y = builder.bottom.frame - h;
    return CGRectMake(x, y, w, h);
}

// cx-y-b-w : 92
+ (CGRect)frame92WithBuilder:(HiViewFrame *)builder {
    CGFloat y = builder.top.frame;
    CGFloat w = builder.width.frame;
    CGFloat x = builder.centerX.frame - w * 0.5;
    CGFloat h = builder.bottom.frame - y;
    return CGRectMake(x, y, w, h);
}

// cx-y-w-h : 116
+ (CGRect)frame116WithBuilder:(HiViewFrame *)builder {
    CGFloat y = builder.top.frame;
    CGFloat w = builder.width.frame;
    CGFloat x = builder.centerX.frame - w * 0.5;
    CGFloat h = builder.height.frame;
    return CGRectMake(x, y, w, h);
}

// cx-b-w-h : 120
+ (CGRect)frame120WithBuilder:(HiViewFrame *)builder {
    CGFloat h = builder.height.frame;
    CGFloat y = builder.bottom.frame - h;
    CGFloat w = builder.width.frame;
    CGFloat x = builder.centerX.frame - w * 0.5;
    return CGRectMake(x, y, w, h);
}

// x-r-cy-h : 163
+ (CGRect)frame163WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat h = builder.height.frame;
    CGFloat y = builder.centerY.frame - h * 0.5;
    CGFloat w = builder.right.frame - x;
    return CGRectMake(x, y, w, h);
}

// x-cy-w-h : 177
+ (CGRect)frame177WithBuilder:(HiViewFrame *)builder {
    CGFloat x = builder.left.frame;
    CGFloat h = builder.height.frame;
    CGFloat y = builder.centerY.frame - h * 0.5;
    CGFloat w = builder.width.frame;
    return CGRectMake(x, y, w, h);
}

// r-cy-w-h : 178
+ (CGRect)frame178WithBuilder:(HiViewFrame *)builder {
    CGFloat w = builder.width.frame;
    CGFloat x = builder.right.frame - w;
    CGFloat h = builder.height.frame;
    CGFloat y = builder.centerY.frame - h * 0.5;
    return CGRectMake(x, y, w, h);
}

// cx-cy-w-h : 240
+ (CGRect)frame240WithBuilder:(HiViewFrame *)builder {
    CGFloat w = builder.width.frame;
    CGFloat h = builder.height.frame;
    CGFloat x = builder.centerX.frame - w * 0.5;
    CGFloat y = builder.centerY.frame - h * 0.5;
    return CGRectMake(x, y, w, h);
}

@end
