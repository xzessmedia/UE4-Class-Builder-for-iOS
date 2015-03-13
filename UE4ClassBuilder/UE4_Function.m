//
//  UE4_Function.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "UE4_Function.h"

@implementation UE4_Function
@synthesize Specifier2,Specifier1,Category,FunctionName,ReturnType,Content,CustomReturnType,FunctionParameters;

-(NSString *) RenderOutputHeader
{
    NSString *spec1 = [self GetStringFromSpecifier:Specifier1];
    NSString *spec2 = [self GetStringFromSpecifier:Specifier2];
    NSString *output1 = [NSString stringWithFormat:@"UFUNCTION(%@, %@, Category=%@)",spec1,spec2,Category];
    
    NSString *functionType;
    switch (ReturnType) {
        case UE4VAR_ACTOR:
            functionType = @"Actor";
            break;
        case UE4VAR_BOOL:
            functionType = @"bool";
            break;
        case UE4VAR_BYTE:
            functionType = @"byte";
            break;
        case UE4VAR_CUSTOM:
            functionType = CustomReturnType;
            break;
        case UE4VAR_FLOAT:
            functionType = @"float";
            break;
        case UE4VAR_INT:
            functionType = @"int";
            break;
        case UE4VAR_OBJECT:
            functionType = @"Object";
            break;
        case UE4VAR_ROTATOR:
            functionType = @"Rotator";
            break;
        case UE4VAR_STRING:
            functionType = @"string";
            break;
        case UE4VAR_TEXT:
            functionType = @"Text";
            break;
        case UE4VAR_TRANSFORM:
            functionType = @"Transform";
            break;
        case UE4VAR_VECTOR:
            functionType = @"Vector";
            break;

            
        default:
            break;
    }
    
    // Build Parameters
    NSString *allParameters = @"(";
    for (int i=0; i<FunctionParameters.count; i++) {
       NSString* parameter =  [FunctionParameters objectAtIndex:i];
        allParameters = [NSString stringWithFormat:@"%@,%@",allParameters,parameter];
    }
    allParameters = [NSString stringWithFormat:@"%@)",allParameters];
    
    NSString *output = [NSString stringWithFormat:@"%@ \n%@ %@ %@",output1,functionType,FunctionName,allParameters];
    
    return output;
}
-(void) AddParameterWithType:(enum VariableType)parametertype AndName:(NSString *)parametername
{
    NSString *ptype = [self GetStringFromVariableType:parametertype];
    NSString *parameter = [NSString stringWithFormat:@"%@ %@",ptype,parametername];
    [[self FunctionParameters] addObject:parameter];
}
@end
