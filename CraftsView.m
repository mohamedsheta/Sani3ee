//
//  CraftsView.m
//  Sani3ee
//
//  Created by Sheta on 4/7/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "CraftsView.h"
#import "ClientManger.h"
#import "NewWorkerView.h"
@interface CraftsView ()
{
    NSMutableArray *crafts;
}
@end

@implementation CraftsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:NSLocalizedString(@"Crafts", @"")];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    
    
    [UIHelper setDefualtUI:self];
//    UIBarButtonItem *addWorker = [[UIBarButtonItem alloc] initWithTitle:@"add worker" style:UIBarButtonItemStylePlain target:self action:@selector(addWorker)];
//    self.navigationItem.rightBarButtonItem = addWorker;
//    
//    id<Backend> clientManger= [ClientManger createInstance];
//    crafts = [NSMutableArray new];
//    crafts = [clientManger getAllCrafts];
//    [self createCraftsView];
    
}
- (void)viewDidAppear:(BOOL)animated{
  //  [self showIconsWithAnimation];
}
-(void)addWorker{
    NewWorkerView *newWorker = [NewWorkerView new];
    UINavigationController *navworker = [[UINavigationController alloc] initWithRootViewController:newWorker];
    [self presentModalViewController:navworker animated:YES];
}
-(void)createCraftsView{
    int startX = 25;
    int startY = 10;
    int space_hor = 15;
    int space_ver = 15;
    int craftImage_width = 57;
    int craftImage_hight = 57;
    int craftName_hight = 20;
    int rowCount = 4;
    for (int i = 0; i < crafts.count; i++) {
        CraftModel *craft = [crafts objectAtIndex:i];
        UIButton *craftBtn = [[UIButton alloc] init];
        UILabel *craftnName = [[UILabel alloc] init];
        
        int x =startX +( ( i%rowCount ) * (craftImage_width +space_hor));
        int y = startY + ((int)(i / rowCount) * (craftImage_hight + craftName_hight +space_ver));
        craftBtn.frame = CGRectMake(x, y, craftImage_width, craftImage_hight);
        craftnName.frame = CGRectMake(x, y + craftImage_hight, craftImage_width, craftName_hight);
        [craftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [craftBtn setTag:craft.craft_id];
        [craftBtn addTarget:self action:@selector(goToWorkerPage:) forControlEvents:UIControlEventTouchUpInside];
        [craftBtn setBackgroundImage:[UIImage imageNamed:craft.craft_image_url] forState:UIControlStateNormal];
        
        craftBtn.alpha = 0;
        
        [craftnName setBackgroundColor:[UIColor clearColor]];
        craftnName.textAlignment = UITextAlignmentCenter;
        craftnName.textColor = [UIColor orangeColor];
        craftnName.shadowColor = [UIColor grayColor];
        craftnName.text = craft.craft_name;
        craftnName.font = [UIFont systemFontOfSize:11.0];

        if (i % rowCount == 0) {
            [scrollView setContentSize:CGSizeMake(320, y +craftImage_hight+ craftName_hight)];
        }
            [scrollView addSubview:craftBtn];
        [scrollView addSubview:craftnName];
    }
}
-(void)showIconsWithAnimation{

    for (int i = 0; i < crafts.count; i++) {
        UIView *subView = [scrollView viewWithTag:[[crafts objectAtIndex:i] craft_id]];
        subView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        subView.transform = CGAffineTransformIdentity;
        subView.alpha = 1;
        [UIView commitAnimations];

    }
    
   
}

-(void)goToWorkerPage:(id)sender {
    UIButton *craftBtn = (UIButton *)sender;
    WorkersView *workersView = [WorkersView new];
    id<Backend> clientManger= [ClientManger createInstance];
    workersView.workers = [clientManger getWorkersByCraftId:[crafts objectAtIndex:craftBtn.tag]];
    [self.navigationController pushViewController:workersView animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
