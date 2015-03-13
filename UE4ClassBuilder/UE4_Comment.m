//
//  UE4_Comment.m
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 31.10.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import "UE4_Comment.h"

@implementation UE4_Comment
@synthesize CommentText;

-(NSString*) RenderOutput
{
    NSString* output = [NSString stringWithFormat:@"/** %@  */",CommentText];
    return output;
}
@end
