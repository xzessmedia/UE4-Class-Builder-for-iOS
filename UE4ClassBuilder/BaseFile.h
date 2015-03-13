//
//  BaseFile.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>

enum PropertySpecifiers
{
    Specifier_AdvancedDisplay,
    Specifier_AssetRegistrySearchable,
    Specifier_BlueprintAssignable,
    Specifier_BlueprintCallable,
    Specifier_BlueprintReadOnly,
    Specifier_BlueprintReadWrite,
    Specifier_Category,
    Specifier_Config,
    Specifier_Const,
    Specifier_DuplicateTransient,
    Specifier_EditAnywhere,
    Specifier_EditDefaultsOnly,
    Specifier_EditFixedSize,
    Specifier_EditInline,
    Specifier_EditInstanceOnly,
    Specifier_Export,
    Specifier_GlobalConfig,
    Specifier_Instanced,
    Specifier_Interp,
    Specifier_Localized,
    Specifier_Native,
    Specifier_NoClear,
    Specifier_NoExport,
    Specifier_NonTransactional,
    Specifier_Ref,
    Specifier_Replicated,
    Specifier_ReplicatedUsing,
    Specifier_RepRetry,
    Specifier_SaveGame,
    Specifier_SerializeText,
    Specifier_SimpleDisplay,
    Specifier_Transient,
    Specifier_VisibleAnywhere,
    Specifier_VisibleDefaultsOnly,
    Specifier_VisibleInstanceOnly
};
enum VariableType
{
    UE4VAR_INT,
    UE4VAR_BOOL,
    UE4VAR_FLOAT,
    UE4VAR_BYTE,
    UE4VAR_VECTOR,
    UE4VAR_OBJECT,
    UE4VAR_ACTOR,
    UE4VAR_STRING,
    UE4VAR_TEXT,
    UE4VAR_ROTATOR,
    UE4VAR_TRANSFORM,
    UE4VAR_CUSTOM
};

@interface BaseFile : NSObject
@property (nonatomic,readwrite) int ShowIndex;
-(NSString *) RenderOutput;
-(NSString *) RenderOutputHeader;
-(NSString *) RenderOutputCPP;
-(NSString *) GetStringFromSpecifier:(enum PropertySpecifiers) specifier;
-(NSString *) GetStringFromVariableType:(enum VariableType) CustomType;
@end
