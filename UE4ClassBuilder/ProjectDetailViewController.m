//
//  ProjectDetailViewController.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "CodeManager.h"
#import "ProjectTableViewCell.h"
#import "AddClassViewController.h"
#import "ClassDesignerViewController.h"
#import "CodeBlockDesignerViewController.h"

@interface ProjectDetailViewController ()

@end

@implementation ProjectDetailViewController
@synthesize ProjectFileArray,ProjectTableView,ClassName,ParentClass,ClassType,CurrentCodeFile;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewDidAppear:(BOOL)animated
{
    [self Refresh];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ProjectFileArray = [[NSMutableArray alloc] init];
    ProjectFileArray = [[CodeManager sharedManager] GetTableViewCodeFiles];
    if (ProjectFileArray.count <= 0) {
        [ProjectFileArray addObject:@"No Projectfiles yet..."];
    }
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return ProjectFileArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProjectFileCell";
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.ProjectLabel.text = [ProjectFileArray objectAtIndex:indexPath.row];
    return cell;
}


 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }


 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
     [ProjectFileArray removeObjectAtIndex:indexPath.row];
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     [[CodeManager sharedManager] DeleteCodeFileByIndex:indexPath.row];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Title = [ProjectFileArray objectAtIndex:indexPath.row];
    if ([Title  isEqual: @"No Projectfiles yet..."]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please create new file" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        [[CodeManager sharedManager] setCurrentCodeFile: (CodeFile *) [[CodeManager sharedManager] GetObjectByIndex:indexPath.row AndEntityName:@"CodeFile"]];
        
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                      bundle:nil];
        CodeBlockDesignerViewController* vc = [sb instantiateViewControllerWithIdentifier:@"CodeBlockDesigner"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
}

-(IBAction)NewClassFile:(id)sender
{
   

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ClassSettingsSegue"])
    {
        // Get reference to the destination view controller
        AddClassViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setParentVC:self];
    }
}

-(IBAction)RemoveClassFile:(id)sender
{
    if (ProjectTableView.isEditing == NO) {
        [ProjectTableView setEditing: YES animated: YES];
    } else {
        [ProjectTableView setEditing: NO animated: YES];
    }
}
-(void) Refresh
{
    ProjectFileArray =  [[CodeManager sharedManager] GetTableViewCodeFiles];
    [ProjectTableView reloadData];
}

@end
