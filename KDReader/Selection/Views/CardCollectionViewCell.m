//
//  CardCollectionViewCell.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/17.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "CardCollectionViewCell.h"
#import "Macro.h"
#import "Masonry.h"

@implementation CardCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self addViews];
        
    }
    return self;
}

-(void)addViews {
    
    self.bookImageView = [[UIImageView alloc]init];
    self.bookImageView.backgroundColor = GrayColor;
    [self.contentView addSubview:self.bookImageView];
    [self.bookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(169/2));
    }];
    
    self.bookTitleLabel = [[UILabel alloc]init];
    self.bookTitleLabel.textAlignment = NSTextAlignmentLeft;
    self.bookTitleLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.bookTitleLabel];
    [self.bookTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.bookImageView.mas_width);
        make.left.equalTo(self.bookImageView.mas_left);
        make.top.equalTo(self.bookImageView.mas_bottom).offset(10);
    }];
    
    self.bookTitleLabel.text = @"测试书名";
}

@end
