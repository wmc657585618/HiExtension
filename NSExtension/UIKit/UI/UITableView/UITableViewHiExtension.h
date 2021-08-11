//
//  UITableViewHiExtension.h
//  FourUITest
//
//  Created by four on 2021/6/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (HiExtension)

+ (instancetype)hi_tableViewDequeueCell:(UITableView *)tableView;
+ (instancetype)hi_tableView:(UITableView *)tableView dequeueCellForIndexPath:(NSIndexPath *)indexPath;
+ (void)hi_tableViewRegister:(UITableView *)tableView;

@end

@interface UITableViewHeaderFooterView (HiExtension)

+ (instancetype)hi_tableViewDequeueView:(UITableView *)tableView;
+ (void)hi_tableViewRegister:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
