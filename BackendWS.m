//
//  BackendWS.m
//  Sani3ee
//
//  Created by Omneya on 5/3/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "BackendWS.h"

@implementation BackendWS
-(NSArray *)getAllCrafts{
    NSIndexSet *statusCodeSet = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[CraftModel class]];
    [mapping addAttributeMappingsFromDictionary:@{
     @"id" : @"craft_id",
     @"name" : @"craft_name"
     }];
    
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:nil keyPath:@"" statusCodes:statusCodeSet];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://ec2-54-214-123-86.us-west-2.compute.amazonaws.com:8080/sani3ee/crafts/"
                                       ]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request                 responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        NSLog(@"Response: %@", operation.HTTPRequestOperation.responseString);
        CraftModel *craft = (CraftModel *)[[mappingResult array] objectAtIndex:0];
        NSLog(@"Not ERROR: %@",craft.craft_name);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"ERROR: %@", error);
        NSLog(@"Response: %@", operation.HTTPRequestOperation.responseString);
    }];
    
    [operation start];

}
-(NSArray *)getWorkersByCraftId:(CraftModel *)craft{

}
-(NSArray *)getAllOffers{

}
-(NSArray *)getMyList{

}
@end
