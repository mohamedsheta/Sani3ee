//
//  clientManger.m
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "ClientManger.h"
#import "BackendStatic.h"
#import "BackendWS.h"
@implementation ClientManger

+(id<Backend>)createInstance{
    id<Backend> backend ;
    if (KBackendType == KBackendSTATIC) {
           backend = [BackendStatic new];
    }else{
           backend = [BackendWS new];

    }
    return backend;
}

@end
