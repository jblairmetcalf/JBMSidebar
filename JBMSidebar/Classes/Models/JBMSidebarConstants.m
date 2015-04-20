//
//  JBMSidebarConstants.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarConstants.h"

@implementation JBMSidebarConstants

/*
 * App-wide used constants.
 */
NSString *const JBMSidebarModelFilename = @"JBMSidebarModel.json";
NSString *const JBMSidebarSelectedIndex = @"JBMSidebarSelectedIndex";
    float const JBMSidebarRevealCellHeight = 60.0f;
NSString *const JBMSidebarRevealCellIdentifier = @"JBMSidebarRevealCellIdentifier";

    float const JBMSidebar_animationDuration = 0.3f;
    float const JBMSidebar_navigationBarBottomLine_height = 1.0f;
    float const JBMSidebarNavigationBar_amendedSizeHeight;

/*
 * Settings for animating and positioning the sidebar.
 */
    float const JBMSidebarViewController_rearViewRevealWidth = 260.0f;
    float const JBMSidebarViewController_rearViewRevealDisplacement = 0.0f;
    float const JBMSidebarViewController_rearViewRevealOverdraw = 60.0f;
    float const JBMSidebarViewController_toggleAnimationDuration = 0.2f;
    float const JBMSidebarViewController_revealToggle_afterDelay = 0.35f;

/*
 * Main content area styling and positioning.
 */
NSString *const JBMSidebarContentNavigationController_navigationBar_barTintColorString = @"#eeeeee";
    float const JBMSidebarContentNavigationController_indicatorImageView_yOrigin = 92.0f;
NSString *const JBMSidebarContentNavigationController_navigationBarBottomLine_backgroundColorString = @"#d0d0d0";
NSString *const JBMSidebarContentNavigationController_indicatorImageName = @"JBMSidebarContentNavigationController-indicatorImage";

NSString *const JBMSidebarContentController_backgroundColorString = @"#f5f5f5";
NSString *const JBMSidebarContentController_sidebarBarButtonItem_imageName = @"JBMSidebarContentController-sidebarBarButtonItem";
NSString *const JBMSidebarContentController_listBarButtonItem_imageName = @"JBMSidebarContentController-listBarButtonItem";
NSString *const JBMSidebarContentController_optionsBarButtonItem_imageName = @"JBMSidebarContentController-optionsBarButtonItem";
NSString *const JBMSidebarContentController_barButtonItem_tintColorString = @"#a3a1a2";
    float const JBMSidebarContentController_titleViewLabel_frameHeight = 25.0f;
    float const JBMSidebarContentController_titleViewLabel_fontSize = 20.0f;
NSString *const JBMSidebarContentController_titleViewLabel_textColorString = @"#4a4a4a";
    float const JBMSidebarContentController_titleViewLabel_imageViewHeightToWidth = 1.33333333333333;

/*
 * Sidebar navigation bar styling.
 */
NSString *const JBMSidebarRevealNavigationController_navigationBar_barTintColorString = @"#343233";
NSString *const JBMSidebarRevealNavigationController_navigationBarBottomLine_backgroundColorString = @"#262627";

NSString *const JBMSidebarRevealController_backgroundColorString = @"#343233";
    float const JBMSidebarRevealController_tableViewContentInsetY = 10.0f;
    float const JBMSidebarRevealController_selectedIndexView_frameOriginX = 16.0f;
    float const JBMSidebarRevealController_selectedIndexView_frameOriginY = 8.0f;
    float const JBMSidebarRevealController_selectedIndexView_frameSizeWidth = 228.0f;
    float const JBMSidebarRevealController_selectedIndexView_frameSizeHeight = 48.0f;
NSString *const JBMSidebarRevealController_selectedIndexView_backgroundColorString = @"#242324";
    float const JBMSidebarRevealController_selectedIndexView_cornerRadius = 1.0f;
    float const JBMSidebarRevealController_titleViewLabel_frameWidthAmmend = -54.0f;
    float const JBMSidebarRevealController_titleViewLabel_frameHeight = 25.0f;
    float const JBMSidebarRevealController_titleViewLabel_fontSize = 20.0f;
NSString *const JBMSidebarRevealController_titleViewLabel_textColorString = @"#e6e7e8";

/*
 * Sidebar cell styling and positioning.
 */
    float const JBMSidebarRevealCell_alphaSelected = 1.0f;
    float const JBMSidebarRevealCell_alphaDeselected = 0.5f;
    float const JBMSidebarRevealCell_imageView_frameOriginX = 27.0f;
    float const JBMSidebarRevealCell_imageView_frameOriginY = 19.0f;
    float const JBMSidebarRevealCell_textLabel_frameOriginX = 80.0f;
    float const JBMSidebarRevealCell_textLabel_frameOriginY = 1.0f;
NSString *const JBMSidebarRevealCell_textLabelTextColor = @"#ffffff";
    float const JBMSidebarRevealCell_textLabelFontSize = 14.0f;

/*
 * Resuseable touch view styling.
 */
    float const JBMSidebarRevealCell_touchView_frameOriginX = 16.0f;
    float const JBMSidebarRevealCell_touchView_frameOriginY = 8.0f;
    float const JBMSidebarRevealCell_touchView_frameSizeWdith = 228.0f;
    float const JBMSidebarRevealCell_touchView_frameSizeHeight = 48.0f;
NSString *const JBMSidebarRevealCell_touchView_fillColorString = @"#242324";
    float const JBMSidebarRevealCell_touchView_cornerRadius = 1.0f;

@end
