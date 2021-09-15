//
//  HiConstraintModel.h
//  HiUIKit
//
//  Created by four on 2021/2/19.
//

#import "HiLayoutModel.h"
#import "HiConstraintLayoutProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HiConstraintModel : HiLayoutModel<HiConstraintHorizontal0, HiConstraintHorizontal1, HiConstraintSize0, HiConstraintSize1, HiConstraintVertical0, HiConstraintVertical1, HiConstraintMultiplier>

@property (nonatomic,readonly) NSLayoutConstraint *layout;

- (void)remove;
- (NSLayoutConstraint *)getConstraint;

@property (nonatomic, readonly) HiConstraintModel * (^less)(UIView *); // <=
@property (nonatomic, readonly) HiConstraintModel * (^greater)(UIView *); // >==


@end

NS_ASSUME_NONNULL_END
