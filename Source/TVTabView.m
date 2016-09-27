//
//  TVTabView.m
//  TVTabView
//
//  Created by admin on 16/8/18.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import "TVTabView.h"

@implementation TVItem
@end

@interface TVCell : UICollectionViewCell
@property (nonatomic, strong) UIView *mainView;
@end
@implementation TVCell
- (void)setMainView:(UIView *)mainView {
    _mainView = mainView;
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    [self.contentView addSubview:mainView];
    mainView.frame = self.bounds;
}
@end

@interface TVTabView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *tabView;
@property (nonatomic, strong) UIView *tabLine;
@property (nonatomic, strong) UIView *tabSelectedLine;
@property (nonatomic, strong) UICollectionView *bodyView;

@property (nonatomic, strong) NSMutableArray* buttons;

@end

@implementation TVTabView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_init];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self p_init];
    }
    return self;
}

- (void)setBodyDragEnable:(BOOL)bodyDragEnable {
    _bodyDragEnable = bodyDragEnable;
    self.bodyView.scrollEnabled = bodyDragEnable;
}

- (void)setItems:(NSArray<TVItem *> *)items {
    _items = items;
    [self p_buildSubViews];
    
}

- (void)p_init {
    self.tabHeight = 44;
    self.bodyTopMargin
    = self.bodyBottomMargin
    = 20;
    self.tabFontSize = 14;
    self.titleColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    self.selectedTitleColor
    = self.selectedTabLineColor
    = [UIColor colorWithRed:33/255.0 green:149/255.0 blue:128/255.0 alpha:1];
}

- (void)p_buildSubViews {
    
    self.currentSelectedIndex = 0;
    for (UIView *view in self.tabView.subviews) {
        [view removeFromSuperview];
    }
    [self.buttons removeAllObjects];
    [self.bodyView reloadData];
    
    if (self.items.count < 1) {
        return;
    }
    
    self.tabView.backgroundColor = self.tabBackGroundColor;
    self.tabLine.backgroundColor = self.tabLineColor;
    self.tabSelectedLine.backgroundColor = self.selectedTabLineColor;
    
    NSInteger count = self.items.count;
    CGFloat buttonWidth = (self.p_width - self.tabHorizontalMargin * (count + 1)) / count;
    
    [self.items enumerateObjectsUsingBlock:^(TVItem *item, NSUInteger i, BOOL *stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.tabHorizontalMargin + (buttonWidth + self.tabHorizontalMargin) * i, 0, buttonWidth, self.tabHeight - self.tabLineTopMargin);
        button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        button.titleLabel.font = [UIFont systemFontOfSize:self.tabFontSize];
        [button setTitleColor:self.titleColor forState:UIControlStateNormal];
        [button setTitleColor:self.selectedTitleColor forState:UIControlStateSelected];
        button.tag = i;
        [button addTarget:self action:@selector(p_tabTapped:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:item.title forState:UIControlStateNormal];
        [button setTitle:item.title forState:UIControlStateSelected];
        if (item.normalImage) {
            [button setImage:item.normalImage forState:UIControlStateNormal];
            CGSize imageSize = button.imageView.frame.size;
            CGSize titileSize = button.titleLabel.frame.size;
            [button setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height ,-imageSize.width, 0.0, 0.0)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(-titileSize.height, 0.0, 0.0, -titileSize.width)];
        }
        if (item.selectedImage) {
            [button setImage:item.selectedImage forState:UIControlStateSelected];
        }
        if (self.tabBackGroundImageName) {
            [button setBackgroundImage:[UIImage imageNamed:self.tabBackGroundImageName] forState:UIControlStateSelected];
            button.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        }
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        [self.tabView addSubview:button];
        [self.buttons addObject:button];
        if (i==0) {
            button.selected = YES;
        }
    }];
    [self p_tappedTabWithIndex:0];
}

