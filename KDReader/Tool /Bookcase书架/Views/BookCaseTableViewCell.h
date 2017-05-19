//
//  BookCaseTableViewCell.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/18.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCaseTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *kImageView;
@property (nonatomic,strong) UILabel *kTitleLabel;
@property (nonatomic,strong) UILabel *authorLabel;

@property (nonatomic,strong) UIView *bottomLine;

@end
