//
//  BCUtils.m
//  BeaconnectcrKit
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import "BCUtils.h"

@implementation BCUtils

+ (UIViewController*) insertWebViewInViewController:(UIViewController *)viewController withUrl:(NSString*)urlString withWebViewDelegate:(id<UIWebViewDelegate>) delegate andCloseButton:(UIButton*)closeButton{
  
  UIViewController *myViewController = [[UIViewController alloc]init];
  UIView *view = [[UIView alloc]initWithFrame:viewController.view.frame];
  myViewController.view = view;

  UIWebView *webView = [[UIWebView alloc]init];
  [view addSubview:webView];
  [view addSubview:closeButton];
  
  webView.translatesAutoresizingMaskIntoConstraints = NO;
  NSURL *url = [[NSURL alloc]initWithString:urlString];
  NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
  [webView loadRequest:urlRequest];

  if (delegate) {
    webView.delegate = delegate;
  }
  
  NSDictionary *views = NSDictionaryOfVariableBindings(webView,closeButton);
  NSArray *constraints = [NSArray array];

  //Webview constraints
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:views]];
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:views]];
  
  //Close button constraints
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[closeButton(30)]" options:0 metrics:nil views:views]];
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[closeButton(100)]-10-|" options:0 metrics:nil views:views]];
  
  
  
  [view addConstraints:constraints];
  [viewController presentViewController:myViewController animated:YES completion:nil];
  return viewController;
}

+ (void)sendLocalNotificationWithMessage:(NSString*)message fireDateSinceNow:(NSTimeInterval)secs url:(NSString*)url timeZone:(NSTimeZone*)timeZone inApplication:(UIApplication*)application{
  UILocalNotification* localNotification = [[UILocalNotification alloc] init];
  localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:secs];
  localNotification.alertBody = message;
  localNotification.userInfo = @{ @"urlToLoad" : url};
  localNotification.timeZone = timeZone;
  [application scheduleLocalNotification:localNotification];
}

@end
