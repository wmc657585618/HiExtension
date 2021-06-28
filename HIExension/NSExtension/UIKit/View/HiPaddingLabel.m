//
//  HiPaddingLabel.m
//  ZYBScanSearch
//
//  Created by four on 2021/5/22.
//  Copyright © 2021 zuoyebang. All rights reserved.
//

#import "HiPaddingLabel.h"

@implementation HiPaddingLabel

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    if (size.width > 0)size.width += self.padding;
    return size;
}

@end
