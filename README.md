# TVTabView
Handy Tab view.<br>

Usage:
---
```
CGRect frame = CGRectMake(0, 100, self.view.frame.size.width, 260);
    TVTabView *tabView = [[TVTabView alloc] initWithFrame:frame];
    
    //  Make items
    
    //  1.If we have same kind of pages:
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i <= 5; i++) {
        TVItem *item = [TVItem new];
        item.title = [NSString stringWithFormat:@"Tab %d", i];
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        item.view = label;
        label.text = [NSString stringWithFormat:@"Page %d", i];
        item.tabSelectedAction = ^{
            NSLog(@"Tab %d is selected", i);
        };
        item.bodyTappedAction = ^{
            NSLog(@"Page %d is tapped.", i);
        };
        [array addObject:item];
    }
    tabView.items = array;
    
    //  2.Else if we have diffrent kind of pages:
    /*
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
     */
    
    [self.view  addSubview:tabView];
    self.view.backgroundColor = [UIColor whiteColor];


```
