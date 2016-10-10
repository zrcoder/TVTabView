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

// Another style of tab button
@property (nonatomic, strong) UIImage *normalImage;//If is nil, there will be no image on the tap button.
@property (nonatomic, strong) UIImage *selectedImage;

@end


@interface TVTabView : UIView

@property (nonatomic, assign) CGFloat tabHeight;    //  Default is 44

@property (nonatomic, assign) CGFloat tabHorizontalMargin; // Default is 0

@property (nonatomic, assign) CGFloat tabLineTopMargin; // Default is 0

@property (nonatomic, assign) CGFloat bodyTopMargin;    //  Default is 20

@property (nonatomic, assign) CGFloat bodyBottomMargin;    //  Default is 20

@property (nonatomic, copy) UIColor *tabBackGroundColor;    //  Default is nil

@property (nonatomic, strong) UIImage *tabBackGroundImage; // Default is nil

@property (nonatomic, assign) CGFloat tabFontSize;    //  Default is 14

@property (nonatomic, copy) UIColor *titleColor;    //  Default is black (red:51 green:51 blue: 51 --#333333)

@property (nonatomic, copy) UIColor *selectedTitleColor;    //  Default is green (red:33 green:149 blue: 128 --#219580)

@property (nonatomic, copy) UIColor *tabLineColor;    //  Default is nil

@property (nonatomic, copy) UIColor *selectedTabLineColor;    //  Default is the same as selectedTitleColor default - green (red:33 green:149 blue:128 --#219580)

@property (nonatomic, assign) BOOL bodyDragEnable; // Default is YES

/**
 *  After setted, we will begin to build subviews(buttons, or views in body)
 */
@property (nonatomic, strong) NSArray<TVItem *> * items;

/**
 *  If you set it, the buttons and views in the body will scroll autollicly.
 */
@property (nonatomic, assign) NSInteger currentSelectedIndex;

@end

