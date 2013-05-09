//
//  UserWorkerModel.h
//  Sani3ee
//
//  Created by Omneya on 4/25/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserWorkerModel : NSObject
@property(nonatomic) int user_id;
@property(nonatomic) int worker_id;
@property(nonatomic,retain) NSString *user_review;
@property(nonatomic,retain) NSString *user_rate;
@property(nonatomic,retain) NSString *user_isMyList;
@end
