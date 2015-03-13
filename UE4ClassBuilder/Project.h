//
//  Project.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Project : NSManagedObject

@property (nonatomic, retain) NSString * projectname;
@property (nonatomic, retain) NSDate * creationdate;
@property (nonatomic, retain) NSDate * lastupdate;
@property (nonatomic, retain) NSString * autorname;
@property (nonatomic, retain) NSSet *codeFiles;
@end

@interface Project (CoreDataGeneratedAccessors)

- (void)addCodeFilesObject:(NSManagedObject *)value;
- (void)removeCodeFilesObject:(NSManagedObject *)value;
- (void)addCodeFiles:(NSSet *)values;
- (void)removeCodeFiles:(NSSet *)values;

@end
