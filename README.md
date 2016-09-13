# TVTabView
Handy Tab View.
---
![TV1](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/1.png)........
![TV2](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/2.png)
Usage:
---
1. As a containner of views:
```
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(0, 100, width, width);
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:frame];
    tabView.tabHeight = 60;
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
    discoveryItem.title = @"Discovery";
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
Pod surppoted:
```
target 'YourTarget' do
pod 'TVTabView'
end
```
You can find a Swift version here:[TabView](https://github.com/DingHub/TabView)
