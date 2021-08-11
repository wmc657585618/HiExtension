//
//  UIControlHiExtension.m
//  RouterDemo
//
//  Created by four on 2020/6/1.
//  Copyright © 2020 Four. All rights reserved.
//

#import "UIControlHiExtension.h"
#import "NSObjectHiExtension.h"

typedef void(^HiControlPropertyBlock)(UIControl *control);

@implementation UIControl (HiExtension)

- (void)hi_addTouchDownTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)hi_addTouchDownRepeatTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDownRepeat];
}

- (void)hi_addTouchDragInsideTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDragInside];
}

- (void)hi_addTouchDragOutsideTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDragOutside];
}

- (void)hi_addTouchDragEnterTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDragEnter];
}

- (void)hi_addTouchDragExitTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDragExit];
}

- (void)hi_addTouchUpInsideTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)hi_addTouchUpOutsideTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpOutside];
}

- (void)hi_addTouchCancelTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchCancel];
}

- (void)hi_addValueChangedTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventValueChanged];
}

- (void)hi_addPrimaryActionTriggeredTarget:(id)target action:(SEL)action {
    if (@available(iOS 9.0, *)) {
        [self addTarget:target action:action forControlEvents:UIControlEventPrimaryActionTriggered];
    }
}

- (void)hi_addEditingDidBeginTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventEditingDidBegin];
}

- (void)hi_addEditingChangedTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventEditingChanged];
}

- (void)hi_addEditingDidEndTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventEditingDidEnd];
}

- (void)hi_addEditingDidEndOnExitTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)hi_addAllTouchEventsTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventAllTouchEvents];
}

- (void)hi_addAllEditingEventsTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventAllEditingEvents];
}

- (void)hi_addApplicationReservedTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventApplicationReserved];
}

- (void)hi_addSystemReservedTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventSystemReserved];
}

- (void)hi_addAllEventsTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventAllEvents];
}

#pragma mark - ************* remove *************
- (void)hi_removeTouchDownTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)hi_removeTouchDownRepeatTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDownRepeat];
}

- (void)hi_removeTouchDragInsideTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDragInside];
}

- (void)hi_removeTouchDragOutsideTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDragOutside];
}

- (void)hi_removeTouchDragEnterTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDragEnter];
}

- (void)hi_removeTouchDragExitTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchDragExit];
}

- (void)hi_removeTouchUpInsideTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)hi_removeTouchUpOutsideTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchUpOutside];
}

- (void)hi_removeTouchCancelTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchCancel];
}

- (void)hi_removeValueChangedTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventValueChanged];
}

- (void)hi_removePrimaryActionTriggeredTarget:(id)target action:(SEL)action {
    if (@available(iOS 9.0, *)) {
        [self removeTarget:target action:action forControlEvents:UIControlEventPrimaryActionTriggered];
    }
}

- (void)hi_removeEditingDidBeginTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventEditingDidBegin];
}

- (void)hi_removeEditingChangedTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventEditingChanged];
}

- (void)hi_removeEditingDidEndTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventEditingDidEnd];
}

- (void)hi_removeEditingDidEndOnExitTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)hi_removeAllTouchEventsTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventAllTouchEvents];
}

- (void)hi_removeAllEditingEventsTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventAllEditingEvents];
}

- (void)hi_removeApplicationReservedTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventApplicationReserved];
}

- (void)hi_removeSystemReservedTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventSystemReserved];
}

- (void)hi_removeAllEventsTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventAllEvents];
}


#pragma mark - ************* block *************
- (void)setTouchDownBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDownBlock) value:block];
}

- (HiControlPropertyBlock)touchDownBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDown:(void(^)(UIControl *control))block {
    [self setTouchDownBlock:block];
    [self addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
}

- (void)touchDown:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDownBlock];
    if (block) block(self);
}

- (void)setTouchDownRepeatBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDownRepeatBlock) value:block];
}

- (HiControlPropertyBlock)touchDownRepeatBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDownRepeat:(void(^)(UIControl *control))block {
    [self setTouchDownRepeatBlock:block];
    [self addTarget:self action:@selector(touchDownRepeat:) forControlEvents:UIControlEventTouchDownRepeat];
}

- (void)touchDownRepeat:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDownRepeatBlock];
    if (block) block(self);
}

