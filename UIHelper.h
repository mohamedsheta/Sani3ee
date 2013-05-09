//
//  UIHelper.h
//  Sani3ee
//
//  Created by Omneya on 4/25/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHelper : NSObject
+(void)setDefualtUI:(UIViewController *)viewController;
+(void)showProgressBar:(UIView *)view;
+(void)dissmissProgressBar:(UIView *)view;
@end
