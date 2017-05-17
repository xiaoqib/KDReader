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
#import "CardCollectionViewCell.h"
#import "BookDetailedViewController.h"

@interface CardTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@end

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
    
    
     _bottomButton = [[UIButton alloc]init];
    _bottomButton.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bottomButton];
    [_bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(lineViewBottom.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    UILabel *buttonLabel = [[UILabel alloc]init];
    buttonLabel.font = [UIFont systemFontOfSize:11];
    buttonLabel.textColor = [UIColor grayColor];
    buttonLabel.text = @"更多";
    [_bottomButton addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bottomButton.mas_centerY);
        make.centerX.equalTo(_bottomButton.mas_centerX);
    }];
    
    //初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
     [self.collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:@"CardCollectionViewCell"];
    
    [self addSubview:self.collectionView];
    
     [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineViewLeft.mas_bottom).offset(30);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(lineViewBottom.mas_top).offset(-22);
    }]; 
     
    self.collectionView.scrollEnabled = NO;

    self.collectionView.backgroundColor = [UIColor whiteColor];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CardCollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCollectionViewCell" forIndexPath:indexPath];
    
    return  cell1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(169/2, 300/2);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return  0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.delegate didSelectItemNumOfCollectionViewWith:(int)indexPath.row];
    
}



@end
