//
//  UE4_Property.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "UE4_Property.h"
#import "CodeManager.h"

@implementation UE4_Property
@synthesize Specifier1,Specifier2,CategoryName,Description,Variable;
-(NSString *) RenderOutputHeader
{
    NSString* spec1 = [self GetStringForSpecifier:Specifier1];
    NSString* spec2 = [self GetStringForSpecifier:Specifier2];
    
    UE4_Comment *comm = [[CodeManager sharedManager] CreateComment:Description];
    NSString* Output1  = [comm RenderOutput];
    NSString* Output2 = [NSString stringWithFormat:@"UPROPERTY(%@, %@, Category=%@)",spec1,spec2,CategoryName];
    NSString* Output3 = [Variable RenderOutputHeader];

    NSString* Output = [NSString stringWithFormat:@"%@ %@ %@",Output1,Output2,Output3];
    return Output;
}
-(NSString *) GetStringForSpecifier:(enum PropertySpecifiers)specifier
{
    NSString* returner;
    switch (specifier) {
        case Specifier_AdvancedDisplay:
            returner = @"AdvancedDisplay";
            break;
        case Specifier_AssetRegistrySearchable:
            returner = @"AssetRegistrySearchable";
            break;
        case Specifier_BlueprintAssignable:
            returner = @"BlueprintAssignable";
            break;
        case Specifier_BlueprintCallable:
            returner = @"BlueprintCallable";
            break;
            
        default:
            break;
    }
    return returner;
}
@end
