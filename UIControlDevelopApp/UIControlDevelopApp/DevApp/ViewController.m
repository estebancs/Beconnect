//
//  ViewController.m
//  UIControlDevelopApp
//
//  Created by Esteban Chavarria Solano on 11/15/15.
//  Copyright © 2015 movilmultimedia. All rights reserved.
//

#import "ViewController.h"
#import <BeaconnectcrKit/BeaconnectcrKit.h>

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
  [BCUtils insertWebViewInView: (UIView *)self.view withUrl:@"https://www.google.com/" andWebViewDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
