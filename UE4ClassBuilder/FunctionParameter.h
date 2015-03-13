//
//  FunctionParameter.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFile.h"
@interface FunctionParameter : BaseFile
@property (nonatomic,readwrite) enum VariableType ParameterType;
@property (nonatomic,readwrite) NSString *ParameterName;
@end
