//
//  UE4Class.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "UE4Class.h"
#import "UE4_Comment.h"
#import "UE4_Variable.h"
@implementation UE4Class
@synthesize type,ClassFunctions,ClassName,ClassProperties,ParentClass,FinalCPP,FinalHeader,ClassCPP,ClassHeader;

-(id) init
{
    if (self == [super init]) {
        
        ClassProperties = [[NSMutableArray alloc]init];
        ClassCPP = [[NSMutableArray alloc]init];
        ClassFunctions = [[NSMutableArray alloc]init];
        ClassHeader  = [[NSMutableArray alloc]init];
        
    }
    return self;
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

-(UE4_Property *) CreateProperty:(enum VariableType) variableType name:(NSString *) variableName AndSpecifier1:(enum PropertySpecifiers) specifier1 AndSpecifier2:(enum PropertySpecifiers) specifier2 AndCategoryName:(NSString *) category AndDescription:(NSString *) description
{
    UE4_Property* p = [[UE4_Property alloc] init];
    UE4_Variable* v = [self CreateVariable:variableType name:variableName];
    p.Specifier1 = specifier1;
    p.Specifier2 = specifier2;
    p.Variable = v;
    p.CategoryName = category;
    p.description = description;
    return p;
}
-(UE4_Function *) CreateFunction:(enum VariableType)returnType AndName:(NSString *)FunctionName AndSpecifier1:(enum PropertySpecifiers)specifier1 AndSpecifier2:(enum PropertySpecifiers)specifier2 AndCategoryName:(NSString *)category
{
    UE4_Function* f = [[UE4_Function alloc]init];
    f.Specifier1 = specifier1;
    f.Specifier2 = specifier2;
    f.FunctionName = FunctionName;
    f.ReturnType = returnType;
    f.Category = category;
    
    return f;
}
-(void) AddComment:(NSString *)CommentText AndLocation:(enum CodeLocation)location
{
    UE4_Comment* comment = [self CreateComment:CommentText];
    
    switch (location) {
        case CODELOCATION_HEADER:
            [ClassHeader addObject:comment];
            break;
        case CODELOCATION_CPP:
            [ClassCPP addObject:comment];
            break;
        default:
            break;
    }
}
-(void) AddVariable:(enum VariableType)variableType name:(NSString *)variableName AndLocation:(enum CodeLocation)location
{
    UE4_Variable *variable = [self CreateVariable:variableType name:variableName];
    switch (location) {
        case CODELOCATION_HEADER:
            [ClassHeader addObject:variable];
            break;
        case CODELOCATION_CPP:
            [ClassCPP addObject:variable];
            break;
        default:
            break;
    }
}

-(void) AddProperty:(enum VariableType)variableType name:(NSString *)variableName AndSpecifier1:(enum PropertySpecifiers)specifier1 AndSpecifier2:(enum PropertySpecifiers)specifier2 AndCategoryName:(NSString *)category AndDescription:(NSString *)description
{
    UE4_Property *p = [self CreateProperty:variableType name:variableName AndSpecifier1:specifier1 AndSpecifier2:specifier2 AndCategoryName:category AndDescription:description];

    [ClassHeader addObject:p];

}
-(void) AddFunction:(enum VariableType)returnType AndName:(NSString *)FunctionName AndSpecifier1:(enum PropertySpecifiers)specifier1 AndSpecifier2:(enum PropertySpecifiers)specifier2 AndCategoryName:(NSString *)category
{
    UE4_Function *f = [self CreateFunction:returnType AndName:FunctionName AndSpecifier1:specifier1 AndSpecifier2:specifier2 AndCategoryName:category];
    
    [ClassHeader addObject:f];
}
@end
