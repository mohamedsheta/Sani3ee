//
//  clientManger.h
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CraftModel.h"
#import "WorkerModel.h"
#import "OfferModel.h"
@protocol Backend
@required
-(NSArray *)getAllCrafts;
-(NSArray *)getWorkersByCraftId:(CraftModel *)craft;
-(NSArray *)getAllOffers;
-(NSArray *)getMyList;
@end
@interface ClientManger : NSObject
+(id<Backend>)createInstance;
@end
