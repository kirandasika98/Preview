//
//  PRHomeFeedViewController.h
//  Preview
//
//  Created by SaiKiran Dasika on 10/05/14.
//  Copyright (c) 2014 Burst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PRHomeFeedViewController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,strong) NSMutableArray *feedPosts;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *showReviewButton;
@property (weak, nonatomic) IBOutlet UILabel *userLocationLabel;


@property (strong,nonatomic) NSTimer *timer;
@property (strong,nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) UIPopoverController *popOver;

- (IBAction)logout:(id)sender;

@property (nonatomic,strong) NSString *IDForRelatedProductPictures;

@property (nonatomic, strong) NSString *likesString;
@property (nonatomic, strong) NSString *reviewsString;
@property (nonatomic, strong) NSMutableArray *searchResults;
@end
