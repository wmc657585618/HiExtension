//
//  ViewController.m
//  HIExension
//
//  Created by four on 2021/6/28.
//

#import "ViewController.h"
#import "HiNSExtension.h"
#import "UIViewHiSizeClassProperty.h"

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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        [TableViewCell hi_tableViewRegister:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"afadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfasafadsfdsfasdfas";
        _label.numberOfLines = 2;
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.label];

    [self.tableView hi_constraints_make:^(id<HiViewConstraintBuilder> builder) {
        builder.left.value(0.0);
        builder.top.value(100.0);
        builder.right.value(0.0);
        builder.height.equal(self.tableView).width.multiplier(0.5).value(0);
    }];
    
    [self.label hi_constraints_make:^(id<HiViewConstraintBuilder> builder) {
        builder.left.value(0);
        builder.top.value(100.0);
        builder.height.autoValue();
        builder.right.value(0);
    }];
    
    [self.label hi_property_cr_make:^{
        self.label.backgroundColor = UIColor.redColor;
    }];
    
    [self.label hi_property_cc_make:^{
        self.label.backgroundColor = UIColor.brownColor;
    }];
//    [self.label hi_constraints_cr_make:^(id<HiViewConstraintBuilder>  _Nullable builder) {
//        builder.left.value(0);
//        builder.top.equal(self.tableView).bottom.value(10.0);
//        builder.height.autoValue();
//        builder.right.value(0);
//    }];
    
//    [self.label hi_constraints_cc_make:^(id<HiViewConstraintBuilder>  _Nullable builder) {
//        builder.left.value(0);
//        builder.top.value(10.0);
//        builder.height.autoValue();
//        builder.right.value(0);
//    }];
    
//    [self.label hi_constraints_ac_make:^(id<HiViewConstraintBuilder>  _Nullable builder) {
//        builder.left.value(0);
//        builder.top.value(10.0);
//        builder.height.autoValue();
//        builder.right.value(0);
//    }];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self animations];
}
#pragma mark *********** update ***********
- (void)update {
    
//    [self.navigationController pushViewController:[[ViewController alloc] init] animated:true];
//    [self.label hi_updateAttribute:NSLayoutAttributeTop constraint:200];
    
    [self.label hi_resetTop:^(id<HiConstraintVertical0>  _Nullable constraint) {
        constraint.equal(self.view).value(100.0);
    }];
}

#pragma mark *********** animate ***********
- (void)animations {
    [self.label hi_animateWithDuration:10 animations:^{
        [self.label hi_updateAttribute:NSLayoutAttributeTop constraint:200.0];
    } completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TableViewCell hi_tableView:tableView dequeueCellForIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[[ViewController alloc] init] animated:true];
}

- (void)dealloc {
    NSLog(@"dealloc");
}

@end
