//
//  AddCommentViewController.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "AddCommentViewController.h"
#import "CodeManager.h"
#import "UE4_Comment.h"

@interface AddCommentViewController ()

@end

@implementation AddCommentViewController
@synthesize CodeTypeSelector,CommentText;
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
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)AddComment:(id)sender
{
    enum CodeLocation location;
    if (CodeTypeSelector.selectedSegmentIndex == 0) {
        location = CODELOCATION_HEADER;
    } else {
        location = CODELOCATION_CPP;
    }
    
    UE4_Comment *com = [[CodeManager sharedManager] CreateComment:CommentText.text];
    NSString *output = [com RenderOutput];
    
    switch (location) {
        case CODELOCATION_HEADER:
            [[CodeManager sharedManager] AddNewCodeBlockWithType:BLOCKTYPE_COMMENT AndCodeHeader:output AndCodeCPP:nil AndLocation:location];
            break;
        case CODELOCATION_CPP:
            [[CodeManager sharedManager] AddNewCodeBlockWithType:BLOCKTYPE_COMMENT AndCodeHeader:nil AndCodeCPP:output AndLocation:location];
            break;
            
        default:
            break;
    }
    
      
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)Dismiss:(id)sender
{
    [self.parentViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
