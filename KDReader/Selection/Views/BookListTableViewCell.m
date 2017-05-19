//
//  BookListTableViewCell.m
//  KDReader
//
//  Created by 陳升琪 on 2017/5/17.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import "BookListTableViewCell.h"
#import "Macro.h"
#import "Masonry.h"

@implementation BookListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addViews];
    }
    return self;
}

-(void)addViews{
    self.coverImageView = [[UIImageView alloc]init];
    self.coverImageView.backgroundColor = GrayColor;
    [self addSubview: self.coverImageView];
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (self.mas_left).offset (35/2);
        make.top.equalTo (self.mas_top).offset (35/2);
        make.bottom.equalTo (self.mas_bottom).offset (-35/2);
        make.width.equalTo (@(212/2));
    }];
    
    self.bookTitleLabel = [[UILabel alloc]init];
    self.bookTitleLabel.text = @"斗破苍穹";
    self.bookTitleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview: self.bookTitleLabel];
    [self.bookTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (self.coverImageView.mas_right).offset (35/2);
        make.top.equalTo (self.mas_top).offset (35/2);
        make.height.equalTo(@(34/2));
    }];
    
    self.authorLabel = [[UILabel alloc]init];
    self.authorLabel.font = [UIFont systemFontOfSize:13];
    self.authorLabel.textColor = [UIColor grayColor];
    [self addSubview:self.authorLabel];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bookTitleLabel.mas_bottom).offset(35/2);
        make.left.equalTo(self.bookTitleLabel.mas_left);
        make.height.equalTo(@(27/2));

    }];
    self.authorLabel.text = @"天蚕土豆";
    
    self.aboutBookLabel = [[UILabel alloc]init];
    self.aboutBookLabel.textColor = [UIColor grayColor];
    self.aboutBookLabel.font = [UIFont systemFontOfSize:13];
 //   [self.aboutBookLabel sizeToFit];
    [self addSubview:self.aboutBookLabel];
    [self.aboutBookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.authorLabel.mas_left);
        make.right.equalTo(self.mas_right).offset(-35/2);
        make.top.equalTo(self.authorLabel.mas_bottom).offset(35/2);
        make.bottom.equalTo(self.mas_bottom).offset(-35/2);
    }];
    
    self.aboutBookLabel.text  = @"何天拿到了一枚中『国』龙徽章！这是龙魂的标志。为了这个，何天努力了足足十七年从两岁开始，一直到现在。从一个小兵，到现在的兵王。更是进入龙";
    self.aboutBookLabel.numberOfLines = 0;
}

@end
