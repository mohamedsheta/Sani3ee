//
//  WorkerDetailsCustomCell.m
//  Sani3ee
//
//  Created by Omneya on 4/25/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "WorkerDetailsCustomCell.h"

@interface WorkerDetailsCustomCell ()

@end

@implementation WorkerDetailsCustomCell
@synthesize keyLbl,valueLbl;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
