//
//  HiViewConstraintBuilder.h
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import "HiViewConstraint.h"
#import "UIViewHiSizeClass.h"

#ifdef DEBUG
#define HIAssert(condition, desc)    NSAssert(condition, desc)
#else
#define HIAssert(condition, desc)
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiViewConstraintBuilder)

/// 获取, 如果之前 没有创建 return nil
- (HiViewConstraint *)hi_getBuilderWithSizeClass:(HiSizeClass)sizeClass;
/// 有效 builder, 比如 之前创建是 aa, 不管 size class 都返回 aa...
- (HiViewConstraint *)hi_getAvailableBuilderWithSizeClass:(HiSizeClass)sizeClass;

/// 创建 builder
- (HiViewConstraint *)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass;

@end

NS_ASSUME_NONNULL_END
