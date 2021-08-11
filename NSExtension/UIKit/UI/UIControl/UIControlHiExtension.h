//
//  UIControlHiExtension.h
//  RouterDemo
//
//  Created by four on 2020/6/1.
//  Copyright © 2020 Four. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (HiExtension)

- (void)hi_addTouchDownTarget:(id)target action:(SEL)action;

- (void)hi_addTouchDownRepeatTarget:(id)target action:(SEL)action;

- (void)hi_addTouchDragInsideTarget:(id)target action:(SEL)action;

- (void)hi_addTouchDragOutsideTarget:(id)target action:(SEL)action;

- (void)hi_addTouchDragEnterTarget:(id)target action:(SEL)action;

- (void)hi_addTouchDragExitTarget:(id)target action:(SEL)action;

- (void)hi_addTouchUpInsideTarget:(id)target action:(SEL)action;

- (void)hi_addTouchUpOutsideTarget:(id)target action:(SEL)action;

- (void)hi_addTouchCancelTarget:(id)target action:(SEL)action;

- (void)hi_addValueChangedTarget:(id)target action:(SEL)action;

- (void)hi_addPrimaryActionTriggeredTarget:(id)target action:(SEL)action;

- (void)hi_addEditingDidBeginTarget:(id)target action:(SEL)action;

- (void)hi_addEditingChangedTarget:(id)target action:(SEL)action;

- (void)hi_addEditingDidEndTarget:(id)target action:(SEL)action;

- (void)hi_addEditingDidEndOnExitTarget:(id)target action:(SEL)action;

- (void)hi_addAllTouchEventsTarget:(id)target action:(SEL)action;

- (void)hi_addAllEditingEventsTarget:(id)target action:(SEL)action;

- (void)hi_addApplicationReservedTarget:(id)target action:(SEL)action;

- (void)hi_addSystemReservedTarget:(id)target action:(SEL)action;

- (void)hi_addAllEventsTarget:(id)target action:(SEL)action;

#pragma mark - ************* remove *************
- (void)hi_removeTouchDownTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchDownRepeatTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchDragInsideTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchDragOutsideTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchDragEnterTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchDragExitTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchUpInsideTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchUpOutsideTarget:(id)target action:(SEL)action;

- (void)hi_removeTouchCancelTarget:(id)target action:(SEL)action;

- (void)hi_removeValueChangedTarget:(id)target action:(SEL)action;

- (void)hi_removePrimaryActionTriggeredTarget:(id)target action:(SEL)action;

- (void)hi_removeEditingDidBeginTarget:(id)target action:(SEL)action;

- (void)hi_removeEditingChangedTarget:(id)target action:(SEL)action;

- (void)hi_removeEditingDidEndTarget:(id)target action:(SEL)action;

- (void)hi_removeEditingDidEndOnExitTarget:(id)target action:(SEL)action;

- (void)hi_removeAllTouchEventsTarget:(id)target action:(SEL)action;

- (void)hi_removeAllEditingEventsTarget:(id)target action:(SEL)action;

- (void)hi_removeApplicationReservedTarget:(id)target action:(SEL)action;

- (void)hi_removeSystemReservedTarget:(id)target action:(SEL)action;

- (void)hi_removeAllEventsTarget:(id)target action:(SEL)action;

#pragma mark - ************* block *************
- (void)hi_touchDown:(void(^)(UIControl *control))block;

- (void)hi_touchDownRepeat:(void(^)(UIControl *control))block;

- (void)hi_touchDragInside:(void(^)(UIControl *control))block;

- (void)hi_touchDragOutside:(void(^)(UIControl *control))block;

- (void)hi_touchDragEnter:(void(^)(UIControl *control))block;

- (void)hi_touchDragExit:(void(^)(UIControl *control))block;

- (void)hi_touchUpInside:(void(^)(UIControl *control))block;

- (void)hi_touchUpOutside:(void(^)(UIControl *control))block;

- (void)hi_touchCancel:(void(^)(UIControl *control))block;

- (void)hi_valueChanged:(void(^)(UIControl *control))block;

- (void)hi_primaryActionTriggered:(void(^)(UIControl *control))block;

- (void)hi_editingDidBegin:(void(^)(UIControl *control))block;

- (void)hi_editingChanged:(void(^)(UIControl *control))block;

- (void)hi_editingDidEnd:(void(^)(UIControl *control))block;

- (void)hi_editingDidEndOnExit:(void(^)(UIControl *control))block;

- (void)hi_allTouchEvents:(void(^)(UIControl *control))block;

- (void)hi_allEditingEvents:(void(^)(UIControl *control))block;

- (void)hi_applicationReserved:(void(^)(UIControl *control))block;

- (void)hi_systemReserved:(void(^)(UIControl *control))block;

- (void)hi_allEvents:(void(^)(UIControl *control))block;
@end

NS_ASSUME_NONNULL_END
