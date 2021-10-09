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

+ (instancetype)hi_collection:(UICollectionView *)collectionView dequeueHeaderForIndexPath:(NSIndexPath *)indexPath;
+ (instancetype)hi_collection:(UICollectionView *)collectionView dequeueFooterForIndexPath:(NSIndexPath *)indexPath;

+ (void)hi_collectionRegisteHeader:(UICollectionView *)collectionView;
+ (void)hi_collectionRegisteFooter:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
