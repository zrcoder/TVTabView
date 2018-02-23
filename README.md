# TVTabView
Handy Tab View.
---
![TV1](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/1.png)............
![TV2](https://github.com/DingHub/ScreenShots/blob/master/TVTabView/2.png)
Usage:
---
1). As a containner of views:
```objective-c
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
```
2). As a containner of viewControllers:
```objective-c
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
```
Pod surppoted:
```
target 'YourTarget' do
pod 'TVTabView'
end
```
You can find a Swift version here:[TabView](https://github.com/DingHub/TabView)
