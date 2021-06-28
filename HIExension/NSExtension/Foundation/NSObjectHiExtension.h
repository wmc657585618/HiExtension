//
//  NSObjectHiExtension.h
//  RouterDemo
//
//  Created by four on 2020/5/12.
//  Copyright © 2020 Four. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HiRuntime)

+ (void)hi_class_getInstanceMethod:(SEL)originalSelector newSelector:(SEL)newSelector;

/// 强制转换, 如果不是同类型 retern nil.
+ (instancetype)hi_convert:(id)object;

@end

@interface NSObject (HiProperty)

// 添加 property
- (void)hi_addCharPropertyForKey:(const void *)key value:(char)value;
- (void)hi_addUnsignedCharPropertyForKey:(const void *)key value:(unsigned char)value;
- (void)hi_addShortPropertyForKey:(const void *)key value:(short)value;
- (void)hi_addUnsignedShortPropertyForKey:(const void *)key value:(unsigned short)value;
- (void)hi_addIntPropertyForKey:(const void *)key value:(int)value;
- (void)hi_addUnsignedIntPropertyForKey:(const void *)key value:(unsigned int)value;
- (void)hi_addLongPropertyForKey:(const void *)key value:(long)value;
- (void)hi_addUnsignedLongPropertyForKey:(const void *)key value:(unsigned long)value;
- (void)hi_addLongLongPropertyForKey:(const void *)key value:(long long)value;
- (void)hi_addUnsignedLongLongPropertyForKey:(const void *)key value:(unsigned long long)value;

- (char)hi_charPropertyForKey:(const void *)key;
- (unsigned char)hi_unsignedCharPropertyForKey:(const void *)key;
- (short)hi_shortPropertyForKey:(const void *)key;
- (unsigned short)hi_unsignedShortPropertyForKey:(const void *)key;
- (int)hi_intPropertyForKey:(const void *)key;
- (unsigned int)hi_unsignedIntPropertyForKey:(const void *)key;
- (long)hi_longPropertyForKey:(const void *)key;
- (unsigned long)hi_unsignedLongPropertyForKey:(const void *)key;
- (long long)hi_longLongPropertyForKey:(const void *)key;
- (unsigned long long)hi_unsignedLongLongPropertyForKey:(const void *)key;
- (float)hi_floatPropertyForKey:(const void *)key;
- (double)hi_doublePropertyForKey:(const void *)key;
- (BOOL)hi_boolPropertyForKey:(const void *)ke;
- (NSInteger)hi_integerValuePropertyForKey:(const void *)key;
- (NSUInteger)hi_unsignedIntegerlPropertyForKey:(const void *)key;


- (void)hi_addFloatPropertyForKey:(const void *)key value:(float)value;

- (void)hi_addDoublePropertyForKey:(const void *)key value:(double)value;

- (void)hi_addBoolPropertyForKey:(const void *)key value:(BOOL)value;

- (void)hi_addIntegerValuePropertyForKey:(const void *)key value:(NSInteger)value;

- (void)hi_addUnsignedIntegerlPropertyForKey:(const void *)key value:(NSUInteger)value;

- (void)hi_addWeakPropertyForKey:(const void *)key value:(id _Nullable)value;

- (void)hi_addAssingPropertyForKey:(const void *)key value:(id _Nullable)value;

- (void)hi_addRetainNonatomicPropertyForKey:(const void *)key value:(id _Nullable)value;

- (void)hi_addCopyNonatomicPropertyForKey:(const void *)key value:(id _Nullable)value;

- (void)hi_addRetainPropertyForKey:(const void *)key value:(id _Nullable)value;

- (void)hi_addCopyPropertyForKey:(const void *)key value:(id _Nullable)value;

- (id)hi_getValueForKey:(const void *)key;

@end


@interface NSObject (HiObserver)

- (void)hi_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
- (void)hi_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;
- (void)hi_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(nullable void *)context;
- (void)hi_removeAllObserverForKeyPath:(NSString *)keyPath;
- (void)hi_removeAllObservers;

@end


@interface NSObject (NSDictionary)

+ (nullable instancetype)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName;

+ (nullable instancetype)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName;

/// if value is nil or not kind of self class . then reture self.
- (nonnull instancetype)hi_dictionary:(NSDictionary *)dictionary  valueKey:(NSString *)defaultName;

/// if object is nil or not kind of self class. then reture self.
- (nonnull instancetype)hi_dictionary:(NSDictionary *)dictionary  objectKey:(NSString *)defaultName;

- (void)hi_addToDictionary:(NSMutableDictionary *)dictionary key:(NSString *)defaultName;

@end

@interface NSObject (NSArray)

+ (nullable instancetype)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index;

/// if object is nil or not kind of self class. then reture self.
- (nonnull instancetype)hi_array:(NSArray *)array objectAtIndex:(NSUInteger)index;
- (void)hi_appendToArrary:(NSMutableArray *)array;

/// if over rang, then append object.
- (void)hi_insertArray:(NSMutableArray *)array index:(NSUInteger)index;

@end

@interface NSDictionary (HiCategory)

/// if value is NSNumber or NSString.
- (NSInteger)hi_integerForKey:(NSString *)defaultName;

- (float)hi_floatForKey:(NSString *)defaultName;

- (double)hi_doubleForKey:(NSString *)defaultName;

// Skips initial space characters (whitespaceSet), or optional -/+ sign followed by zeroes. Returns YES on encountering one of "Y", "y", "T", "t", or a digit 1-9. It ignores any trailing characters.
- (BOOL)hi_boolForKey:(NSString *)defaultName;

@end

@interface NSMutableDictionary (HiCategory)

- (void)hi_setInteger:(NSInteger)value forKey:(NSString *)defaultName;

- (void)hi_setFloat:(float)value forKey:(NSString *)defaultName;

- (void)hi_setDouble:(double)value forKey:(NSString *)defaultName;

- (void)hi_setBool:(BOOL)value forKey:(NSString *)defaultName;

@end

#pragma mark - array
@interface NSArray (HiCategory)

@property (nonatomic, assign, readonly) BOOL hasData;

/// if value is NSNumber or NSString.
- (NSInteger)hi_integerAtIndex:(NSUInteger)index;

- (float)hi_floatAtIndex:(NSUInteger)index;

- (double)hi_doubleAtIndex:(NSUInteger)index;

// Skips initial space characters (whitespaceSet), or optional -/+ sign followed by zeroes. Returns YES on encountering one of "Y", "y", "T", "t", or a digit 1-9. It ignores any trailing characters.
- (BOOL)hi_boolAtIndex:(NSUInteger)index;

@end

@interface NSMutableArray (HiCategory)

- (void)hi_addObject:(id)anObject;
- (void)hi_insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)hi_removeObjectAtIndex:(NSUInteger)index;
- (void)hi_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
- (void)hi_addObjectsFromArray:(NSArray *)otherArray;
- (void)hi_exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
- (void)hi_removeObject:(id)anObject inRange:(NSRange)range;
- (void)hi_removeObject:(id)anObject;
- (void)hi_removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
- (void)hi_removeObjectIdenticalTo:(id)anObject;
- (void)hi_removeObjectsInArray:(NSArray *)otherArray;
- (void)hi_removeObjectsInRange:(NSRange)range;
- (void)hi_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange;
- (void)hi_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray;

@end
NS_ASSUME_NONNULL_END
