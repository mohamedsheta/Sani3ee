//
//  UIHelper.m
//  Sani3ee
//
//  Created by Omneya on 4/25/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "UIHelper.h"
#import "SVProgressHUD.h"
@implementation UIHelper
+(void)setDefualtUI:(UIViewController *)viewController{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    backgroundImage.frame = viewController.view.frame;
    [viewController.navigationController.navigationBar setTintColor:[UIColor orangeColor]];
    [viewController.view addSubview:backgroundImage];
    [viewController.view sendSubviewToBack:backgroundImage];
}
+(void)showProgressBar:(UIView *)view{
    [SVProgressHUD showInView:view];
}
+(void)dissmissProgressBar:(UIView *)view{
    [SVProgressHUD dismiss];
}
@end
