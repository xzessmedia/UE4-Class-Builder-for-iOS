//
//  CodeFile.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Block, Project;

@interface CodeFile : NSManagedObject

@property (nonatomic, retain) NSString * codeCPP;
@property (nonatomic, retain) NSString * codeHeader;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSDate * lastUpdate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *codeBlocks;
@property (nonatomic, retain) Project *project;
@end

@interface CodeFile (CoreDataGeneratedAccessors)

- (void)addCodeBlocksObject:(Block *)value;
- (void)removeCodeBlocksObject:(Block *)value;
- (void)addCodeBlocks:(NSSet *)values;
- (void)removeCodeBlocks:(NSSet *)values;

@end
