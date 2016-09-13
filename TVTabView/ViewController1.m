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

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self createTabView]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (TVTabView *)createTabView {
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(0, 100, width, width);
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:frame];
    tabView.tabHeight = 60;
    tabView.tabHorizontalMargin = 5;
    tabView.tabLineTopMargin = 3;
    tabView.tabBackGroundImageName = @"tabButtonBackground";
    tabView.tabLineColor = [UIColor colorWithWhite:0.9 alpha:1];
    tabView.selectedTabLineColor = nil;
    
    TVItem *starItem = [TVItem new];
    starItem.title = @"Star";
    starItem.selectedImageName = @"star_selected";
    starItem.normalImageName = @"star_normal";
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"⭐️⭐️⭐️⭐️⭐️⭐️⭐️";
    starItem.view = label;
    
    TVItem *discoveryItem = [TVItem new];
    discoveryItem.title = @"Time";
    discoveryItem.normalImageName = @"discovery_normal";
    discoveryItem.selectedImageName = @"discovery_selected";
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor orangeColor];
    discoveryItem.view = imageView;
    
    TVItem *supplierItem = [TVItem new];
    supplierItem.title = @"Supplier";
    supplierItem.selectedImageName = @"supplier_selected";
    supplierItem.normalImageName = @"supplier_normal";
    supplierItem.view = [UIView new];
    
    TVItem *myItem = [TVItem new];
    myItem.title = @"My";
    myItem.selectedImageName = @"my_selected";
    myItem.normalImageName = @"my_normal";
    myItem.view = [UIView new];
    
    tabView.items = @[starItem, discoveryItem, supplierItem, myItem];
    
    return tabView;
}

@end
