//
//  UITableViewHiExtension.m
//  FourUITest
//
//  Created by four on 2021/6/28.
//

#import "UITableViewHiExtension.h"
#import "UIViewHiExtension.h"

@implementation UITableViewCell (HiExtension)

+ (instancetype)hi_tableViewDequeueCell:(UITableView *)tableView {
    return [tableView dequeueReusableCellWithIdentifier:self.hi_classString];
}

+ (instancetype)hi_tableView:(UITableView *)tableView dequeueCellForIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:self.hi_classString forIndexPath:indexPath];
}

+ (void)hi_tableViewRegister:(UITableView *)tableView {
    [tableView registerClass:self forCellReuseIdentifier:self.hi_classString];
}

@end

@implementation UITableViewHeaderFooterView (HiExtension)

+ (instancetype)hi_tableViewDequeueView:(UITableView *)tableView {
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.hi_classString];
    if (!view) view = [[self alloc] initWithReuseIdentifier:self.hi_classString];
    return view;
}

+ (void)hi_tableViewRegister:(UITableView *)tableView {
    [tableView registerClass:self forHeaderFooterViewReuseIdentifier:self.hi_classString];
}

@end
