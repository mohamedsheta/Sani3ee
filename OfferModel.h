//
//  Offer.h
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OfferModel : NSObject
@property(nonatomic) int offer_id;
@property(nonatomic,retain) NSString *offer_title;
@property(nonatomic,retain) NSString *offer_text;
@property(nonatomic,retain) NSString *offer_value;
@property(nonatomic,retain) NSString *offer_image_url;
@property(nonatomic,retain) UIImage *offer_image;
@end
