//
//  CardTableViewCell.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewCell : UITableViewCell <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSArray *imageArray;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UICollectionView *collectionView;

@end
