//
//  BlocksTableViewCell.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlocksTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *BlocksImage;
@property (strong, nonatomic) IBOutlet UILabel *BlockType;
@property (strong, nonatomic) IBOutlet UILabel *BlockIndex;
@property (strong, nonatomic) IBOutlet UILabel *BlockPosition;

@end
