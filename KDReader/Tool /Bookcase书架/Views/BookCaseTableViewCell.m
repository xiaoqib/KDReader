//
//  BookCaseTableViewCell.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/18.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "BookCaseTableViewCell.h"
#import "Macro.h"
#import "Masonry.h"

@implementation BookCaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addViews];
    }
    return self;
}

-(void)addViews{
    self.kImageView = [[UIImageView alloc]init];
    self.kImageView.backgroundColor = GrayColor;
    [self addSubview:self.kImageView];
    [self.kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(35/2);
        make.top.equalTo(self.mas_top).offset (35/2);
        make.bottom.equalTo(self.mas_bottom).offset (-35/2);
        make.width.equalTo(@(108/2));
    }];
    
    self.kTitleLabel = [[UILabel alloc]init];
    self.kTitleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.kTitleLabel];
    [self.kTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.kImageView.mas_right).offset (35/2);
        make.top.equalTo(self.kImageView.mas_top).offset (6);
    }];
    self.kTitleLabel.text = @"斗破苍穹";
    
    self.authorLabel = [[UILabel alloc]init];
    self.authorLabel.font = [UIFont systemFontOfSize:11];
    self.authorLabel.textColor = [UIColor grayColor];
    [self addSubview:self.authorLabel];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (self.kTitleLabel.mas_left);
        make.top.equalTo (self.kTitleLabel.mas_bottom).offset (35/2);
    }];
    self.authorLabel.text = @"作者：土豆";
    
    
    self.bottomLine = [[UIView alloc]init];
    self.bottomLine.backgroundColor = GrayColor;
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.kImageView.mas_left).offset(35/2);
        make.height.equalTo (@(0.5));
        make.right.equalTo (self.mas_right).offset(-35/2);
    }];
    
    
}

@end
