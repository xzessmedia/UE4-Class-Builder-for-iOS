//
//  UE4_Variable.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "UE4_Variable.h"

@implementation UE4_Variable
@synthesize Value,CustomType,isArray,Name,Type;
-(NSString*) RenderOutputHeader
{
    NSString* currentType;
    if (!CustomType) {
        switch (Type) {
            case UE4VAR_ACTOR:
                currentType = @"Actor";
                break;
            case UE4VAR_BOOL:
                currentType = @"bool";
                break;
            case UE4VAR_BYTE:
                currentType = @"byte";
                break;
            case UE4VAR_CUSTOM:
                currentType = CustomType;
                break;
            case UE4VAR_FLOAT:
                currentType = @"float";
                break;
            case UE4VAR_INT:
                currentType = @"int";
                break;
            case UE4VAR_OBJECT:
                currentType = @"Object";
                break;
            case UE4VAR_ROTATOR:
                currentType = @"Rotator";
                break;
            case UE4VAR_STRING:
                currentType = @"string";
                break;
            case UE4VAR_TEXT:
                currentType = @"Text";
                break;
            case UE4VAR_TRANSFORM:
                currentType = @"Transform";
                break;
            case UE4VAR_VECTOR:
                currentType = @"Vector";
                break;
            default:
                break;
        }
    }

    NSString* output = [NSString stringWithFormat:@"%@ %@", currentType,Name];
    return output;
}
@end
