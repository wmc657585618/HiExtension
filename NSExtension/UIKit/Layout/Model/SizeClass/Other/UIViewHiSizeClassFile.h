//
//  UIViewHiSizeClassFile.h
//  HiExension
//
//  Created by four on 2021/9/18.
//

#import <UIKit/UIKit.h>
#import "UIViewHiSizeClass.h"
#import "HiViewConstraintBuilder.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIView (HiConstraintProperty)

/// 当前 可用的 builder
/// 不同 size clas 可能是不同的 builder
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder;

- (void)hi_constraints_makeWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;

- (void)hi_constraints_updateWithSizeClass:(HiSizeClass)sizeClass block:(void(^_Nullable)(id<HiViewConstraintBuilder> _Nullable builder))block;


@end

@interface UIView (HiSizeClassFile)

@property (nonatomic, assign) NSInteger hi_sizeOptions;

/** siz class */
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_cr;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_cc;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ca;

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_rr;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_rc;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ra;

@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ar;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_ac;
@property (nonatomic, strong,readonly) HiViewConstraint *hi_builder_aa;


#pragma mark *********** property ***********
@property (nonatomic, assign) NSInteger hi_propertyOptions;

@property (nonatomic, copy) void(^hi_property_cr)(void);
@property (nonatomic, copy) void(^hi_property_cc)(void);
@property (nonatomic, copy) void(^hi_property_ca)(void);

@property (nonatomic, copy) void(^hi_property_rr)(void) ;
@property (nonatomic, copy) void(^hi_property_rc)(void);
@property (nonatomic, copy) void(^hi_property_ra)(void);

@property (nonatomic, copy) void(^hi_property_ar)(void);
@property (nonatomic, copy) void(^hi_property_ac)(void);
@property (nonatomic, copy) void(^hi_property_aa)(void);


@end

NS_ASSUME_NONNULL_END
