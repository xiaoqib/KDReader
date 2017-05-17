//
//  BookDetailedViewController.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/17.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "BookDetailedViewController.h"

@interface BookDetailedViewController ()

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *addBookCaseButton; //放入书架按钮
@property (nonatomic,strong) UIButton *readBookButton;//阅读书架按钮
@property (nonatomic,strong) UIButton *downloadButton; //全本缓存

@property (nonatomic,strong) UIImageView *coverImageView; //封面图片

@property (nonatomic,strong) UILabel *titleLabel; //书名

@property (nonatomic,strong) UILabel *authorLabel; //作者

@property (nonatomic,strong) UILabel *categoryLabel;//分类

@property (nonatomic,strong) UITextView *textView; //内容简介

@end

@implementation BookDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"书籍封面";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addViews];
}

-(void)addViews {
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreen_Width, 830/2)];
    headView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headView];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = GrayColor;
    [headView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left);
        make.right.equalTo(headView.mas_right);
        make.height.equalTo(@(0.5));
        make.top.equalTo(headView.mas_top).offset(440/2);
    }];
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.tableView.tableHeaderView = headView;
    _tableView.separatorStyle = NO;  //取消分割线
    _tableView.backgroundColor = GrayColor;

    
    float buttonW =  (KScreen_Width - (4  * 35/2))/3;
    
    self.addBookCaseButton =  [UIButton buttonWithType:UIButtonTypeSystem];
    //self.addBookCaseButton.backgroundColor = [UIColor whiteColor];
    [self.addBookCaseButton setTintColor:[UIColor grayColor]];
    [headView addSubview:self.addBookCaseButton];
    [self.addBookCaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo (lineView.mas_top).offset(-35/2);
        make.left.equalTo(headView.mas_left).offset(35/2);
        make.width.equalTo(@(buttonW));
        make.height.equalTo(@(66/2));
    }];
    
    self.addBookCaseButton.layer.masksToBounds = YES;
    self.addBookCaseButton.layer.cornerRadius = 4;
    self.addBookCaseButton.layer.borderWidth = 0.8;
    
    
    UILabel *buttonTitleLabel1 = [[UILabel alloc]init];
    buttonTitleLabel1.font = [UIFont systemFontOfSize:11];
    buttonTitleLabel1.textColor = [UIColor grayColor];
    buttonTitleLabel1.text = @"放入书架";
    [self.addBookCaseButton addSubview:buttonTitleLabel1];
    [buttonTitleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.addBookCaseButton.mas_centerX);
        make.centerY.equalTo(self.addBookCaseButton.mas_centerY);
    }];
    
    
    
    self.readBookButton = [[UIButton alloc]init];
    [self.readBookButton setTintColor:[UIColor grayColor]];
    [headView addSubview:self.readBookButton];
    [self.readBookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.addBookCaseButton.mas_bottom);
        make.left.equalTo(self.addBookCaseButton.mas_right).offset(35/2);
        make.width.equalTo(@(buttonW));
        make.height.equalTo(@(66/2));
    }];
    
    self.readBookButton.layer.masksToBounds = YES;
    self.readBookButton.layer.cornerRadius = 4;
    self.readBookButton.layer.borderWidth = 0.8;
    
    UILabel *buttonTitleLabel2 = [[UILabel alloc]init];
    buttonTitleLabel2.font = [UIFont systemFontOfSize:11];
    buttonTitleLabel2.textColor = [UIColor grayColor];
    buttonTitleLabel2.text = @"立刻阅读";
    [self.readBookButton addSubview:buttonTitleLabel2];
    [buttonTitleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.readBookButton.mas_centerX);
        make.centerY.equalTo(self.readBookButton.mas_centerY);
    }];
    
    self.downloadButton = [[UIButton alloc]init];
    [self.downloadButton setTintColor:[UIColor grayColor]];
    [headView addSubview:self.downloadButton];
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.readBookButton.mas_bottom);
        make.right.equalTo(headView.mas_right).offset(-35/2);
        make.width.equalTo(@(buttonW));
        make.height.equalTo(@(66/2));
    }];
    
    self.downloadButton.layer.masksToBounds = YES;
    self.downloadButton.layer.cornerRadius = 4;
    self.downloadButton.layer.borderWidth = 0.8;
    
    UILabel *buttonTitleLabel3 = [[UILabel alloc]init];
    buttonTitleLabel3.font = [UIFont systemFontOfSize:11];
    buttonTitleLabel3.textColor = [UIColor grayColor];
    buttonTitleLabel3.text = @"全本缓存";
    [self.downloadButton addSubview:buttonTitleLabel3];
    [buttonTitleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.downloadButton.mas_centerX);
        make.centerY.equalTo(self.downloadButton.mas_centerY);
    }];
    
    
    //封面图
    self.coverImageView = [[UIImageView alloc]init];
    self.coverImageView.backgroundColor = GrayColor;
    [headView addSubview:self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (headView.mas_left).offset(35/2);
        make.top.equalTo (headView.mas_top).offset(35/2);
        make.bottom.equalTo(_addBookCaseButton.mas_top).offset(-35/2);
        make.width.equalTo(@(104));
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.text = @"书名";
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [headView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageView.mas_right).offset (35/2);
        make.top.equalTo(self.coverImageView.mas_top);
    }];
    
    self.authorLabel = [[UILabel alloc]init];
    self.authorLabel.font = [UIFont systemFontOfSize:13];
    self.authorLabel.textColor = [UIColor grayColor];
    self.authorLabel.text = @"作者：陳陳陳";
    [headView addSubview:self.authorLabel];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(70/2);
    }];
    
    self.categoryLabel = [[UILabel alloc]init];
    self.categoryLabel.font = [UIFont systemFontOfSize:13];
    self.categoryLabel.textColor = [UIColor grayColor];
    self.categoryLabel.text = @"分类：都市言情";
    [headView addSubview:self.categoryLabel];
    [self.categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.authorLabel.mas_bottom).offset(35/2);
    }];
    
    UILabel *aboutBooKLabel = [[UILabel alloc]init];
    aboutBooKLabel.font = [UIFont systemFontOfSize:13];
    aboutBooKLabel.textColor = [UIColor grayColor];
    aboutBooKLabel.text = @"内容简介";
    [headView addSubview:aboutBooKLabel];
    [aboutBooKLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (headView.mas_left).offset(35/2);
        make.top.equalTo (lineView.mas_bottom).offset (35/2);
    }];
    
    self.textView = [[UITextView alloc]init];
    self.textView.font = [UIFont systemFontOfSize:13];
    [headView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left).offset (35/2);
        make.top.equalTo(aboutBooKLabel.mas_bottom).offset(35/2);
        make.right.equalTo(headView.mas_right).offset(-35/2);
        make.bottom.equalTo(headView.mas_bottom).offset(-35/2);
    }];
    
    self.textView .text = @"何天拿到了一枚中『国』龙徽章！这是龙魂的标志。为了这个，何天努力了足足十七年。从两岁开始，一直到现在。从一个小兵，到现在的兵王。更是进入龙";
    
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
