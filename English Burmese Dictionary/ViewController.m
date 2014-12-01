//
//  ViewController.m
//  English Burmese Dictionary
//
//  Created by Ehkalu Moo on 11/16/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "ViewController.h"
#import "RecentsTableViewController.h"

@interface ViewController ()

@property (nonatomic) RecentsTableViewController *tableviewController;

@end

@implementation ViewController
NSString *Search;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview.delegate=self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [self.txtSearch becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidUnload
{
    self.webview.delegate=self;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated
{
    if([self checkinternet] == NO)
    {
        // Not connected to the internet
        self.title = @"English-Burmese";
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Please connect to internet!"
                                                          message:@"Please try again when internet connection is available."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        
        [self Search];
        
    }
}
//Check Internet
- (BOOL) checkinternet
{
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.google.com/m"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data)
    {
        NSLog(@"Device is connected to the internet");
        return YES;
    }
    else
    {
        NSLog(@"Device is not connected to the internet");
        return NO;
    }
    
}


-(void)dismissKeyboard {
    // add textfields and textviews
    //[Nameofoutletlikeatextfield resignFirstResponder];
    [self.txtSearch resignFirstResponder];
}

//right-click drag textfield to fileowner select doneediting
//right-click drag textfield to fileowner select delegate
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"header\").style.display=\"none\";"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"bar\").style.display=\"none\";"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"board\").style.display=\"none\";"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"footer\").style.display=\"none\";"];
    //[webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"Thesaurus\").style.display=\"none\";"];
    //[webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"Thesaurus\")[0].style.display=\"none\";"];
    //[webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"Verb, Transitive\")[0].style.display=\"none\";"];
    ////   [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"gimg\")[0].style.display=\"none\";"];
    //  [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"gimgbranding\")[0].style.display=\"none\";"];
    //  [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"gimgwrap\")[0].style.display=\"none\";"];
    //  [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName(\"gimgnav\")[0].style.display=\"none\";"];
    self.txtSearch.text = @"";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtSearch) {
        [textField resignFirstResponder];
        [self Search];
        return NO;
    }
    return YES;
}
- (IBAction)txtSearch:(id)sender {
}
- (void) Search
{
    Search=self.txtSearch.text;
    self.txtSearch.text = @"Please Wait...";
    NSString *txtSearch = [NSString stringWithFormat:@"%@%@", @"http://www.myordbok.com/definition?q=", Search];
    NSURL *url = [NSURL URLWithString:txtSearch];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:req];
    [self dismissKeyboard];
    
    
}
@end
