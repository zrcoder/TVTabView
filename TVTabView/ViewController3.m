//
//  ViewController3.m
//  TVTabView
//
//  Created by admin on 16/8/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "ViewController3.h"
#import "TVTabView.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *toogle;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(width*0.25, 100, width*0.5, width*0.8);
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:frame];
    tabView.tabLineColor = [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    
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
    tabView.items = @[item1, item2];
    
    [self.view  addSubview:tabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
