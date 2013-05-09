//
//  WorkerDetailsView.h
//  Sani3ee
//
//  Created by Sheta on 4/10/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkerModel.h"
@interface WorkerDetailsView : UIViewController {
    IBOutlet UITableViewCell *detailsCell;
}
@property(nonatomic,retain)WorkerModel *worker;
@end
