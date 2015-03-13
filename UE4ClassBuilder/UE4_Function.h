//
//  UE4_Function.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "BaseFile.h"

@interface UE4_Function : BaseFile
@property (nonatomic,readwrite) enum PropertySpecifiers Specifier1;
@property (nonatomic,readwrite) enum PropertySpecifiers Specifier2;
@property (nonatomic,readwrite) NSString* Category;
@property (nonatomic,readwrite) NSString* FunctionName;
@property (nonatomic,readwrite) enum VariableType ReturnType;
@property (nonatomic,readwrite) NSMutableArray *FunctionParameters;
@property (nonatomic,readwrite) NSString* CustomReturnType;
@property (nonatomic,readwrite) NSString* Content;
-(void) AddParameterWithType:(enum VariableType) parametertype AndName:(NSString *) parametername;
@end
