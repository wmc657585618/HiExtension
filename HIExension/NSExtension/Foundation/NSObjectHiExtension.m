//
//  NSObjectHiExtension.m
//  RouterDemo
//
//  Created by four on 2020/5/12.
//  Copyright © 2020 Four. All rights reserved.
//

#import "NSObjectHiExtension.h"
#import <objc/runtime.h>

@interface HiNSWeakObject : NSObject
@property (nonatomic, weak) id objc;
@end

@implementation HiNSWeakObject @end

@implementation NSObject (HiRuntime)

+ (void)hi_class_getInstanceMethod:(SEL)originalSelector newSelector:(SEL)newSelector {
    Method originalMethod = class_getInstanceMethod(self, originalSelector);
    Method altMetthod = class_getInstanceMethod(self, newSelector);
    
    if (originalMethod && altMetthod) {
        method_exchangeImplementations(originalMethod, altMetthod);
    }
}

+ (instancetype)hi_convert:(id)object {
    if ([object isKindOfClass:self]) return object;
    return nil;
}

@end

@implementation NSObject (HiProperty)

- (void)hi_addPropertyForKey:(const void *)key value:(id)value policy:(objc_AssociationPolicy)policy {
    objc_setAssociatedObject(self, key, value, policy);
}

#pragma mark - public
- (void)hi_addCharPropertyForKey:(const void *)key value:(char)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedCharPropertyForKey:(const void *)key value:(unsigned char)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addShortPropertyForKey:(const void *)key value:(short)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedShortPropertyForKey:(const void *)key value:(unsigned short)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addIntPropertyForKey:(const void *)key value:(int)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedIntPropertyForKey:(const void *)key value:(unsigned int)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addLongPropertyForKey:(const void *)key value:(long)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedLongPropertyForKey:(const void *)key value:(unsigned long)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addLongLongPropertyForKey:(const void *)key value:(long long)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedLongLongPropertyForKey:(const void *)key value:(unsigned long long)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addFloatPropertyForKey:(const void *)key value:(float)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addDoublePropertyForKey:(const void *)key value:(double)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addBoolPropertyForKey:(const void *)key value:(BOOL)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addIntegerValuePropertyForKey:(const void *)key value:(NSInteger)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hi_addUnsignedIntegerlPropertyForKey:(const void *)key value:(NSUInteger)value {
    objc_setAssociatedObject(self, key, @(value), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (char)hi_charPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.charValue;
    return '0';
}

- (unsigned char)hi_unsignedCharPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedCharValue;
    return '0';
}

- (short)hi_shortPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.shortValue;
    return 0;
}

- (unsigned short)hi_unsignedShortPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedShortValue;
    return 0;
}

- (int)hi_intPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.intValue;
    return 0;
}

- (unsigned int)hi_unsignedIntPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedIntValue;
    return 0;
}

- (long)hi_longPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.longValue;
    return 0;
}

- (unsigned long)hi_unsignedLongPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedLongValue;
    return 0;
}

- (long long)hi_longLongPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.longLongValue;
    return 0;
}

- (unsigned long long)hi_unsignedLongLongPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedLongLongValue;
    return 0;
}

- (float)hi_floatPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.floatValue;
    return 0.0;
}

- (double)hi_doublePropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.doubleValue;
    return 0.0;
}

- (BOOL)hi_boolPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.boolValue;
    return false;
}

- (NSInteger)hi_integerValuePropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.integerValue;
    return 0;
}

- (NSUInteger)hi_unsignedIntegerlPropertyForKey:(const void *)key {
    NSNumber *value = objc_getAssociatedObject(self, key);
    if ([value isKindOfClass:NSNumber.class]) return value.unsignedIntegerValue;
    return 0;
}


