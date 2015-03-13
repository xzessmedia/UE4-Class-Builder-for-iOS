//
//  UE4_Property.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "BaseFile.h"
#import "UE4_Variable.h"
@interface UE4_Property : BaseFile
@property (nonatomic,readwrite) enum    PropertySpecifiers  Specifier1;
@property (nonatomic,readwrite) enum    PropertySpecifiers  Specifier2;
@property (nonatomic,readwrite)              NSString*              CategoryName;
@property (nonatomic,readwrite)              NSString*              Description;
@property (nonatomic,readwrite)              UE4_Variable*       Variable;
-(NSString *) GetStringForSpecifier:(enum PropertySpecifiers) specifier;
@end
