//
//  BookListViewController.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/17.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "BookListViewController.h"
#import "BookListTableViewCell.h"

@interface BookListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.vcTitle;
    self.view.backgroundColor = [UIColor whiteColor];
    [self addViews];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 166;
    _tableView.separatorStyle = NO;  //取消分割线
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BookListTableViewCell"];
    if (!cell) {
        cell = [[BookListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BookListTableViewCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return  cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
