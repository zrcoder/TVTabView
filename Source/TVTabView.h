//
//  TVTabView.h
//  TVTabView
//
//  Created by admin on 16/8/18.
//  Copyright © 2016年 Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVItem : NSObject

typedef void(^TVAction)();

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, copy) TVAction tabSelectedAction;
@property (nonatomic, copy) TVAction bodyTappedAction;

@end


@interface TVTabView : UIView

/**
 *  Default is 44
 */
@property (nonatomic, assign) CGFloat tabHeight;

/**
 *  Default is 20
 */
@property (nonatomic, assign) CGFloat bodyTopMargin;

/**
 *  Default is 20
 */
@property (nonatomic, assign) CGFloat bodyBottomMargin;

/**
 *  Default is clear color
 */
@property (nonatomic, copy) UIColor *tabBackGroundColor;

/**
 *  Default is 14
 */
@property (nonatomic, assign) CGFloat tabFontSize;

/**
 *  Default is black (red:51 green:51 blue: 51 --#333333)
 */
@property (nonatomic, copy) UIColor *titleColor;
/**
 *  Default is green (red:33 green:149 blue: 128 --#219580)
 */
@property (nonatomic, copy) UIColor *selectedTitleColor;

/**
 *  Default is gray (red:225 green:225 blue:225 --#e1e1e1)
 */
@property (nonatomic, copy) UIColor *tabLineColor;
/**
 *  Default is the same as selectedTitleColor default - green (red:33 green:149 blue:128 --#219580)
 */
@property (nonatomic, copy) UIColor *selectedTabLineColor;

/**
 *  After setted, we will begin to build subviews(buttons, or views in body)
 */
@property (nonatomic, strong) NSArray<TVItem *> * items;


/**
 *  If you set it, the buttons and views in the body will scroll autollicly.
 */
@property (nonatomic, assign) NSInteger currentSelectedIndex;

@end

