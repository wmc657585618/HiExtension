//
//  UICollectionVIewHiExtension.m
//  FourUITest
//
//  Created by four on 2021/6/28.
//

#import "UICollectionVIewHiExtension.h"
#import "UIViewHiExtension.h"

@implementation UICollectionViewCell (HiExtension)

+ (instancetype)hi_collection:(UICollectionView *)colllectionView dequeueCellForIndexPath:(NSIndexPath *)indexPath {
    return [colllectionView dequeueReusableCellWithReuseIdentifier:self.hi_classString forIndexPath:indexPath];
}

+ (void)hi_collectionRegister:(UICollectionView *)collectionView {
    [collectionView registerClass:self forCellWithReuseIdentifier:self.hi_classString];
}

@end

@implementation UICollectionReusableView (HiExtension)

+ (instancetype)hi_collection:(UICollectionView *)collectionView dequeueViewOfKind:(NSString *)elementKind forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:self.hi_classString forIndexPath:indexPath];
}

+ (void)hi_collection:(UICollectionView *)collectionView registerViewOfKind:(NSString *)elementKind {
    [collectionView registerClass:self forSupplementaryViewOfKind:elementKind withReuseIdentifier:self.hi_classString];
}

@end
