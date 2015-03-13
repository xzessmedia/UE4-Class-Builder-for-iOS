//
//  AddCommentViewController.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "xUIViewController.h"

@interface AddCommentViewController : xUIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *CodeTypeSelector;
@property (strong, nonatomic) IBOutlet UITextView *CommentText;
-(IBAction)AddComment:(id)sender;
-(IBAction)Dismiss:(id)sender;
@end
