//
//  xUIViewController.h
//  Einkaufszettel
//
//  Created by Tim Koepsel on 16.09.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xUIViewController : UIViewController<UITextFieldDelegate>

- (void)resignOnTap:(id)iSender;
-(void)popToSpecificViewController:(UIViewController *)controller;
-(void)popToSpecificViewControllerInStack:(__unsafe_unretained Class)viewcontrollerClass;
-(void) AddKeyboardToTextView:(id) textview;
//declare a property to store your current responder
@property (nonatomic, assign) id currentResponder;
@end
