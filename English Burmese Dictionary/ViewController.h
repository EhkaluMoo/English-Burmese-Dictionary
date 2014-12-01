//
//  ViewController.h
//  English Burmese Dictionary
//
//  Created by Ehkalu Moo on 11/16/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
- (IBAction)txtSearch:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

-(IBAction) doneEditing:(id) sender;
@end

