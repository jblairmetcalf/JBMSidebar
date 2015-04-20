//
//  JBMSidebarContentController.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarContentController.h"
#import "SWRevealViewController.h"
#import "UIColor+Utility.h"
#import "JBMSidebarConstants.h"
#import "JBMSidebarModel.h"

@interface JBMSidebarContentController ()

@property (nonatomic, strong) UIBarButtonItem *sidebarBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *listBarButtonItem;
@property (nonatomic, strong) UIBarButtonItem *optionsBarButtonItem;
@property (nonatomic, strong) UILabel *titleViewLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JBMSidebarContentController

#pragma mark - Override Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.leftBarButtonItem = self.sidebarBarButtonItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * Add gestures to the sidebar so the user
     * can open the sidebar with a swipe and
     * close it with a tap on the main content.
     */
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    NSString *backgroundColorString = JBMSidebarContentController_backgroundColorString;
    
    self.view.backgroundColor = [UIColor colorWithHexString:backgroundColorString];
}

#pragma mark - Public Methods

- (void)setData:(NSDictionary *)data {
    _data = data;
    
    [self setTitle];
}

- (void)setContentIndex:(NSInteger)contentIndex {
    _contentIndex = contentIndex;
    
    [self setTitle];
    [self setRightBarButtonItems];
    [self setImageViewImage];
}

#pragma mark - Private Methods

- (void)setTitle {
    self.titleViewLabel.text = self.data[JBMSidebarModelSections][self.contentIndex][JBMSidebarModelContentTitle];
    
    self.navigationItem.titleView = self.titleViewLabel;
}

/*
 * You can set the navigation bar button items in the JBMSidebarModel.json
 * "navigationItemLayout": true and "navigationItemOptions": true will display those icons
 * in the navigation bar.
 */
- (void)setRightBarButtonItems {
    NSDictionary *section = self.data[JBMSidebarModelSections][self.contentIndex];
    
    NSMutableArray *rightBarButtonItems = [NSMutableArray new];
    
    if (section[JBMSidebarModelNavigationItemOptions]) {
        [rightBarButtonItems addObject:self.optionsBarButtonItem];
    }
    
    if (section[JBMSidebarModelNavigationItemLayout]) {
        [rightBarButtonItems addObject:self.listBarButtonItem];
    }
    
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
}

- (void)setImageViewImage {
    NSDictionary *section = self.data[JBMSidebarModelSections][self.contentIndex];
    UIImage *imageViewImage = [UIImage imageNamed:section[JBMSidebarModelContentImage]];
    
    self.imageView.image = imageViewImage;
}

#pragma mark - Interaction Methods

- (IBAction)sidebarTouched:(id)sender {
    [self.revealViewController revealToggleAnimated:YES];
}

#pragma mark - Instantiation Methods

- (UIBarButtonItem *)sidebarBarButtonItem {
    if (!_sidebarBarButtonItem) {
        NSString *imageName = JBMSidebarContentController_sidebarBarButtonItem_imageName;
        NSString *tintColorString = JBMSidebarContentController_barButtonItem_tintColorString;
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        _sidebarBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(sidebarTouched:)];
        
        _sidebarBarButtonItem.tintColor = [UIColor colorWithHexString:tintColorString];
    }
    return _sidebarBarButtonItem;
}

- (UIBarButtonItem *)listBarButtonItem {
    if (!_listBarButtonItem) {
        NSString *imageName = JBMSidebarContentController_listBarButtonItem_imageName;
        NSString *tintColorString = JBMSidebarContentController_barButtonItem_tintColorString;
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        _listBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image
                                                              style:UIBarButtonItemStylePlain
                                                             target:nil
                                                             action:nil];
        
        _listBarButtonItem.tintColor = [UIColor colorWithHexString:tintColorString];
    }
    return _listBarButtonItem;
}

- (UIBarButtonItem *)optionsBarButtonItem {
    if (!_optionsBarButtonItem) {
        NSString *imageName = JBMSidebarContentController_optionsBarButtonItem_imageName;
        NSString *tintColorString = JBMSidebarContentController_barButtonItem_tintColorString;
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        _optionsBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
        
        _optionsBarButtonItem.tintColor = [UIColor colorWithHexString:tintColorString];
    }
    return _optionsBarButtonItem;
}

- (UILabel *)titleViewLabel {
    if (!_titleViewLabel) {
        CGFloat frameHeight = JBMSidebarContentController_titleViewLabel_frameHeight;
        CGFloat fontSize = JBMSidebarContentController_titleViewLabel_fontSize;
        NSString *textColorString = JBMSidebarContentController_titleViewLabel_textColorString;
        
        CGRect frame = CGRectMake(0.0f, 0.0f, self.navigationController.navigationBar.frame.size.width, frameHeight);
        
        _titleViewLabel = [[UILabel alloc] initWithFrame:frame];
        _titleViewLabel.textAlignment = NSTextAlignmentLeft;
        _titleViewLabel.font = [UIFont boldSystemFontOfSize:fontSize];
        _titleViewLabel.textColor = [UIColor colorWithHexString:textColorString];
    }
    return _titleViewLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        CGFloat imageViewHeightToWidth = JBMSidebarContentController_titleViewLabel_imageViewHeightToWidth;
        
        CGRect frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, roundf(self.view.frame.size.width*imageViewHeightToWidth));
        
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

@end