- (void)p_tabTapped:(UIButton *)button {
    [self p_tappedTabWithIndex:button.tag];
}
- (void)p_tappedTabWithIndex:(NSInteger)index {
    if (_currentSelectedIndex == index) {
        return;
    }
    UIButton *preBtn = self.buttons[_currentSelectedIndex];
    UIButton *currentBtn = self.buttons[index];
    _currentSelectedIndex = index;
    
    [UIView animateWithDuration:0.3 animations:^{
        preBtn.selected = NO;
        currentBtn.selected = YES;
        self.tabSelectedLine.center = CGPointMake(currentBtn.center.x, self.tabSelectedLine.center.y);
    }];
    [self p_scrollBody];
    
    
    TVItem *item = self.items[index];
    if (item.tabSelectedAction) {
        item.tabSelectedAction();
    }
}

- (void)p_scrollBody {
    CGPoint point = CGPointMake(self.p_width * self.currentSelectedIndex, 0);
    [self.bodyView setContentOffset:point animated:YES];
}

- (CGFloat)p_width {
    return self.frame.size.width;
}
- (CGFloat)p_height {
    return self.frame.size.height;
}

#pragma mark - CollectionView Datasource and Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TVCell" forIndexPath:indexPath];
    cell.mainView = self.items[indexPath.row].view;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.bodyView) {
        TVItem *item = self.items[indexPath.row];
        if (item.bodyTappedAction) {
            item.bodyTappedAction();
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.bodyView) {
        NSInteger index = (NSInteger)scrollView.contentOffset.x / self.p_width;
        [self p_tappedTabWithIndex:index];
    }
}

#pragma mark - Getters and Setters

- (void)setCurrentSelectedIndex:(NSInteger)currentSelectedIndex {
    [self p_tappedTabWithIndex:currentSelectedIndex];
}

- (UIView *)tabView {
    if (_tabView == nil) {
        CGRect frame = CGRectMake(0, 0, self.p_width, self.tabHeight);
        _tabView = [[UIView alloc] initWithFrame:frame];
        [self addSubview:_tabView];
    }
    return _tabView;
}

- (UIView *)tabLine {
    if (_tabLine == nil) {
        CGRect frame = CGRectMake(0, self.tabHeight - 1, self.p_width, 1);
        _tabLine = [[UIView alloc] initWithFrame:frame];
        [self addSubview:_tabLine];
        [_tabLine addSubview:self.tabSelectedLine];
    }
    return _tabLine;
}

- (UIView *)tabSelectedLine {
    if (_tabSelectedLine == nil) {
        NSInteger count = self.items.count;
        CGRect frame = CGRectMake(self.tabHorizontalMargin, 0, (self.p_width - self.tabHorizontalMargin * (count + 1)) / count, 1);
        _tabSelectedLine = [[UIView alloc] initWithFrame:frame];
        [self addSubview:_tabSelectedLine];
    }
    return _tabSelectedLine;
}

- (UICollectionView *)bodyView {
    if (_bodyView == nil) {
        CGRect bodyFrame = CGRectMake(0,
                                      self.tabHeight + self.bodyTopMargin,
                                      self.p_width,
                                      self.p_height - self.tabHeight - self.bodyTopMargin - self.bodyBottomMargin);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing
        = layout.minimumInteritemSpacing
        = 0.000001f;
        layout.itemSize = bodyFrame.size;
        
        _bodyView = [[UICollectionView alloc] initWithFrame:bodyFrame collectionViewLayout:layout];
        _bodyView.backgroundColor = [UIColor clearColor];
        [_bodyView registerClass:[TVCell class] forCellWithReuseIdentifier:@"TVCell"];
        _bodyView.delaysContentTouches = NO;
        _bodyView.dataSource = self;
        _bodyView.delegate = self;
        _bodyView.pagingEnabled = YES;
        _bodyView.userInteractionEnabled = YES;
        _bodyView.bounces = NO;
        _bodyView.showsHorizontalScrollIndicator = NO;
        _bodyView.autoresizingMask = UIViewAutoresizingFlexibleHeight
        | UIViewAutoresizingFlexibleWidth
        | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:_bodyView];
    }
    return _bodyView;
}

- (NSMutableArray *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray arrayWithCapacity:self.items.count];
    }
    return _buttons;
}
@end
