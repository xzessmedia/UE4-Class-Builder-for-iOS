//
//  UE4Class.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFile.h"
#import "UE4_Comment.h"
#import "UE4_Variable.h"
#import "UE4_Function.h"
#import "UE4_Property.h"

enum CodeType
{
    CODETYPE_CPP,
    CODETYPE_OBJC
};
enum CodeLocation
{
    CODELOCATION_HEADER,
    CODELOCATION_CPP
};
@interface UE4Class : BaseFile
@property (nonatomic,readwrite) enum CodeType type;
@property (nonatomic,readwrite) NSString* ClassName;
@property (nonatomic,readwrite) NSString* ParentClass;
@property (nonatomic,readwrite) NSMutableArray *ClassProperties;
@property (nonatomic,readwrite) NSMutableArray *ClassFunctions;
@property (nonatomic,readwrite) NSMutableArray *ClassHeader; //Container for Blocks
@property (nonatomic,readwrite) NSMutableArray *ClassCPP; // Container for Blocks
@property (nonatomic,readwrite) NSString *FinalHeader;
@property (nonatomic,readwrite) NSString *FinalCPP;
-(UE4_Comment *) CreateComment:(NSString* ) CommentText;
-(UE4_Variable *) CreateVariable:(enum VariableType) variableType name:(NSString *) variableName;
-(UE4_Property *) CreateProperty:(enum VariableType) variableType name:(NSString *) variableName AndSpecifier1:(enum PropertySpecifiers) specifier1 AndSpecifier2:(enum PropertySpecifiers) specifier2 AndCategoryName:(NSString *) category AndDescription:(NSString *) description;
-(UE4_Function *) CreateFunction:(enum VariableType) returnType AndName:(NSString *) FunctionName AndSpecifier1:(enum PropertySpecifiers) specifier1 AndSpecifier2:(enum PropertySpecifiers) specifier2 AndCategoryName:(NSString *) category;
-(void) AddComment:(NSString *) CommentText AndLocation:(enum CodeLocation) location;
-(void) AddVariable:(enum VariableType) variableType name:(NSString *) variableName AndLocation:(enum CodeLocation) location;
-(void) AddProperty:(enum VariableType) variableType name:(NSString *) variableName AndSpecifier1:(enum PropertySpecifiers) specifier1 AndSpecifier2:(enum PropertySpecifiers) specifier2 AndCategoryName:(NSString *) category AndDescription:(NSString *)description;
-(void) AddFunction:(enum VariableType) returnType AndName:(NSString *) FunctionName AndSpecifier1:(enum PropertySpecifiers) specifier1 AndSpecifier2:(enum PropertySpecifiers) specifier2 AndCategoryName:(NSString *) category;
@end