- (void)hi_addWeakPropertyForKey:(const void *)key value:(id _Nullable)value {
    HiNSWeakObject *objc = objc_getAssociatedObject(self, key);
    if (!objc) {
        objc = [[HiNSWeakObject alloc] init];
        objc.objc = value;
        [self hi_addPropertyForKey:key value:objc policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
    }
}

- (void)hi_addAssingPropertyForKey:(const void *)key value:(id _Nullable)value {
    [self hi_addPropertyForKey:key value:value policy:OBJC_ASSOCIATION_ASSIGN];
}

- (void)hi_addRetainNonatomicPropertyForKey:(const void *)key value:(id _Nullable)value {
    [self hi_addPropertyForKey:key value:value policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

- (void)hi_addCopyNonatomicPropertyForKey:(const void *)key value:(id _Nullable)value {
    [self hi_addPropertyForKey:key value:value policy:OBJC_ASSOCIATION_COPY_NONATOMIC];
}

- (void)hi_addRetainPropertyForKey:(const void *)key value:(id _Nullable)value {
    [self hi_addPropertyForKey:key value:value policy:OBJC_ASSOCIATION_RETAIN];
}

- (void)hi_addCopyPropertyForKey:(const void *)key value:(id _Nullable)value {
    [self hi_addPropertyForKey:key value:value policy:OBJC_ASSOCIATION_COPY];
}

- (id)hi_getValueForKey:(const void *)key {
    id objc = objc_getAssociatedObject(self, key);
    if ([objc isKindOfClass:HiNSWeakObject.class]) return [objc objc];
    return objc_getAssociatedObject(self, key);
}

@end

#pragma mark - observer
@interface NSObject ()

@property (nonatomic,strong,readonly) NSMutableDictionary<NSString *,NSHashTable *> *keyObserverMap;

@end

@implementation NSObject (HiObserver)

- (NSMutableDictionary *)keyObserverMap {
    
    NSMutableDictionary *map = [self hi_getValueForKey:@selector(keyObserverMap)];
    if (!map) {
        map = [NSMutableDictionary dictionary];
        [self hi_addRetainPropertyForKey: @selector(keyObserverMap) value:map];
    }
    return map;
}

#pragma mark - private
- (void)addObject:(NSObject *)object forKeyPath:(NSString *)keyPath{
    
    NSHashTable *table = [self.keyObserverMap objectForKey:keyPath];
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
        [self.keyObserverMap setObject:table forKey:keyPath];
    }
    
    if (![table containsObject:object]) {
        [table addObject:object];
    }
}

- (void)removeObject:(NSObject *)object forKeyPath:(NSString *)keyPath {
    NSHashTable *table = [self.keyObserverMap objectForKey:keyPath];
    [table removeObject:object];
}

- (BOOL)containsObject:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    NSHashTable *table = [self.keyObserverMap objectForKey:keyPath];
    return [table containsObject:observer];
}

#pragma mark - public
- (void)hi_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
 {
    if (observer && keyPath) {
        [self addObject:observer forKeyPath:keyPath];
        [self addObserver:observer forKeyPath:keyPath options:options context:context];
    }
}

- (void)hi_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
   
    if (observer && keyPath) {
        if ([self containsObject:observer forKeyPath:keyPath]){
            [self removeObserver:observer forKeyPath:keyPath];
            [self removeObject:observer forKeyPath:keyPath];
        }
    }
}

- (void)hi_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context {
    
    if (observer && keyPath) {
        if ([self containsObject:observer forKeyPath:keyPath]){
            [self removeObserver:observer forKeyPath:keyPath context:context];
            [self removeObject:observer forKeyPath:keyPath];
        }
    }
}

- (void)hi_removeAllObserverForKeyPath:(NSString *)keyPath {
    if (keyPath) {
        NSHashTable *table = [self.keyObserverMap objectForKey:keyPath];
        for (NSObject *observer in table.allObjects) {
            [self removeObserver:observer forKeyPath:keyPath];
        }
        [table removeAllObjects];
    }
}

- (void)hi_removeAllObservers {
    NSArray *keyArray = self.keyObserverMap.allKeys;
    for (NSString *key in keyArray) {
        [self hi_removeAllObserverForKeyPath:key];
    }
}

@end


@implementation NSObject (NSDictionary)

+ (nullable id)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary valueForKey:defaultName];
        if ([objc isKindOfClass:self]) return objc;
        return nil;
    }
    return objc;
}

+ (nullable id)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary objectForKey:defaultName];
        if ([objc isKindOfClass:self]) return objc;
        return nil;
    }
    return objc;
}

