//
//  Logger.h
//  Sani3ee
//
//  Created by Omneya on 5/4/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CraftModel.h"  
@interface Logger : NSObject
+(void)logRect:(CGRect)rect;
+(void)logNumber:(NSNumber *) number;
+(void)logInt:(int) number;
+(void)logString:(NSString *) str;


//Objects
+(void)logCraft:(CraftModel *) craft;
+(void)logWorker:(CraftModel *) craft;
@end
