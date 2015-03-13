//
//  AddBlocksTableViewCell.h
//  UE4ClassBuilder
//
//  Created by Tim Koepsel on 01.11.14.
//  Copyright (c) 2014 xzessmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddBlocksTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *BlockTitle;
@property (strong, nonatomic) IBOutlet UILabel *BlockSubTitle;
@property (strong, nonatomic) IBOutlet UIImageView *BlockImage;

@end
