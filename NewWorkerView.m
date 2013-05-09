//
//  NewWorkerView.m
//  Sani3ee
//
//  Created by Omneya on 4/27/13.
//  Copyright (c) 2013 itworx. All rights reserved.
//

#import "NewWorkerView.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface NewWorkerView ()

@end

@implementation NewWorkerView

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
    
    UIBarButtonItem *addWorker = [[UIBarButtonItem alloc] initWithTitle:@"add worker" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = addWorker;
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
  //  self.navigationItem.leftBarButtonItem = cancel;
    
    
}
-(void)done{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)addWorkerFromContcats:(id)sender{
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentModalViewController:picker animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    NSString* name = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    ABMultiValueRef phoneProperty   = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSArray* phones_keyValue         = [self getKeyValueFromMultiValueRef:phoneProperty];
    NSMutableArray *phones_value = [NSMutableArray new];
    for (NSDictionary *dic in phones_keyValue) {
        [phones_value addObject:[dic valueForKey:[[dic allKeys] objectAtIndex:0]]] ;
        
    }
   
    
    workerName.text = name;
    if (phones_value.count > 0) {
        workerMobile.text = [phones_value objectAtIndex:0];
    }
    [self dismissModalViewControllerAnimated:YES];
    
    return NO;
}

- (NSMutableArray*)getKeyValueFromMultiValueRef:(ABMultiValueRef)multiValueRef  {
    
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for(int i = 0; i < ABMultiValueGetCount(multiValueRef); i++) {
        
        CFStringRef locLabel        = ABMultiValueCopyLabelAtIndex(multiValueRef, i);
        NSString *key               = (NSString *)CFBridgingRelease(ABAddressBookCopyLocalizedLabel(locLabel));
        NSString* value             = (NSString *)CFBridgingRelease(ABMultiValueCopyValueAtIndex(multiValueRef, i)) ;
        NSMutableDictionary* dic    = [[NSMutableDictionary alloc] initWithObjectsAndKeys:value,key, nil] ;
        [data addObject:dic];
        //   if (locLabel)
        //        CFRelease(locLabel);
    }
    
    return data;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}
@end
