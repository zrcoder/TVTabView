//
//  ViewController1.m
//  TVTabView
//
//  Created by admin on 16/8/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "ViewController1.h"
#import "TVTabView.h"

@interface ViewController1 ()

@property (strong, nonatomic) TVTabView *tabView;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(width*0.25, 100, width*0.5, width*0.8);
    self.tabView = [[TVTabView alloc] initWithFrame:frame];
    self.tabView.tabLineColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    
    TVItem *item1 = [TVItem new];
    item1.title = @"First";
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"First view";
    item1.view = label;
    
    TVItem *item2 = [TVItem new];
    item2.title = @"Last";
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor orangeColor];
    item2.view = imageView;
    item2.tabSelectedAction = ^{
        NSLog(@"Second Tab Selected.");
    };
    item2.bodyTappedAction = ^{
        NSLog(@"Second View Tapped.");
    };
    self.tabView.items = @[item1, item2];
    
    [self.view  addSubview:self.tabView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
