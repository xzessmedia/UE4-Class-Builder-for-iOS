//
//  CodeBlockDesignerViewController.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "CodeBlockDesignerViewController.h"
#import "AddBlockTableViewController.h"
#import "BlocksTableViewCell.h"
#import "CNPGridMenu.h"
#import "AddCommentViewController.h"
#import "CodeManager.h"
#import "Block.h"

@interface CodeBlockDesignerViewController ()<CNPGridMenuDelegate>

@end

@implementation CodeBlockDesignerViewController
@synthesize Blocks,Comments,Properties,Variables,Functions,CustomCodes,TableView;
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

    [self Refresh];
}
-(void) viewDidAppear:(BOOL)animated
{
    [self Refresh];
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
-(IBAction)EditBlocks:(id)sender
{
    if (TableView.isEditing == NO) {
        [TableView setEditing: YES animated: YES];
    } else {
        [TableView setEditing: NO animated: YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return Blocks.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    //Number of rows it should expect should be based on the section
    NSDictionary *dictionary = [Blocks objectAtIndex:section];
    
    NSArray *array = [dictionary valueForKey:@"data"];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BlockCell";
    BlocksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Block* b;
    NSLog(@"Index Path.Section =  %i",indexPath.section);
    switch (indexPath.section) {
        case 0:
            b = (Block *)[Functions objectAtIndex:indexPath.row];
            break;
        case 1:
            b = (Block *)[Properties objectAtIndex:indexPath.row];
            break;
        case 2:
            b = (Block *)[Variables objectAtIndex:indexPath.row];
            break;
        case 3:
            b = (Block *)[CustomCodes objectAtIndex:indexPath.row];
            break;
        case 4:
            b = (Block *)[Comments objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    

    // Configure the cell...
    
    int bindex = [b.showindex integerValue];
    enum BlockType btype = [b.blocktype integerValue];
    enum CodeLocation bcloc = [b.location integerValue];
    switch (btype) {
        case BLOCKTYPE_VARIABLE:
            cell.BlockType.text = @"Variable";
            break;
        case BLOCKTYPE_FUNCTION:
            cell.BlockType.text = @"Function";
            break;
        case BLOCKTYPE_PROPERTY:
            cell.BlockType.text = @"Property";
            break;
        case BLOCKTYPE_COMMENT:
            cell.BlockType.text = @"Comment";
            break;
        case BLOCKTYPE_CUSTOMCODE:
            cell.BlockType.text = @"Custom";
            break;
        default:
            break;
    }
    switch (bcloc) {
        case CODELOCATION_CPP:
            cell.BlockPosition.text = @"CPP";
            break;
        case CODELOCATION_HEADER:
            cell.BlockPosition.text = @"Header";
            break;
            
        default:
            break;
    }
    
    cell.BlockIndex.text = [NSString stringWithFormat:@"%i",bindex];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Block *selectedBlock = [Blocks objectAtIndex:indexPath.row];
    

}
#pragma mark - Table view delegate

-(void) AttachItemsToBlocks:(NSMutableArray *)items
{
    NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:items forKey:@"data"];
    [Blocks addObject:firstItemsArrayDict];
}


- (IBAction)showGridMenu:(id)sender {
    
    CNPGridMenuItem *comment = [[CNPGridMenuItem alloc] init];
    comment.icon = [UIImage imageNamed:@"32-speechbubble"];
    comment.title = @"Add Comment";
    
    CNPGridMenuItem *function = [[CNPGridMenuItem alloc] init];
    function.icon = [UIImage imageNamed:@"18-puzzle"];
    function.title = @"Add Function";
    
    CNPGridMenuItem *property = [[CNPGridMenuItem alloc] init];
    property.icon = [UIImage imageNamed:@"21-wrench"];
    property.title = @"Add Property";
    
    CNPGridMenuItem *variable = [[CNPGridMenuItem alloc] init];
    variable.icon = [UIImage imageNamed:@"14-gear"];
    variable.title = @"Add Variable";
    
    CNPGridMenuItem *customcode = [[CNPGridMenuItem alloc] init];
    customcode.icon = [UIImage imageNamed:@"16-tag"];
    customcode.title = @"Add Custom Code Block";
    
    
    CNPGridMenu *gridMenu = [[CNPGridMenu alloc] initWithMenuItems:@[comment, function, property, variable, customcode]];
    gridMenu.delegate = self;
    [self presentGridMenu:gridMenu animated:YES completion:^{
        NSLog(@"Grid Menu Presented");
    }];
}

- (void)gridMenuDidTapOnBackground:(CNPGridMenu *)menu {
    [self dismissGridMenuAnimated:YES completion:^{
        NSLog(@"Grid Menu Dismissed With Background Tap");
    }];
}

- (void)gridMenu:(CNPGridMenu *)menu didTapOnItem:(CNPGridMenuItem *)item {
    [self dismissGridMenuAnimated:YES completion:^{
        NSLog(@"Grid Menu Did Tap On Item: %@", item.title);
    }];
    
    if ([item.title  isEqual: @"Add Comment"]) {
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                      bundle:nil];
        AddCommentViewController* vc = [sb instantiateViewControllerWithIdentifier:@"AddComment"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void) Refresh
{
    Comments = [[NSMutableArray alloc]init];
    Functions = [[NSMutableArray alloc]init];
    Properties = [[NSMutableArray alloc]init];
    Variables = [[NSMutableArray alloc]init];
    CustomCodes = [[NSMutableArray alloc]init];
    
    Blocks = [[NSMutableArray alloc]init];
    
    NSMutableArray* tmp = [[CodeManager sharedManager] GetAllObjectsByEntityName:@"Block"];
    for (int i=0; i<tmp.count; i++) {
        Block* b = [tmp objectAtIndex:i];
        int x = [b.blocktype integerValue];
        enum BlockType bt;
        bt = x;
        
        switch (bt) {
            case BLOCKTYPE_COMMENT:
                [Comments addObject:b];
                break;
            case BLOCKTYPE_FUNCTION:
                [Functions addObject:b];
                break;
            case BLOCKTYPE_PROPERTY:
                [Properties addObject:b];
                break;
            case BLOCKTYPE_VARIABLE:
                [Variables addObject:b];
                break;
            case BLOCKTYPE_CUSTOMCODE:
                [CustomCodes addObject:b];
                break;
            default:
                break;
        }
    }
    
    [self AttachItemsToBlocks:Functions];
    [self AttachItemsToBlocks:Properties];
    [self AttachItemsToBlocks:Variables];
    [self AttachItemsToBlocks:CustomCodes];
    [self AttachItemsToBlocks:Comments];
    
    [TableView reloadData];
}


@end
