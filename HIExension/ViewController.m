//
//  ViewController.m
//  HIExension
//
//  Created by four on 2021/6/28.
//

#import "ViewController.h"
#import "HiNSExtension.h"

@interface TableViewCell : UITableViewCell

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.text = @"TableViewCell";
    }
    return self;
}
@end

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        [TableViewCell hi_tableViewRegister:_tableView];
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView hi_constraints_make:^(id<HiViewConstraintBuilder>  _Nonnull builder) {
        builder.left.value(0);
        builder.top.value(100);
        builder.right.value(0);
        builder.bottom.value(-20);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//
//    [self.tableView hi_frame_make:^(id<HiViewFrameBuilder>  _Nonnull builder) {
//        builder.left.value(0);
//        builder.top.value(100);
//        builder.right.value(0);
//        builder.bottom.value(-20);
//    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TableViewCell hi_tableView:tableView dequeueCellForIndexPath:indexPath];
}

@end
