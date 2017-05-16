//
//  CardTableViewCell.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "CardTableViewCell.h"
#import "Masonry.h"
#import "Macro.h"

@implementation CardTableViewCell 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addViews];
    }
    return self;
}

-(void)addViews{
    
    UIView *grayView = [[UIView alloc]init];
    grayView.backgroundColor = GrayColor;
    [self addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(20/2));
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(grayView.mas_bottom).offset(60/2);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    UIImageView *arrowImageLeft = [[UIImageView alloc]init];
    arrowImageLeft.image = [UIImage imageNamed:@""];
    arrowImageLeft.backgroundColor = [UIColor blackColor];
    
    [self addSubview:arrowImageLeft];
    [arrowImageLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_left).offset(-7);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.height.equalTo(@(5));
        make.width.equalTo(@(5));
    }];
    
    UIView *lineViewLeft = [[UIView alloc]init];
    lineViewLeft.backgroundColor = GrayColor;
    [self addSubview:lineViewLeft];
    [lineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(arrowImageLeft.mas_left);
        make.height.equalTo(@(0.5));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
    }];
    
    
    UIImageView *arrowImageRight = [[UIImageView alloc]init];
    arrowImageRight.image = [UIImage imageNamed:@""];
    arrowImageRight.backgroundColor = [UIColor blackColor];
    [self addSubview:arrowImageRight];
    [arrowImageRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.left.equalTo(self.titleLabel.mas_right).offset(7);
        make.height.equalTo(@(5));
        make.width.equalTo(@(5));
    }];
    
    UIView * lineViewRight = [[UIView alloc]init];
    lineViewRight.backgroundColor = GrayColor;
    [self addSubview:lineViewRight];
    [lineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(arrowImageRight.mas_right);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.equalTo(@(0.5));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
    }];
    
    
    UIView *lineViewBottom = [[UIView alloc]init];
    lineViewBottom.backgroundColor = GrayColor;
    [self addSubview:lineViewBottom];
    [lineViewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-90/2);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(0.5));
    }];
    
    
    UIButton *bottomButton = [[UIButton alloc]init];
    bottomButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomButton];
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(lineViewBottom.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    UILabel *buttonLabel = [[UILabel alloc]init];
    buttonLabel.font = [UIFont systemFontOfSize:11];
    buttonLabel.textColor = [UIColor grayColor];
    buttonLabel.text = @"更多";
    [bottomButton addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomButton.mas_centerY);
        make.centerX.equalTo(bottomButton.mas_centerX);
    }];
    
    self.collectionView = [[UICollectionView alloc]init];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}





@end
