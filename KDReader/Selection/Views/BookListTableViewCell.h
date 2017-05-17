//
//  BookListTableViewCell.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/17.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

//书列表的CELL

#import <UIKit/UIKit.h>

@interface BookListTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *coverImageView;
@property (nonatomic,strong) UILabel *bookTitleLabel;
@property (nonatomic,strong) UILabel *authorLabel;
@property (nonatomic,strong) UILabel *aboutBookLabel;

@end