- (nonnull id)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary valueForKey:defaultName];
        if ([objc isKindOfClass:self.class]) return objc;
    }
    return self;
}

- (nonnull id)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary objectForKey:defaultName];
        if ([objc isKindOfClass:self.class]) return objc;
    }
    return self;
}

- (void)hi_addToDictionary:(NSMutableDictionary *)dictionary key:(NSString *)defaultName {
    if ([dictionary isKindOfClass:NSMutableDictionary.class]) {
        [dictionary setValue:self forKey:defaultName];
    }
}

@end

@implementation NSObject (NSArray)

+ (nullable id)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index {
    id objc = nil;
    if ([array isKindOfClass:NSArray.class]) {
        if (index < array.count) objc = [array objectAtIndex:index];
        if ([objc isKindOfClass:self]) return objc;
        return nil;
    }
    return objc;
}

- (nonnull id)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index {
    id objc = nil;
    if ([array isKindOfClass:NSArray.class]) {
        if (index < array.count) objc = [array objectAtIndex:index];
        if ([objc isKindOfClass:self.class]) return objc;
    }
    return self;
}

- (void)hi_insertArray:(NSMutableArray *)array index:(NSUInteger)index {
    if ([array isKindOfClass:NSArray.class]) {
        if (index >= 0 && index <= array.count) {
            [array insertObject:self atIndex:index];
        } else {
            [array addObject:self];
        }
    }
}

- (void)hi_appendToArrary:(NSMutableArray *)array {
    if ([array isKindOfClass:NSMutableArray.class]) {
        [array addObject:self];
    }
}

@end

#pragma mark - dictionary
@implementation NSDictionary (HiCategory)

