//
//  HiViewConstraint.h
//  FourUITest
//
//  Created by four on 2021/6/25.
//

#import <UIKit/UIKit.h>
#import "HiFrameProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HiViewConstraint : NSObject<HiViewConstraintBuilder>

- (instancetype)initWithView:(UIView *)view;
- (void)updateFrame;
- (void)removeAllConstraints;
- (void)removeConstraint:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint *)constraint:(NSLayoutAttribute)attribute;

@end

NS_ASSUME_NONNULL_END
