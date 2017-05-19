//
//  BookcaseViewController.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "BookcaseViewController.h"
#import "BookCaseTableViewCell.h"
#import "BookDetailedViewController.h"
@interface BookcaseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) UIButton *popButton ;

@end

@implementation BookcaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"书架";
    self.view.backgroundColor = GrayColor;
    
    self.dataArray = [NSMutableArray arrayWithCapacity:200];
    
    [self.dataArray addObject:@"1"];
    [self.dataArray addObject:@"2"];
    [self.dataArray addObject:@"3"];

    

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreen_Width, 10)];
    headerView.backgroundColor = GrayColor;
    [self.view addSubview:headerView];
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(self.view.mas_top);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 196/2;
    _tableView.separatorStyle = NO;  //取消分割线
 
    _tableView.backgroundColor = GrayColor;
    _tableView.tableHeaderView = headerView;
    
    _tableView.hidden = YES;
    
   _popButton = [[UIButton alloc]init];
    [_popButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    _popButton.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_popButton];
    [_popButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.equalTo(@(240/2));
        make.width.equalTo(@(240/2));
    }];
    _popButton.hidden = YES;
    [_popButton addTarget:self action:@selector(popSelectionVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self changeState];

    
}

//界面状态改变  当书架有书dataArray 不为空时 是table  当dataArray 为空 即显示按钮 跳转到精选

-(void)changeState {
    if (self.dataArray.count > 0) {
        _tableView.hidden = NO;
        _popButton.hidden = YES;
    }else {
        _tableView.hidden = YES;
        _popButton.hidden = NO;
    }
}

-(void)popSelectionVC {
    self.tabBarController.selectedIndex = 1;

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BookCaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"BookCaseTableViewCell"];
    if (!cell) {
        cell = [[BookCaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CardTableViewCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return  cell;
}

#pragma mark 点击cell delegate 跳转阅读页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这边 不跳图书详情页 应该直接跳阅读页面
    
    
}

#pragma mark 删除书 的操作
-(NSArray<UITableViewRowAction *>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
    title:@"移出书架" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            //点击之后的操作
        
            [self.dataArray removeObjectAtIndex:indexPath.row];
            [self.tableView beginUpdates];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView endUpdates];
        
             [self changeState];
        }];
  
    rowAction.backgroundColor = GrayColor;
    
    NSArray *arr = @[rowAction];
    
    return arr;
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