- (NSInteger)hi_integerForKey:(NSString *)defaultName {
    id objc = [NSObject hi_dictionary:self valueKey:defaultName];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (float)hi_floatForKey:(NSString *)defaultName {
    id objc = [NSObject hi_dictionary:self valueKey:defaultName];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (double)hi_doubleForKey:(NSString *)defaultName {
    id objc = [NSObject hi_dictionary:self valueKey:defaultName];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (BOOL)hi_boolForKey:(NSString *)defaultName {
    id objc = [NSObject hi_dictionary:self valueKey:defaultName];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

@end

@implementation NSMutableDictionary (HiCategory)

- (void)hi_removeObjectForKey:(NSString *)defaultName {
    if (defaultName) [self removeObjectForKey:defaultName];
}

- (void)hi_setInteger:(NSInteger)value forKey:(NSString *)defaultName {
    if (defaultName) [self setValue:@(value) forKey:defaultName];
}

- (void)hi_setFloat:(float)value forKey:(NSString *)defaultName {
    if (defaultName) [self setValue:@(value) forKey:defaultName];
}

- (void)hi_setDouble:(double)value forKey:(NSString *)defaultName {
    if (defaultName) [self setValue:@(value) forKey:defaultName];
}

- (void)hi_setBool:(BOOL)value forKey:(NSString *)defaultName {
    if (defaultName) [self setValue:@(value) forKey:defaultName];
}

@end

@implementation NSArray (HiCategory)

- (BOOL)hasData {
    return self.count > 0;
}

- (NSInteger)hi_integerAtIndex:(NSUInteger)index {
    id objc = [NSObject hi_array:self objectAtIndex:index];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (float)hi_floatAtIndex:(NSUInteger)index {
    id objc = [NSObject hi_array:self objectAtIndex:index];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (double)hi_doubleAtIndex:(NSUInteger)index {
    id objc = [NSObject hi_array:self objectAtIndex:index];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

- (BOOL)hi_boolAtIndex:(NSUInteger)index  {
    id objc = [NSObject hi_array:self objectAtIndex:index];
    if ([objc respondsToSelector:@selector(integerValue)]) return [objc integerValue];
    return 0;
}

// 去除 上限
- (NSRange)availableRange:(NSRange)range {
    NSUInteger location = range.location;
    NSUInteger length = location + range.length;
    if (length > self.count) {
        length = self.count - location;
        if (length < 0) length = 0;
    }
    
    if (location < 0) location = 0;
    return NSMakeRange(location, length);
}

@end

@implementation NSMutableArray (HiCategory)

- (void)hi_addObject:(id)anObject {
    if (anObject) [self addObject:anObject];
}

- (void)hi_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject && index <= self.count) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)hi_removeObjectAtIndex:(NSUInteger)index {
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}

- (void)hi_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject && index < self.count) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}

- (void)hi_addObjectsFromArray:(NSArray *)otherArray {
    for (id objc in otherArray) {
        [self hi_addObject:objc];
    }
}

- (void)hi_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    
    NSUInteger count = self.count;
    if (idx1 < count && idx2 < count) {
        [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    }
}

- (void)hi_removeObject:(id)anObject inRange:(NSRange)range {
    if (!anObject) return;
    
    NSRange availableRange = [self availableRange:range];
    NSUInteger min = availableRange.location;
    if (min < self.count) [self removeObject:anObject inRange:range];
}

- (void)hi_removeObject:(id)anObject {
    if (anObject) [self removeObject:anObject];
}

- (void)hi_removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range {
    if (!anObject) return;
    
    NSRange availableRange = [self availableRange:range];
    NSUInteger min = availableRange.location;
    if (min < self.count) [self removeObjectIdenticalTo:anObject inRange:availableRange];
}

- (void)hi_removeObjectIdenticalTo:(id)anObject {
    if (anObject) [self removeObjectIdenticalTo:anObject];
}

- (void)hi_removeObjectsInArray:(NSArray *)otherArray {
    
    for (id object in otherArray) {
        [self hi_removeObject:object];
    }
}

- (void)hi_removeObjectsInRange:(NSRange)range {
    
    NSRange availableRange = [self availableRange:range];
    NSUInteger min = availableRange.location;
    if (min < self.count) [self removeObjectsInRange:availableRange];
}

- (void)hi_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange {
    if (!otherArray) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:otherArray.count];
    [array hi_addObjectsFromArray:otherArray];
    
    NSRange availableRange1 = [self availableRange:range];
    NSUInteger min1 = availableRange1.location;
    
    NSRange availableRange2 = [array availableRange:otherRange];
    NSUInteger min2 = availableRange2.location;
    
    if (min1 < self.count && min2 < array.count) {
        [self replaceObjectsInRange:availableRange1 withObjectsFromArray:array range:availableRange2];
    }
}

- (void)hi_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray {
    
    if (!otherArray) return;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:otherArray.count];
    [array hi_addObjectsFromArray:otherArray];
    
    NSRange availableRange = [self availableRange:range];
    NSUInteger min = availableRange.location;
    if (min < self.count) {
        [self replaceObjectsInRange:range withObjectsFromArray:array];
    }
}

@end

@implementation NSString (NSObject)

+ (nullable id)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary valueForKey:defaultName];
        if ([objc isKindOfClass:NSString.class]) return objc;
        return nil;
    }
    return objc;
}

+ (nullable id)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary objectForKey:defaultName];
        if ([objc isKindOfClass:NSString.class]) return objc;
        return nil;
    }
    return objc;
}

- (nonnull id)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary valueForKey:defaultName];
        if ([objc isKindOfClass:NSString.class]) return objc;
    }
    return self;
}

- (nonnull id)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName {
    id objc = nil;
    if ([dictionary isKindOfClass:NSDictionary.class]) {
        if (defaultName) objc = [dictionary objectForKey:defaultName];
        if ([objc isKindOfClass:NSString.class]) return objc;
    }
    return self;
}

+ (nullable id)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index {
    id objc = nil;
    if ([array isKindOfClass:NSArray.class]) {
        if (index < array.count) objc = [array objectAtIndex:index];
        if ([objc isKindOfClass:NSString.class]) return objc;
        return nil;
    }
    return objc;
}

- (nonnull id)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index {
    id objc = nil;
    if ([array isKindOfClass:NSArray.class]) {
        if (index < array.count) objc = [array objectAtIndex:index];
        if ([objc isKindOfClass:NSString.class]) return objc;
    }
    return self;
}

@end
