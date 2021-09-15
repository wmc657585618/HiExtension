//
//  HiLayoutModel.h
//  HiExension
//
//  Created by four on 2021/9/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HiLayoutModel : UIView

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, assign) NSLayoutAttribute attribute1;
@property (nonatomic, assign) NSLayoutRelation relate;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, assign) NSLayoutAttribute attribute2;
@property (nonatomic, assign) CGFloat mult;
@property (nonatomic, assign) CGFloat constraint;

- (instancetype)left;
- (instancetype)right;
- (instancetype)top;
- (instancetype)bottom;
- (instancetype)width;
- (instancetype)height;
- (instancetype)centerX;
- (instancetype)centerY;

// protocol
- (id (^)(CGFloat))multiplier;
- (void (^)(CGFloat))value;

// relate
- (id(^)(UIView *))equal;
@end

NS_ASSUME_NONNULL_END
