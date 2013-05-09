//
//  WorkerDetailsView.m
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "WorkerDetailsView.h"
#import "WorkerDetailsCustomCell.h"
#import "UserWorkerModel.h"
@interface WorkerDetailsView ()

@end

@implementation WorkerDetailsView
@synthesize worker;
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
    [UIHelper setDefualtUI:self];
 
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return 4;
    }else
    return worker.worker_reviews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat: @"Cell%d:%d", indexPath.row, indexPath.section];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
   
    }
    WorkerDetailsCustomCell *customCell = [WorkerDetailsCustomCell new];
    customCell.view;
    if (indexPath.section == 0 ) {
        if (indexPath.row == 0) {
            customCell.keyLbl.text = NSLocalizedString(@"Name", @"Name");
            customCell.valueLbl.text = worker.worker_name;
            [cell.contentView addSubview:customCell.view];
        }else if (indexPath.row == 1) {
            customCell.keyLbl.text = NSLocalizedString(@"Phone", @"Phone");
            customCell.valueLbl.text = worker.worker_phone;
            [cell.contentView addSubview:customCell.view];
        }else if (indexPath.row == 2) {
            customCell.keyLbl.text = NSLocalizedString(@"Zone", @"Zone");
            customCell.valueLbl.text = worker.worker_zone;
            [cell.contentView addSubview:customCell.view];
        }else if (indexPath.row == 3) {
            customCell.keyLbl.text = NSLocalizedString(@"Price", @"Price");
            customCell.valueLbl.text = worker.worker_minimumPrice;
            [cell.contentView addSubview:customCell.view];
        }
    }else if(indexPath.section == 1){
    
        cell.textLabel.text = [(UserWorkerModel *)[worker.worker_reviews objectAtIndex:indexPath.row] user_review];
    }
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return NSLocalizedString(@"Reviews", @"Reviews");
    }else
        return @"";
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 1) {
//        return 100;
//    }else
//        return 80;
//}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WorkerDetailsView *workerView = [WorkerDetailsView new];
    
    [self.navigationController pushViewController:workerView animated:YES];
}


@end
