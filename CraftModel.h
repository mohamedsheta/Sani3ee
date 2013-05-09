//
//  Craft.h
//  Sani3ee
//
//  Created by Sheta on 4/7/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
@interface CraftModel : NSObject
@property(nonatomic) int craft_id;
@property(nonatomic,retain) NSString *craft_name;
@property(nonatomic,retain) NSString *craft_image_url;
@property(nonatomic,retain) UIImage *craft_image;
@end
