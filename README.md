# HiExtension
- HiExtension 是对 UIKit 和 NSFoundation 做了一些简化.
- 分为 UIKit 和 NSFoundation 两个目录.

## NSFoundation
- 对 NSObject 做了些简化. 如: Runtime 添加 property Observer.
- 对 array 和 dictionary 常用的API做了容错. 如: 越界 类型校检.

## UIKit
### Layout
- 对布局做了简化. 如: CGRect 和 NSAutoLayout

### UI
- 对常用 UI 控件做了简化. 如: UIView UIButton UICollectionView相关 UITableView相关等.

### View
- 一些可能会用到的控件.

# 常用用法:
## NSObject
```
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
```
### 举例
```     
[@"" hi_dictionary:dictionary valueKey:key]; 
[@"" hi_insertArray:array index:index];

[@"" hi_addToDictionary:dictionary valueKey:key]; 
[@"" hi_insertArray:array index:index];
```
- NSString 是类族, 已经重写了相应的方法. 其它类族应用类方法然后自己判断.

## Layout
```
- (void)hi_constraints_make:(void(^)(id<HiViewConstraintBuilder> builder))block;
- (void)hi_frame_make:(void(^)(id<HiViewFrameBuilder> builder))block;
```
### 举例
```
    [view hi_frame_make:^(id<HiViewFrameBuilder>  _Nonnull builder) {
        builder.left.value(0);
        builder.top.value(100);
        builder.right.value(0);
        builder.bottom.value(-20);
    }];
```

- `hi_frame_make` 是CGRect, `hi_constraints_make` 是 AutoLayout. 两者用法相似.

## 其它
- 多数是对官方API做了简化. 具体可以看相应的API. 不再举例了.
