//
//  ProjectViewController.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "ProjectViewController.h"
#import "CodeManager.h"
#import "ProjectTableViewCell.h"
#import "ProjectDetailViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController
@synthesize ProjectsArray,ProjectTableView;
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
    
    ProjectsArray = [[CodeManager sharedManager] GetTableViewDataProjects];
    if (ProjectsArray.count <= 0) {
        [ProjectsArray addObject:@"No Projects yet..."];
    }
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
    return ProjectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProjectCell";
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.ProjectLabel.text = [ProjectsArray objectAtIndex:indexPath.row];
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
        
        [ProjectsArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [[CodeManager sharedManager] DeleteProjectByIndex:indexPath.row];
        [self Refresh];
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
    NSString *Title = [ProjectsArray objectAtIndex:indexPath.row];
    if ([Title  isEqual: @"No Projects yet..."]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please create new project" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    } else {

        [[CodeManager sharedManager] setCurrentProject: (Project *) [[CodeManager sharedManager] GetObjectByIndex:indexPath.row AndEntityName:@"Project"]];
        
        UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main_iPhone"
                                                      bundle:nil];
        ProjectDetailViewController* vc = [sb instantiateViewControllerWithIdentifier:@"ProjectData"];
        [self.navigationController pushViewController:vc animated:YES];

    }

}
-(IBAction)CreateProject:(id)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Please enter the name of the project:" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    InputMode = YES;
    [alert show];
}
-(IBAction)DeleteProject:(id)sender
{
    if (ProjectTableView.isEditing == NO) {
        [ProjectTableView setEditing: YES animated: YES];
    } else {
        [ProjectTableView setEditing: NO animated: YES];
    }
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    alertindex++;
    if (buttonIndex == 0) {
        NSString *InputResult;
        if (InputMode == YES) {
            InputResult = [alertView textFieldAtIndex:0].text;
        }

        if (InputEmpty == YES) {
            alertindex = 0;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Please enter the name of the project:" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            InputMode = YES;
            [alert show];
        }
        
        if ([InputResult  isEqual: @""]) {
            InputEmpty = YES;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Input can not be empty! Please click on new project to start again" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.alertViewStyle = UIAlertViewStyleDefault;
            InputMode = NO;
            [alert show];
        } else {
            InputEmpty = NO;
        }
        
        if (InputEmpty == NO) {
            
        
            
        if (alertindex == 1) {
            ProjectName = InputResult;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Please enter the name of the autor:" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            InputMode = YES;
            [alert show];
        }
        if (alertindex == 2) {
            Autor = InputResult;
            [[CodeManager sharedManager] AddNewProjectWithName:ProjectName AndAutorname:Autor];
            alertindex = 0;
            
            [self Refresh];
        }
        }
    }
}
-(void) Refresh
{
    ProjectsArray =  [[CodeManager sharedManager] GetTableViewDataProjects];
    [ProjectTableView reloadData];
}
@end
