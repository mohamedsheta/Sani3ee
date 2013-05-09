//
//  NewWorkerView.h
//  Sani3ee
//
//  Created by Omneya on 4/27/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewWorkerView : UIViewController{
    IBOutlet UITextField *workerName;
    IBOutlet UITextField *workerMobile;
}
-(IBAction)addWorkerFromContcats:(id)sender;
@end
