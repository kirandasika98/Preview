//
//  PRLeaderBoardViewController.h
//  Preview
//
//  Created by SaiKiran Dasika on 22/10/14.
//  Copyright (c) 2014 Burst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PRLeaderBoardViewController : UITableViewController



@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSArray *allUsers;
@end
