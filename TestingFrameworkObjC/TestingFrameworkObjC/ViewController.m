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

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor redColor];
  
  // Sending a local notification
  UILocalNotification* localNotification = [[UILocalNotification alloc] init];
  localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:20];
  localNotification.alertBody = @"Promo en tienda";
  localNotification.userInfo = @{ @"urlToLoad" : @"https://www.google.com/"};
  localNotification.timeZone = [NSTimeZone defaultTimeZone];
  [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
  
  AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
  if (appdelegate.localNotificationReceived) {
    [self showLocalNotification:appdelegate.localNotificationReceived];
    appdelegate.localNotificationReceived = nil;
  }
  
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)showLocalNotification:(UILocalNotification*)localNotification{
  [BCUtils insertWebViewInView: (UIView *)self.view withUrl:localNotification.userInfo[@"urlToLoad"] andWebViewDelegate:self];
}

@end
