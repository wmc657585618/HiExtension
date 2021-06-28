//
//  HiFramDefine.h
//  HiUIKit
//
//  Created by four on 2021/2/20.
//

#import <UIKit/UIKit.h>

#define HiFrameBlock(T,n) T * (^n)(UIView *view)
#define HiFloatBlock(T,n) T * (^n)(CGFloat value)