- (void)setTouchDragInsideBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDragInsideBlock) value:block];
}

- (HiControlPropertyBlock)touchDragInsideBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDragInside:(void(^)(UIControl *control))block {
    [self setTouchDragInsideBlock:block];
    [self addTarget:self action:@selector(touchDragInside:) forControlEvents:UIControlEventTouchDragInside];
}

- (void)touchDragInside:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDragInsideBlock];
    if (block) block(self);
}

- (void)setTouchDragOutsideBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDragOutsideBlock) value:block];
}

- (HiControlPropertyBlock)touchDragOutsideBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDragOutside:(void(^)(UIControl *control))block {
    [self setTouchDragOutsideBlock:block];
    [self addTarget:self action:@selector(touchDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
}

- (void)touchDragOutside:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDragOutsideBlock];
    if (block) block(self);
}

- (void)setTouchDragEnterBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDragEnterBlock) value:block];
}

- (HiControlPropertyBlock)touchDragEnterBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDragEnter:(void(^)(UIControl *control))block {
    [self setTouchDragEnterBlock:block];
    [self addTarget:self action:@selector(touchDragEnter:) forControlEvents:UIControlEventTouchDragEnter];
}

- (void)touchDragEnter:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDragEnterBlock];
    if (block) block(self);
}

- (void)setTouchDragExitBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchDragExitBlock) value:block];
}

- (HiControlPropertyBlock)touchDragExitBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchDragExit:(void(^)(UIControl *control))block {
    [self setTouchDragExitBlock:block];
    [self addTarget:self action:@selector(touchDragExit:) forControlEvents:UIControlEventTouchDragExit];
}

- (void)touchDragExit:(UIControl *)control {
    HiControlPropertyBlock block = [self touchDragExitBlock];
    if (block) block(self);
}

- (void)setTouchUpInsideBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchUpInsideBlock) value:block];
}

- (HiControlPropertyBlock)touchUpInsideBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchUpInside:(void(^)(UIControl *control))block {
    [self setTouchUpInsideBlock:block];
    [self addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchUpInside:(UIControl *)control {
    HiControlPropertyBlock block = [self touchUpInsideBlock];
    if (block) block(self);
}

- (void)setTouchUpOutsideBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchUpOutsideBlock) value:block];
}

- (HiControlPropertyBlock)touchUpOutsideBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchUpOutside:(void(^)(UIControl *control))block {
    [self setTouchUpOutsideBlock:block];
    [self addTarget:self action:@selector(touchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)touchUpOutside:(UIControl *)control {
    HiControlPropertyBlock block = [self touchUpOutsideBlock];
    if (block) block(self);
}

- (void)setTouchCancelBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(touchCancelBlock) value:block];
}

- (HiControlPropertyBlock)touchCancelBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_touchCancel:(void(^)(UIControl *control))block {
    [self setTouchCancelBlock:block];
    [self addTarget:self action:@selector(touchCancel:) forControlEvents:UIControlEventTouchCancel];
}

- (void)touchCancel:(UIControl *)control {
    HiControlPropertyBlock block = [self touchCancelBlock];
    if (block) block(self);
}

- (void)setValueChangedBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(valueChangedBlock) value:block];
}

- (HiControlPropertyBlock)valueChangedBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_valueChanged:(void(^)(UIControl *control))block {
    [self setValueChangedBlock:block];
    [self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UIControl *)control {
    HiControlPropertyBlock block = [self valueChangedBlock];
    if (block) block(self);
}

- (void)setPrimaryActionTriggeredBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(primaryActionTriggeredBlock) value:block];
}

- (HiControlPropertyBlock)primaryActionTriggeredBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_primaryActionTriggered:(void(^)(UIControl *control))block {
    if (@available(iOS 9.0, *)) {
        [self setPrimaryActionTriggeredBlock:block];
        [self addTarget:self action:@selector(primaryActionTriggered:) forControlEvents:UIControlEventPrimaryActionTriggered];
    }
}

- (void)primaryActionTriggered:(UIControl *)control {
    HiControlPropertyBlock block = [self primaryActionTriggeredBlock];
    if (block) block(self);
}

- (void)setEditingDidBeginBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(editingDidBeginBlock) value:block];
}

