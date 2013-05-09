//
//  UserModel.h
//  Sani3ee
//
//  Created by Omneya on 4/25/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property(nonatomic) int user_id;
@property(nonatomic,retain) NSString *user_name;
@property(nonatomic,retain) NSString *user_mail;
@property(nonatomic,retain) UIImage *user_password;
@end
