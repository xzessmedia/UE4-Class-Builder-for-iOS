//
//  xUIViewController.m
//  Einkaufszettel
//
//  Created by Tim Koepsel on 16.09.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "xUIViewController.h"
#import "KOKeyboardRow.h"
#import "XCDFormInputAccessoryView.h"

@interface xUIViewController ()
@property (nonatomic, strong) XCDFormInputAccessoryView *inputAccessoryView;
@end

@implementation xUIViewController

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
    
    // Tap Recognizer for dismiss Keyboard
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
    
    self.inputAccessoryView = [XCDFormInputAccessoryView new];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.currentResponder = nil;
}


- (void)resignOnTap:(id)iSender {
    [self.currentResponder resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}


-(void)popToSpecificViewController:(UIViewController *)controller
{
    NSMutableArray *mutableVCArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [mutableVCArray insertObject:controller atIndex:mutableVCArray.count-1];
    [self.navigationController setViewControllers:mutableVCArray animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)popToSpecificViewControllerInStack:(__unsafe_unretained Class)viewcontrollerClass
{

    
    NSMutableArray *allViewControllers = [NSMutableArray arrayWithArray:[self.navigationController  viewControllers]];
    for (UIViewController *aViewController in allViewControllers) {
        if ([aViewController isKindOfClass:viewcontrollerClass]) {
            [self.navigationController popToViewController:aViewController animated:YES];
        }
    }
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

-(void) AddKeyboardToTextView:(id)textview
{
    [KOKeyboardRow applyToTextView:textview];
}

@end
