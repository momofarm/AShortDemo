//
//  WebViewController.h
//  AShortDemo
//
//  Created by momofarm on 4/24/16.
//  Copyright © 2016 Chen Kuanfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
{
    NSString *url;
    UIWebView *webview;
    
}
@property NSString *url;
@property (strong, nonatomic, readwrite) IBOutlet UIWebView *webview;

@end
