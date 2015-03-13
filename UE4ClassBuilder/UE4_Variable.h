//
//  UE4_Variable.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "BaseFile.h"

@interface UE4_Variable : BaseFile
@property (nonatomic,readwrite) enum VariableType Type;
@property (nonatomic,readwrite) NSString* CustomType;
@property (nonatomic,readwrite) NSString* Name;
@property (nonatomic,readwrite) NSString* Value;
@property (nonatomic,readwrite) BOOL isArray;
@end
