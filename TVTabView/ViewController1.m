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
    tabView.tabBackGroundImage = [UIImage imageNamed:@"tabButtonBackground"];
    tabView.tabLineColor = [UIColor colorWithWhite:0.9 alpha:1];
    tabView.selectedTabLineColor = nil;
    
    TVItem *starItem = [TVItem new];
    starItem.title = @"Star";
    starItem.selectedImage = [UIImage imageNamed:@"star_selected"];
    starItem.normalImage = [UIImage imageNamed:@"star_normal"];
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"⭐️⭐️⭐️⭐️⭐️⭐️⭐️";
    starItem.view = label;
    
    TVItem *discoveryItem = [TVItem new];
    discoveryItem.title = @"Time";
    discoveryItem.normalImage = [UIImage imageNamed:@"discovery_normal"];
    discoveryItem.selectedImage = [UIImage imageNamed:@"discovery_selected"];
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor orangeColor];
    discoveryItem.view = imageView;
    
    TVItem *supplierItem = [TVItem new];
    supplierItem.title = @"Supplier";
    supplierItem.selectedImage = [UIImage imageNamed:@"supplier_selected"];
    supplierItem.normalImage = [UIImage imageNamed:@"supplier_normal"];
    supplierItem.view = [UIView new];
    
    TVItem *myItem = [TVItem new];
    myItem.title = @"My";
    myItem.selectedImage = [UIImage imageNamed:@"my_selected"];
    myItem.normalImage = [UIImage imageNamed:@"my_normal"];
    myItem.view = [UIView new];
    
    tabView.items = @[starItem, discoveryItem, supplierItem, myItem];
    
    return tabView;
}

@end
