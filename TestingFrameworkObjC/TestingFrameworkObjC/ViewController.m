//
//  ViewController.m
//  TestingFrameworkObjC
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import "ViewController.h"
#import <BeaconnectcrKit/BeaconnectcrKit.h>
#import "AppDelegate.h"

@interface ViewController () <UIWebViewDelegate>
@property (nonatomic,strong) UIViewController *webViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
  
  AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
  if (!appdelegate.localNotificationReceived) {
    // Sending a local notification
    [BCUtils sendLocalNotificationWithMessage:@"Promo en tienda" fireDateSinceNow:10 url:@"https://www.google.com/" timeZone:[NSTimeZone defaultTimeZone] inApplication:[UIApplication sharedApplication]];
  }
  
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
  if (appdelegate.localNotificationReceived) {
    [self showLocalNotification:appdelegate.localNotificationReceived];
    appdelegate.localNotificationReceived = nil;
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)showLocalNotification:(UILocalNotification*)localNotification{

  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button addTarget:self
             action:@selector(dismissWebViewController:)
   forControlEvents:UIControlEventTouchUpInside];
  [button setTitle:@"Cerrar" forState:UIControlStateNormal];
  button.translatesAutoresizingMaskIntoConstraints = NO;
  
  self.webViewController = [BCUtils insertWebViewInViewController:self withUrl:localNotification.userInfo[@"urlToLoad"] withWebViewDelegate:self andCloseButton:button];
}

- (IBAction)dismissWebViewController:(id)sender{
  [self.webViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
