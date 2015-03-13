//
//  BaseFile.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "BaseFile.h"
#import "UE4_Comment.h"
#import "UE4_Variable.h"

@implementation BaseFile
@synthesize ShowIndex;
-(NSString *) GetStringFromSpecifier:(enum PropertySpecifiers)specifier
{
    NSString *spec;
    switch (specifier) {
        case Specifier_AdvancedDisplay:
            spec = @"AdvancedDisplay";
            break;
        case Specifier_AssetRegistrySearchable:
            spec = @"AssetRegistrySearchable";
            break;
        case Specifier_BlueprintAssignable:
            spec = @"BlueprintAssignable";
            break;
        case Specifier_BlueprintCallable:
            spec = @"BlueprintCallable";
            break;
        case Specifier_BlueprintReadOnly:
            spec = @"BlueprintReadOnly";
            break;
        case Specifier_BlueprintReadWrite:
            spec = @"BlueprintReadWrite";
            break;
        case Specifier_Category:
            spec = @"Category";
            break;
        case Specifier_Config:
            spec = @"Config";
            break;
        case Specifier_Const:
            spec = @"Const";
            break;
        case Specifier_DuplicateTransient:
            spec = @"DuplicateTransient";
            break;
        case Specifier_EditAnywhere:
            spec = @"EditAnywhere";
            break;
        case Specifier_EditDefaultsOnly:
            spec = @"EditDefaultsOnly";
            break;
        case Specifier_EditFixedSize:
            spec = @"EditFixedSize";
            break;
        case Specifier_EditInline:
            spec = @"EditInline";
            break;
        case Specifier_EditInstanceOnly:
            spec = @"EditInstanceOnly";
            break;
        case Specifier_Export:
            spec = @"Export";
            break;
        case Specifier_GlobalConfig:
            spec = @"GlobalConfig";
            break;
        case Specifier_Instanced:
            spec = @"Instanced";
            break;
        case Specifier_Interp:
            spec = @"Interp";
            break;
        case Specifier_Localized:
            spec = @"Localized";
            break;
        case Specifier_Native:
            spec = @"Native";
            break;
        case Specifier_NoClear:
            spec = @"NoClear";
            break;
        case Specifier_NoExport:
            spec = @"NoExport";
            break;
        case Specifier_NonTransactional:
            spec = @"NonTransactional";
            break;
        case Specifier_Ref:
            spec = @"Ref";
            break;
        case Specifier_Replicated:
            spec = @"Replicated";
            break;
        case Specifier_ReplicatedUsing:
            spec = @"ReplicatedUsing";
            break;
        case Specifier_RepRetry:
            spec = @"RepRetry";
            break;
        case Specifier_SaveGame:
            spec = @"SaveGame";
            break;
        case Specifier_SerializeText:
            spec = @"SerializeText";
            break;
        case Specifier_SimpleDisplay:
            spec = @"SimpleDisplay";
            break;
        case Specifier_Transient:
            spec = @"Transient";
            break;
        case Specifier_VisibleAnywhere:
            spec = @"VisibleAnywhere";
            break;
        case Specifier_VisibleDefaultsOnly:
            spec = @"VisibleDefaultsOnly";
            break;
        case Specifier_VisibleInstanceOnly:
            spec = @"VisibleInstanceOnly";
            break;
        default:
            break;
    }
    return spec;
}

-(NSString *) GetStringFromVariableType:(enum VariableType)CustomType
{
    NSString* currentType;
        switch (CustomType) {
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
                currentType = @"custom";
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
    return currentType;
}

@end
