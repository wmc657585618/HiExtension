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
    
//    [self.tableView hi_constraints_make:^(id<HiViewConstraintBuilder>  _Nonnull builder) {
//        builder.left.value(0);
//        builder.top.value(100);
//        builder.right.value(0);
//        builder.bottom.value(-20);
//    }];
    
    [self.tableView hi_frame_make:^(id<HiViewFrameBuilder> builder) {
        builder.left.value(0);
        builder.top.value(100);
        builder.right.value(0);
        builder.height.equal(self.tableView).width.multiplier(0.5).value(0);
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

//    [self.tableView hi_frame_make:^(id<HiViewFrameBuilder>  _Nonnull builder) {
//        builder.left.value(0);
//        builder.top.value(100);
//        builder.right.value(0);
//        builder.height.equal(self.tableView).width.multiplier(0.5).value(0);
//    }];

}

- (void)test {
    
    self.navigationItem.title = @"测试代码控制器";
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor greenColor];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view2];
        
    NSLayoutConstraint *LayoutConstraintCenterX = [self equallyRelatedConstraintWithView:view2 attribute:NSLayoutAttributeCenterX];
    NSLayoutConstraint *LayoutConstraintCenterY = [self equallyRelatedConstraintWithView:view2 attribute:NSLayoutAttributeCenterY];
    NSLayoutConstraint *LayoutConstraintWidth = [self equallyRelatedConstraintWithView:view2 attribute:NSLayoutAttributeWidth];
    NSLayoutConstraint *LayoutConstraintHeight = [self equallyRelatedConstraintWithView:view2 attribute:NSLayoutAttributeHeight];
    [self.view addConstraint:LayoutConstraintCenterX];
    [self.view addConstraint:LayoutConstraintCenterY];
    [self.view addConstraint:LayoutConstraintWidth];
    [self.view addConstraint:LayoutConstraintHeight];
}

///与视图同等相关的约束
- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TableViewCell hi_tableView:tableView dequeueCellForIndexPath:indexPath];
}

@end
