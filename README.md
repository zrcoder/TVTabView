# TVTabView
Handy Tab view.
---
UICollectionView used as containner.<br><br><br><br>
![TV1](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/1.png)<t>     ![TV0](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/0.png)
Usage:
---
1. As a containner of views:
```
CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(width*0.25, 100, width*0.5, width*0.8);
    self.tabView = [[TVTabView alloc] initWithFrame:frame];
    
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
```
2. As a containner of viewControllers:
```
   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ViewController1 *vc1 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController1"];
    ViewController2 *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    ViewController3 *vc3 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController3"];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:screenBounds];
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
```
