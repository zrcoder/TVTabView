//
//  ViewController.m
//  TVTabView
//
//  Created by admin on 16/8/18.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "ViewController.h"
#import "TVTabView.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController1 *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
    ViewController2 *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    ViewController3 *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController3"];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:screenBounds];
    tabView.tabHorizontalMargin = 5;
    tabView.bodyBottomMargin = 0;
    
    TVItem *item1 = [TVItem new];
    item1.title = @"controller 1";
    item1.view = vc1.view;
    
    TVItem *item2 = [TVItem new];
    item2.title = @"controller 2";
    item2.view = vc2.view;
    item2.tabSelectedAction = ^{
        static BOOL loaded = NO;
        if (!loaded) {
            loaded = YES;
            [vc2 loadData];
        }
    };
    
    TVItem *item3 = [TVItem new];
    item3.title = @"controller 3";
    item3.view = vc3.view;
    
    tabView.items = @[item1, item2, item3];
    
    
    [self.view  addSubview:tabView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
