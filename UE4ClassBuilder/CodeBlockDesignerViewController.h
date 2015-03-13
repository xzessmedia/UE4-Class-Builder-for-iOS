//
//  CodeBlockDesignerViewController.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "xUIViewController.h"
#import "CNPGridMenu.h"

@interface CodeBlockDesignerViewController : xUIViewController
{
    CNPGridMenu* Menu;
}
@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property (nonatomic,readwrite) NSMutableArray *Blocks;
@property (nonatomic,readwrite) NSMutableArray *Comments;
@property (nonatomic,readwrite) NSMutableArray *Properties;
@property (nonatomic,readwrite) NSMutableArray *Functions;
@property (nonatomic,readwrite) NSMutableArray *Variables;
@property (nonatomic,readwrite) NSMutableArray *CustomCodes;

-(IBAction)EditBlocks:(id)sender;
- (IBAction)showGridMenu:(id)sender;
-(void) AttachItemsToBlocks:(NSMutableArray *) items;
-(void) Refresh;
@end
