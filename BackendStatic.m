//
//  BackendStatic.m
//  Sani3ee
//
//  Created by Omneya on 5/3/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "BackendStatic.h"
#import "OfferModel.h"
#import "UserWorkerModel.h"
@implementation BackendStatic
-(NSArray *)getAllCrafts{
    NSMutableArray *crafts = [NSMutableArray new];
    
    
    CraftModel *craft = [CraftModel new];
    [craft setCraft_id:1];
    [craft setCraft_image_url:@"carpenter_icon.png"];
    [craft setCraft_name:@"Nagar"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:2];
    [craft setCraft_image_url:@"chaser_icon.png"];
    [craft setCraft_name:@"Mabeed"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:3];
    [craft setCraft_image_url:@"cleaner_icon.png"];
    [craft setCraft_name:@"Cleaner"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:4];
    [craft setCraft_image_url:@"court_icon.png"];
    [craft setCraft_name:@"court"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:5];
    [craft setCraft_image_url:@"dressmaker_icon.png"];
    [craft setCraft_name:@"dressmaker"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:6];
    [craft setCraft_image_url:@"electric_icon.png"];
    [craft setCraft_name:@"electric"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:7];
    [craft setCraft_image_url:@"mechanistic_icon.png"];
    [craft setCraft_name:@"mechanistic"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:8];
    [craft setCraft_image_url:@"plumber_icon.png"];
    [craft setCraft_name:@"court"];
    [crafts addObject:craft];
    
    craft = [CraftModel new];
    [craft setCraft_id:9];
    [craft setCraft_image_url:@"workers_icon.png"];
    [craft setCraft_name:@"workers"];
    [crafts addObject:craft];
    
    for (int i =10; i < 20; i++) {
        CraftModel *craft = [CraftModel new];
        [craft setCraft_id:i];
        [craft setCraft_image_url:@"workers_icon.png"];
        [craft setCraft_name:@"craft"];
        [crafts addObject:craft];
    }
    return crafts;
}
-(NSArray *)getWorkersByCraftId:(CraftModel *)craft {
    NSMutableArray *workers = [NSMutableArray new];
    
    for (int i =16; i < 26; i++) {
        WorkerModel *worker = [WorkerModel new];
        [worker setWorker_id:i];
        [worker setCraft_id:i];
        [worker setWorker_image_url:@"first.png"];
        [worker setWorker_name:@"Mohame"];
        [worker setWorker_phone:@"01001824992"];
        [worker setWorker_zone:@"NasrCity"];
        [worker setWorker_minimumPrice:@"20 LE"];
        [worker setTotalRate:5];
        NSMutableArray *reviews = [NSMutableArray new];
        for (int j = 1 ; j < 18; j++) {
            UserWorkerModel *review = [UserWorkerModel new];
            [review setUser_review:@"Good worker.......!"];
            [reviews addObject:review];
            
        }
        [worker setWorker_reviews:reviews];
        [workers addObject:worker];
    }
    return workers;
}

-(NSArray *)getAllOffers {
    NSMutableArray *offers = [NSMutableArray new];
    
    for (int i =0; i < 30; i++) {
        OfferModel *offer = [OfferModel new];
        [offer setOffer_id:1];
        [offer setOffer_image_url:@"first.png"];
        [offer setOffer_title:@"Sale"];
        [offer setOffer_text:@"discount 10  %"];
        [offers addObject:offer];
    }
    return offers;
}

-(NSArray *)getMyList {
    NSMutableArray *workers = [NSMutableArray new];
    
    for (int i =0; i < 30; i++) {
        WorkerModel *worker = [WorkerModel new];
        [worker setWorker_id:1];
        [worker setCraft_id:1];
        [worker setWorker_image_url:@"first.png"];
        [worker setWorker_name:@"Mohame"];
        [worker setWorker_phone:@"01001824992"];
        [worker setWorker_zone:@"NasrCity"];
        [workers addObject:worker];
    }
    return workers;
}

@end
