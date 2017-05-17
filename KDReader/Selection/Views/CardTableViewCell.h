//
//  CardTableViewCell.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectItemDelegate <NSObject>

- (void)didSelectItemNumOfCollectionViewWith:(int)num;

@end

@interface CardTableViewCell : UITableViewCell



@property (nonatomic,strong) NSArray *imageArray;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *bottomButton;

@property (nonatomic,assign) int collectionViewNum;

@property(nonatomic, weak)id<SelectItemDelegate>delegate;

@end
