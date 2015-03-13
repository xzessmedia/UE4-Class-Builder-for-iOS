//
//  ProjectDetailViewController.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *ProjectTableView;
@property (strong, nonatomic) NSMutableArray *ProjectFileArray;
@property (nonatomic, readwrite) NSString *ClassName;
@property (nonatomic, readwrite) NSString *ParentClass;
@property (nonatomic, readwrite) NSString *CurrentCodeFile;
@property (nonatomic, readwrite) enum CodeType ClassType;
-(IBAction)NewClassFile:(id)sender;
-(IBAction)RemoveClassFile:(id)sender;
-(void) Refresh;
@end
