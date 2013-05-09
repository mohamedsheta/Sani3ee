//
//  Search.m
//  Sani3ee
//
//  Created by Sheta on 4/7/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "SearchView.h"

@interface SearchView (){
    bool isOpened;
}

@end

@implementation SearchView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
          [self setTitle:NSLocalizedString(@"Search", @"")];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIHelper setDefualtUI:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)craftsBtn:(id)sender{
    if (isOpened) {
        [self closeCraftsGrid];
    }else
        [self openCraftsGrid];
}
-(void)openCraftsGrid{

    [UIView beginAnimations:@"wiggle" context:nil];
    [UIView setAnimationDuration:0.7];
    craftsScroll.frame = CGRectMake(0, 50, 320, 550);
    [UIView commitAnimations];
    isOpened = YES;
}
-(IBAction)closeCraftsGrid{
    isOpened= NO;
    [UIView beginAnimations:@"wiggle" context:nil];
    [UIView setAnimationDuration:1.0];
    craftsScroll.frame = CGRectMake(0, 332, 320, 176);
    [UIView commitAnimations];
}
@end
