//
//  BCUtils.m
//  BeaconnectcrKit
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import "BCUtils.h"

@implementation BCUtils

+ (void) insertWebViewInView: (UIView *)view withUrl:(NSString*)urlString andWebViewDelegate:(id<UIWebViewDelegate>) delegate{
  UIWebView *webView = [[UIWebView alloc]init];
  [view addSubview:webView];
  webView.translatesAutoresizingMaskIntoConstraints = NO;
  NSURL *url = [[NSURL alloc]initWithString:urlString];
  NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
  [webView loadRequest:urlRequest];
  if (delegate) {
    webView.delegate = delegate;
  }
  NSDictionary *views = NSDictionaryOfVariableBindings(webView);
  NSArray *constraints = [NSArray array];
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:views]];
  constraints = [constraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:views]];
  
  [view addConstraints:constraints];
}

@end
