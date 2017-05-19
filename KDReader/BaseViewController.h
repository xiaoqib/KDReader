//
//  BaseViewController.h
//  KDReader
//
//  Created by 陳升琪 on 2017/5/16.
//  Copyright © 2017年 陳升琪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"


@interface BaseViewController : UIViewController

@property (nonatomic,strong) UIButton *leftButton;
@property (nonatomic,strong) UIButton *rightButton;


//显示提示
-(void)showMBProgressHUDWithText:(NSString *)text;

//隐藏右边按钮
-(void)hiderigtButton;


@end
