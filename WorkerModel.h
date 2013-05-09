//
//  Worker.h
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkerModel : NSObject
@property(nonatomic) int worker_id;
@property(nonatomic) int craft_id;
@property(nonatomic,retain) NSString *worker_name;
@property(nonatomic,retain) NSString *worker_password;
@property(nonatomic,retain) NSString *worker_mail;
@property(nonatomic,retain) NSString *worker_minimumPrice;
@property(nonatomic,retain) NSString *worker_phone;
@property(nonatomic,retain) NSString *worker_zone;
@property(nonatomic,retain) NSMutableArray *worker_reviews;
@property(nonatomic,retain) NSString *worker_image_url;
@property(nonatomic,retain) UIImage *worker_image;
@property(nonatomic) int totalRate;
@end
