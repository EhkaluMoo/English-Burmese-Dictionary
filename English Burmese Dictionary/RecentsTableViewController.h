//
//  RecentTableViewController.h
//  English Burmese Dictionary
//
//  Created by Ehkalu Moo on 11/27/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *RecentSearchesKey;

@class RecentsTableViewController;

@protocol RecentDelegate
// sent when the user selects a row in the recent searches list
- (void)recentSearchesController:(RecentsTableViewController *)controller didSelectString:(NSString *)searchString;
@end

#pragma mark -

@interface RecentsTableViewController : UITableViewController <UIActionSheetDelegate, RecentDelegate>

@property (nonatomic, weak) id <RecentDelegate> delegate;

@property (nonatomic, readonly) UIActionSheet *confirmSheet;

- (void)filterResultsUsingString:(NSString *)filterString;
- (void)addToRecentSearches:(NSString *)searchString;

@end
