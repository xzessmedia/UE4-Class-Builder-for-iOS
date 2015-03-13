//
//  Block.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CodeFile;

@interface Block : NSManagedObject

@property (nonatomic, retain) NSNumber * blocktype;
@property (nonatomic, retain) NSString * codecpp;
@property (nonatomic, retain) NSString * codeheader;
@property (nonatomic, retain) NSNumber * showindex;
@property (nonatomic, retain) NSNumber * location;
@property (nonatomic, retain) CodeFile *codeFile;

@end
