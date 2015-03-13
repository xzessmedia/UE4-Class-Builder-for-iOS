//
//  AddClassViewController.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xUIViewController.h"

@interface AddClassViewController : xUIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *CodeTypeSelector;
@property (strong, nonatomic) IBOutlet UITextField *ClassName;
@property (strong, nonatomic) IBOutlet UITextField *ParentClass;
@property (nonatomic, readwrite) id parentVC;
-(IBAction)CreateClass:(id)sender;
@end
