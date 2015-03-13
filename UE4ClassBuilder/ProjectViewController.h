//
//  ProjectViewController.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ProjectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    int alertindex;
    BOOL InputEmpty;
    BOOL InputMode;
    NSString *ProjectName;
    NSString *Autor;
}
@property (strong, nonatomic) IBOutlet UITableView *ProjectTableView;
@property (strong, nonatomic) NSMutableArray *ProjectsArray;
-(IBAction)CreateProject:(id)sender;
-(IBAction)DeleteProject:(id)sender;
-(void) Refresh;
@end
