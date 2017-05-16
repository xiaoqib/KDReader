//
//  SelectionViewController.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "SelectionViewController.h"
#import "SDCycleScrollView.h"
#import "CardTableViewCell.h"
@interface SelectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"精选";
    [self addViews];

}

-(void)addViews {
    
    NSArray * array = @[@"1",@"2",@"3",@"4"];
    
    //创建轮播图，先不放网络图片
    SDCycleScrollView * cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64,  KScreen_Width, 320/2 ) imageNamesGroup:array];
    cycleScrollView.backgroundColor = [UIColor whiteColor];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [self.view addSubview:cycleScrollView];
    
    //创建tabel 把轮播设置成table.header
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    
    self.tableView.tableHeaderView = cycleScrollView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 860/2;
    _tableView.separatorStyle = NO;  //取消分割线
    _tableView.backgroundColor = GrayColor;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return  1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CardTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CardTableViewCell"];
    if (!cell) {
        cell = [[CardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardTableViewCell"];
    }
    cell.titleLabel.text = @"排行榜";
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
