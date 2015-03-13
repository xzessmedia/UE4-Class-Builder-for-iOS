//
//  CodeManager.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "CodeManager.h"
#import "UE4_Comment.h"
#import "UE4Class.h"
#import "Project.h"
#import "CodeFile.h"
#import "AppDelegate.h"
#import "Block.h"
@implementation CodeManager
@synthesize DatabaseContext,CurrentClass,CurrentProject,CurrentCodeFile;
//CodeManager ist ein Singleton
static CodeManager *sharedManager = nil;

+(CodeManager *) sharedManager
{
    if (sharedManager == nil) {
        sharedManager = [[CodeManager alloc] init];
        
    }
    return sharedManager;
}
-(id) init
{
    if (self == [super init]) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        DatabaseContext = [appDelegate managedObjectContext];
    }
    return self;
}
-(UE4Class *) CreateClassWithName:(NSString *) classname AndParent:(NSString *) parentclass AndCodeType:(enum CodeType) codetype
{
    UE4Class *c =[[UE4Class alloc]init];
    c.ClassName = classname;
    c.ParentClass = parentclass;
    c.type = codetype;
    return c;
}
-(UE4_Comment *) CreateComment:(NSString* ) CommentText
{
    UE4_Comment* c = [[UE4_Comment alloc] init];
    c.CommentText = CommentText;
    return c;
}
-(UE4_Variable *) CreateVariable:(enum VariableType)variableType name:(NSString *)variableName
{
    UE4_Variable* v = [[UE4_Variable alloc] init];
    v.Name = variableName;
    v.Type = variableType;
    return v;
}



-(void) AddNewProjectWithName:(NSString *) name AndAutorname:(NSString *) autor
{
    // Objekt erstellen
    Project *neuProject = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:[self DatabaseContext]];

    NSDate *dat = [NSDate date];
    neuProject.creationdate = dat;
    neuProject.projectname = name;
    neuProject.lastupdate = dat;
    neuProject.autorname = autor;
    [DatabaseContext save:nil];
}

-(void)AddNewCodeBlockWithType:(enum BlockType)blocktype AndCodeHeader:(NSString *)header AndCodeCPP:(NSString *)cpp AndLocation:(enum CodeLocation) location
{
    // Objekt erstellen
    Block *neuBlock = [NSEntityDescription insertNewObjectForEntityForName:@"Block" inManagedObjectContext:[self DatabaseContext]];
    int showindex = 0;
    showindex = [self GetNextFreeBlockIndex];
    neuBlock.blocktype = [NSNumber numberWithInt:(int)blocktype];
    neuBlock.showindex = [NSNumber numberWithInt:showindex];
    neuBlock.location = [NSNumber numberWithInteger:location];
    neuBlock.codeheader = header;
    neuBlock.codecpp = cpp;
    neuBlock.codeFile = CurrentCodeFile;
    [DatabaseContext save:nil];
}
-(int) GetNextFreeBlockIndex
{
    NSMutableArray *array = [self GetAllObjectsByEntityName:@"Block"];
    return array.count;
}
-(NSMutableArray *) GetAllObjectsByEntityName:(NSString *) entity
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:entity inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    NSMutableArray *returner = [[NSMutableArray alloc] init];
    for (int i=0; i<results.count; i++) {
        [returner addObject:[results objectAtIndex:i]];
        }
    
    return returner;
}

-(id) GetObjectByIndex:(NSUInteger) index AndEntityName:(NSString *) entity
{
     id returner;
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:entity inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    for (int i=0; i<results.count; i++) {
        if (i==index) {
            returner = [results objectAtIndex:i];
            
        }
    }
    return returner;
}

-(void) DeleteByIndex:(NSUInteger) index AndEntityName:(NSString *) entity
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:entity inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    for (int i=0; i<results.count; i++) {
        if (i==index) {
            CodeFile* cf = [results objectAtIndex:i];
            [DatabaseContext deleteObject:cf];
        }
    }
    [DatabaseContext save:nil];
}

-(void) DeleteCodeFileByIndex:(NSUInteger) index
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:@"CodeFile" inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    for (int i=0; i<results.count; i++) {
        if (i==index) {
            CodeFile* cf = [results objectAtIndex:i];
            [DatabaseContext deleteObject:cf];
        }
    }
    [DatabaseContext save:nil];
}

-(void) DeleteProjectByIndex:(NSUInteger) index
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:@"Project" inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    for (int i=0; i<results.count; i++) {
        if (i==index) {
        Project* p = [results objectAtIndex:i];
        [DatabaseContext deleteObject:p];
        }
    }
    [DatabaseContext save:nil];
}
-(NSMutableArray *) GetTableViewCodeFiles
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:@"CodeFile" inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    NSMutableArray *TableViewProjectNameArray = [[NSMutableArray alloc] init];
    for (int i=0; i<results.count; i++) {
        CodeFile* cf = [results objectAtIndex:i];
        NSString* ProjectName = cf.name;
        [TableViewProjectNameArray addObject:ProjectName];
    }
    if (error) {
        //Handle Error
        NSLog(@"Core Data Error - Messungen");
    }
    return TableViewProjectNameArray;
}
-(NSMutableArray *) GetTableViewDataProjects
{
    NSFetchRequest *req = [[NSFetchRequest alloc]init];
    [req setEntity: [NSEntityDescription entityForName:@"Project" inManagedObjectContext:DatabaseContext]];
    NSError *error;
    NSArray *results = [DatabaseContext executeFetchRequest:req error:&error];
    
    NSMutableArray *TableViewProjectNameArray = [[NSMutableArray alloc] init];
    for (int i=0; i<results.count; i++) {
        Project* p = [results objectAtIndex:i];
        NSString* ProjectName = p.projectname;
        [TableViewProjectNameArray addObject:ProjectName];
    }
    if (error) {
        //Handle Error
        NSLog(@"Core Data Error - Messungen");
    }
    return TableViewProjectNameArray;
}
-(void) AddNewCodeFileWithName:(NSString *)name AndClassName:(NSString *) ClassName AndParent:(NSString *) ParentClass AndCodeType:(enum CodeType) CodeType
{
    [self setCurrentClass:(UE4Class *) [self CreateClassWithName: ClassName AndParent:ParentClass AndCodeType:CodeType]];
    
    // Objekt erstellen
    CodeFile *neuProject = [NSEntityDescription insertNewObjectForEntityForName:@"CodeFile" inManagedObjectContext:[self DatabaseContext]];
    
    NSDate *dat = [NSDate date];
    neuProject.creationDate = dat;
    neuProject.name = name;
    neuProject.lastUpdate = dat;
    [DatabaseContext save:nil];
        
}
@end
