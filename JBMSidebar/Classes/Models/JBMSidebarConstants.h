//
//  JBMSidebarConstants.h
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBMSidebarConstants : NSObject

extern NSString *const JBMSidebarModelFilename;
extern NSString *const JBMSidebarSelectedIndex;
    extern float const JBMSidebarRevealCellHeight;
extern NSString *const JBMSidebarRevealCellIdentifier;

    extern float const JBMSidebar_animationDuration;
    extern float const JBMSidebar_navigationBarBottomLine_height;
    extern float const JBMSidebarNavigationBar_amendedSizeHeight;

    extern float const JBMSidebarViewController_rearViewRevealWidth;
    extern float const JBMSidebarViewController_rearViewRevealDisplacement;
    extern float const JBMSidebarViewController_rearViewRevealOverdraw;
    extern float const JBMSidebarViewController_toggleAnimationDuration;
    extern float const JBMSidebarViewController_revealToggle_afterDelay;

extern NSString *const JBMSidebarContentNavigationController_navigationBar_barTintColorString;
    extern float const JBMSidebarContentNavigationController_indicatorImageView_yOrigin;
extern NSString *const JBMSidebarContentNavigationController_navigationBarBottomLine_backgroundColorString;
extern NSString *const JBMSidebarContentNavigationController_indicatorImageName;

extern NSString *const JBMSidebarContentController_backgroundColorString;
extern NSString *const JBMSidebarContentController_sidebarBarButtonItem_imageName;
extern NSString *const JBMSidebarContentController_listBarButtonItem_imageName;
extern NSString *const JBMSidebarContentController_optionsBarButtonItem_imageName;
extern NSString *const JBMSidebarContentController_barButtonItem_tintColorString;
    extern float const JBMSidebarContentController_titleViewLabel_frameHeight;
    extern float const JBMSidebarContentController_titleViewLabel_fontSize;
extern NSString *const JBMSidebarContentController_titleViewLabel_textColorString;
    extern float const JBMSidebarContentController_titleViewLabel_imageViewHeightToWidth;

extern NSString *const JBMSidebarRevealNavigationController_navigationBar_barTintColorString;
extern NSString *const JBMSidebarRevealNavigationController_navigationBarBottomLine_backgroundColorString;

extern NSString *const JBMSidebarRevealController_backgroundColorString;
    extern float const JBMSidebarRevealController_tableViewContentInsetY;
    extern float const JBMSidebarRevealController_selectedIndexView_frameOriginX;
    extern float const JBMSidebarRevealController_selectedIndexView_frameOriginY;
    extern float const JBMSidebarRevealController_selectedIndexView_frameSizeWidth;
    extern float const JBMSidebarRevealController_selectedIndexView_frameSizeHeight;
extern NSString *const JBMSidebarRevealController_selectedIndexView_backgroundColorString;
    extern float const JBMSidebarRevealController_selectedIndexView_cornerRadius;
    extern float const JBMSidebarRevealController_titleViewLabel_frameWidthAmmend;
    extern float const JBMSidebarRevealController_titleViewLabel_frameHeight;
    extern float const JBMSidebarRevealController_titleViewLabel_fontSize;
extern NSString *const JBMSidebarRevealController_titleViewLabel_textColorString;

    extern float const JBMSidebarRevealCell_alphaSelected;
    extern float const JBMSidebarRevealCell_alphaDeselected;
    extern float const JBMSidebarRevealCell_imageView_frameOriginX;
    extern float const JBMSidebarRevealCell_imageView_frameOriginY;
    extern float const JBMSidebarRevealCell_textLabel_frameOriginX;
    extern float const JBMSidebarRevealCell_textLabel_frameOriginY;
extern NSString *const JBMSidebarRevealCell_textLabelTextColor;
    extern float const JBMSidebarRevealCell_textLabelFontSize;

    extern float const JBMSidebarRevealCell_touchView_frameOriginX;
    extern float const JBMSidebarRevealCell_touchView_frameOriginY;
    extern float const JBMSidebarRevealCell_touchView_frameSizeWdith;
    extern float const JBMSidebarRevealCell_touchView_frameSizeHeight;
extern NSString *const JBMSidebarRevealCell_touchView_fillColorString;
    extern float const JBMSidebarRevealCell_touchView_cornerRadius;

@end