- (HiControlPropertyBlock)editingDidBeginBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_editingDidBegin:(void(^)(UIControl *control))block {
    [self setEditingDidBeginBlock:block];
    [self addTarget:self action:@selector(editingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
}

- (void)editingDidBegin:(UIControl *)control {
    HiControlPropertyBlock block = [self editingDidBeginBlock];
    if (block) block(self);
}

- (void)setEditingChangedBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(editingChangedBlock) value:block];
}

- (HiControlPropertyBlock)editingChangedBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_editingChanged:(void(^)(UIControl *control))block {
    [self setEditingChangedBlock:block];
    [self addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)editingChanged:(UIControl *)control {
    HiControlPropertyBlock block = [self editingChangedBlock];
    if (block) block(self);
}

- (void)setEditingDidEndBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(editingDidEndBlock) value:block];
}

- (HiControlPropertyBlock)editingDidEndBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_editingDidEnd:(void(^)(UIControl *control))block {
    [self setEditingDidEndBlock:block];
    [self addTarget:self action:@selector(editingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)editingDidEnd:(UIControl *)control {
    HiControlPropertyBlock block = [self editingDidEndBlock];
    if (block) block(self);
}

- (void)setEditingDidEndOnExitBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(editingDidEndOnExitBlock) value:block];
}

- (HiControlPropertyBlock)editingDidEndOnExitBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_editingDidEndOnExit:(void(^)(UIControl *control))block {
    [self setEditingDidEndOnExitBlock:block];
    [self addTarget:self action:@selector(editingDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)editingDidEndOnExit:(UIControl *)control {
    HiControlPropertyBlock block = [self editingDidEndOnExitBlock];
    if (block) block(self);
}

- (void)setAllTouchEventsBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(allTouchEventsBlock) value:block];
}

- (HiControlPropertyBlock)allTouchEventsBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_allTouchEvents:(void(^)(UIControl *control))block {
    [self setAllTouchEventsBlock:block];
    [self addTarget:self action:@selector(allTouchEvents:) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)allTouchEvents:(UIControl *)control {
    HiControlPropertyBlock block = [self allTouchEventsBlock];
    if (block) block(self);
}

- (void)setAllEditingEventsBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(allEditingEventsBlock) value:block];
}

- (HiControlPropertyBlock)allEditingEventsBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_allEditingEvents:(void(^)(UIControl *control))block {
    [self setAllEditingEventsBlock:block];
    [self addTarget:self action:@selector(allEditingEvents:) forControlEvents:UIControlEventAllEditingEvents];
}

- (void)allEditingEvents:(UIControl *)control {
    HiControlPropertyBlock block = [self allEditingEventsBlock];
    if (block) block(self);
}

- (void)setApplicationReservedBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(applicationReservedBlock) value:block];
}

- (HiControlPropertyBlock)applicationReservedBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_applicationReserved:(void(^)(UIControl *control))block {
    [self setApplicationReservedBlock:block];
    [self addTarget:self action:@selector(applicationReserved:) forControlEvents:UIControlEventApplicationReserved];
}

- (void)applicationReserved:(UIControl *)control {
    HiControlPropertyBlock block = [self applicationReservedBlock];
    if (block) block(self);
}

- (void)setSystemReservedBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(systemReservedBlock) value:block];
}

- (HiControlPropertyBlock)systemReservedBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_systemReserved:(void(^)(UIControl *control))block {
    [self setSystemReservedBlock:block];
    [self addTarget:self action:@selector(systemReserved:) forControlEvents:UIControlEventSystemReserved];
}

- (void)systemReserved:(UIControl *)control {
    HiControlPropertyBlock block = [self systemReservedBlock];
    if (block) block(self);
}

- (void)setAllEventsBlock:(HiControlPropertyBlock)block {
    [self hi_addCopyPropertyForKey:@selector(allEventsBlock) value:block];
}

- (HiControlPropertyBlock)allEventsBlock {
    return [self hi_getValueForKey:_cmd];
}
- (void)hi_allEvents:(void(^)(UIControl *control))block {
    [self setAllEventsBlock:block];
    [self addTarget:self action:@selector(allEvents:) forControlEvents:UIControlEventAllEvents];
}

- (void)allEvents:(UIControl *)control {
    HiControlPropertyBlock block = [self allEventsBlock];
    if (block) block(self);
}

@end
