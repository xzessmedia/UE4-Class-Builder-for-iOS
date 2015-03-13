//
//  CodeManager.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UE4_Comment.h"
#import "UE4_Variable.h"
#import "UE4Class.h"
#import "Project.h"
#import "CodeFile.h"
enum BlockType
{
    BLOCKTYPE_COMMENT,
    BLOCKTYPE_FUNCTION,
    BLOCKTYPE_PROPERTY,
    BLOCKTYPE_VARIABLE,
    BLOCKTYPE_CUSTOMCODE
};
@interface CodeManager : NSObject
@property (atomic,readwrite) NSManagedObjectContext* DatabaseContext;
@property (atomic,readwrite) UE4Class *CurrentClass;
@property (atomic,readwrite) Project *CurrentProject;
@property (atomic,readwrite) CodeFile *CurrentCodeFile;



-(UE4_Comment *) CreateComment:(NSString* ) CommentText;
-(UE4_Variable *) CreateVariable:(enum VariableType) variableType name:(NSString *) variableName;
-(UE4Class *) CreateClassWithName:(NSString *) classname AndParent:(NSString *) parentclass AndCodeType:(enum CodeType) codetype;

+(CodeManager *) sharedManager;

-(id) GetObjectByIndex:(NSUInteger) index AndEntityName:(NSString *) entity;
-(void) DeleteByIndex:(NSUInteger) index AndEntityName:(NSString *) entity;
-(void) AddNewCodeFileWithName:(NSString *)name AndClassName:(NSString *) ClassName AndParent:(NSString *) ParentClass AndCodeType:(enum CodeType) CodeType;
-(void) DeleteCodeFileByIndex:(NSUInteger) index;
-(void) DeleteProjectByIndex:(NSUInteger) index;
-(void) AddNewProjectWithName:(NSString *) name AndAutorname:(NSString *) autor;
-(void)AddNewCodeBlockWithType:(enum BlockType)blocktype AndCodeHeader:(NSString *)header AndCodeCPP:(NSString *)cpp AndLocation:(enum CodeLocation) location;
-(int) GetNextFreeBlockIndex;
// Tableview Data
-(NSMutableArray *) GetTableViewDataProjects;
-(NSMutableArray *) GetTableViewCodeFiles;
-(NSMutableArray *) GetAllObjectsByEntityName:(NSString *) entity;
@end
