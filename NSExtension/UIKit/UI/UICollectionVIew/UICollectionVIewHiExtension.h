//
//  UICollectionVIewHiExtension.h
//  FourUITest
//
//  Created by four on 2021/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (HiExtension)

+ (instancetype)hi_collection:(UICollectionView *)colllectionView dequeueCellForIndexPath:(NSIndexPath *)indexPath;
+ (void)hi_collectionRegister:(UICollectionView *)collectionView;

@end

@interface UICollectionReusableView (HiExtension)

+ (instancetype)hi_collection:(UICollectionView *)collectionView dequeueViewOfKind:(NSString *)elementKind forIndexPath:(NSIndexPath *)indexPath;
+ (void)hi_collection:(UICollectionView *)collectionView registerViewOfKind:(NSString *)elementKind;

@end

NS_ASSUME_NONNULL_END
