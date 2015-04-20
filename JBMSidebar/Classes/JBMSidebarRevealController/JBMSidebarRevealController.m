//
//  JBMSidebarRevealController.m
//  JBMSidebar
//
//  Created by J Blair Metcalf on 4/19/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMSidebarRevealController.h"
#import "SWRevealViewController.h"
#import "JBMSidebarRevealCell.h"
#import "UIColor+Utility.h"
#import "JBMSidebarConstants.h"
#import "JBMSidebarModel.h"

@interface JBMSidebarRevealController ()

@property (nonatomic, strong) UILabel *titleViewLabel;
@property (nonatomic, strong) UIView *selectedIndexView;

@end

@implementation JBMSidebarRevealController

#pragma mark - Override Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUserDefaults];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *backgroundColorString = JBMSidebarRevealController_backgroundColorString;
    CGFloat tableViewContentInsetY = JBMSidebarRevealController_tableViewContentInsetY;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor colorWithHexString:backgroundColorString];
    
    /*
     * Add a little space at the top of the sidebar items.
     */
    self.tableView.contentInset = UIEdgeInsetsMake(tableViewContentInsetY, 0.0f, 0.0f, 0.0f);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setSelectedIndexViewFrame];
    [self setTitle];
}

/*
 * Use this to animate out the status bar.
 * Causes navigation bar to animate poorly.
 */
/*
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
*/

#pragma mark - Public Methods

- (void)setData:(NSDictionary *)data {
    _data = data;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    NSInteger previous = self.selectedIndex;
    
    _selectedIndex = selectedIndex;
    
    [self saveUserDefaults];
    
    [self selectCellAtIndex:previous selected:NO];
    [self selectCellAtIndex:self.selectedIndex selected:YES];
    
    [self setSelectedIndexViewFrame];
    
    [self.delegate didSelectRowAtIndex:self.selectedIndex];
}

#pragma mark - Private Methods

/*
 * Get or set the user defaults on start up.
 */
- (void)setUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults objectForKey:JBMSidebarSelectedIndex]) {
        
        _selectedIndex = [[userDefaults objectForKey:JBMSidebarSelectedIndex] integerValue];
        
    } else {
        _selectedIndex = 0;
        
        [self saveUserDefaults];
    }
}

- (void)saveUserDefaults {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:[NSNumber numberWithInteger:self.selectedIndex] forKey:JBMSidebarSelectedIndex];
}

- (void)setTitle {
    self.titleViewLabel.text = self.data[JBMSidebarModelTitle];
    self.navigationItem.titleView = self.titleViewLabel;
}

/*
 * Set or animate the darker selected rectangle behind the sidebar items.
 */
- (void)setSelectedIndexViewFrame {
    CGFloat frameOriginX = JBMSidebarRevealController_selectedIndexView_frameOriginX;
    CGFloat frameOriginY = JBMSidebarRevealController_selectedIndexView_frameOriginY;
    CGFloat frameSizeWidth = JBMSidebarRevealController_selectedIndexView_frameSizeWidth;
    CGFloat frameSizeHeight = JBMSidebarRevealController_selectedIndexView_frameSizeHeight;
    
    CGRect frame = CGRectMake(frameOriginX, 0.0f, frameSizeWidth, frameSizeHeight);
    frame.origin.y = (JBMSidebarRevealCellHeight*self.selectedIndex)+frameOriginY;
    
    if (!_selectedIndexView) {
        
        self.selectedIndexView.frame = frame;
        
    } else {
        
        [self animateSelectedIndexViewFrame:frame];
    }
}

- (void)animateSelectedIndexViewFrame:(CGRect)frame {
    [UIView animateWithDuration:JBMSidebar_animationDuration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.selectedIndexView.frame = frame;
                     }
                     completion:nil];
}

- (void)selectCellAtIndex:(NSInteger)index selected:(BOOL)selected {
    
    for (JBMSidebarRevealCell *cell in [self.tableView visibleCells]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        if (index == indexPath.row) {
            cell.isSelected = selected;
            
            break;
        }
    }
}

#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
}

/*
 * This can be used in the future to change the main view controller.
 */
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isKindOfClass:[SWRevealViewControllerSegue class]])
    {
        SWRevealViewControllerSegue *revealSegue = (SWRevealViewControllerSegue *)segue;
        
        revealSegue.performBlock = ^(SWRevealViewControllerSegue *revealViewControllerSegue,
                                     UIViewController *sourceViewController,
                                     UIViewController *destinationViewController)
        {
            UINavigationController *navigationController = (UINavigationController *)self.revealViewController.frontViewController;
            
            [navigationController setViewControllers:@[destinationViewController] animated:NO];
            
            [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated: YES];
        };
    }
}
*/

#pragma mark - TableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[JBMSidebarModelSections] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return JBMSidebarRevealCellHeight;
}

// !!! configure cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = JBMSidebarRevealCellIdentifier;
    NSInteger cellStyle = UITableViewCellStyleDefault;
    
    JBMSidebarRevealCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[JBMSidebarRevealCell alloc] initWithStyle:cellStyle reuseIdentifier:cellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    /*
    if (!cell) {
        CGFloat alphaSelected = JBMSidebarRevealTableViewCell_alphaSelected;
        CGFloat alphaDeselected = JBMSidebarRevealTableViewCell_alphaDeselected;
        
        NSString *textLabelTextColor = JBMSidebarRevealTableViewCell_textLabelTextColor;
        CGFloat textLabelFontSize = JBMSidebarRevealTableViewCell_textLabelFontSize;
        
        NSInteger index = indexPath.row;
        NSDictionary *item = self.data[JBMSidebarModelSections][index];
        BOOL isSelected = self.selectedIndex == index;
        CGFloat alpha = isSelected ? alphaSelected : alphaDeselected;
        
        cell = [[JBMSidebarRevealTableViewCell alloc] initWithStyle:cellStyle reuseIdentifier:cellIdentifier];
        
        cell.imageView.image = [UIImage imageNamed:item[JBMSidebarModelSidebarImage]];
        cell.imageView.alpha = alpha;
        
        cell.textLabel.text = item[JBMSidebarModelSidebarTitle];
        cell.textLabel.textColor = [UIColor colorWithHexString:textLabelTextColor];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:textLabelFontSize];
        cell.textLabel.alpha = alpha;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.isSelected = self.selectedIndex == index;
    }
    */
    
    return cell;
}

- (void)configureCell:(JBMSidebarRevealCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat alphaSelected = JBMSidebarRevealCell_alphaSelected;
    CGFloat alphaDeselected = JBMSidebarRevealCell_alphaDeselected;
    
    NSString *textLabelTextColor = JBMSidebarRevealCell_textLabelTextColor;
    CGFloat textLabelFontSize = JBMSidebarRevealCell_textLabelFontSize;
    
    NSInteger index = indexPath.row;
    NSDictionary *item = self.data[JBMSidebarModelSections][index];
    BOOL isSelected = self.selectedIndex == index;
    CGFloat alpha = isSelected ? alphaSelected : alphaDeselected;
    
    cell.imageView.image = [UIImage imageNamed:item[JBMSidebarModelSidebarImage]];
    cell.imageView.alpha = alpha;
    
    cell.textLabel.text = item[JBMSidebarModelSidebarTitle];
    cell.textLabel.textColor = [UIColor colorWithHexString:textLabelTextColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:textLabelFontSize];
    cell.textLabel.alpha = alpha;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.isSelected = self.selectedIndex == index;
}

#pragma mark - Instantiation Methods

- (UILabel *)titleViewLabel {
    if (!_titleViewLabel) {
        CGFloat frameWidthAmmend = JBMSidebarRevealController_titleViewLabel_frameWidthAmmend;
        CGFloat frameHeight = JBMSidebarRevealController_titleViewLabel_frameHeight;
        CGFloat fontSize = JBMSidebarRevealController_titleViewLabel_fontSize;
        NSString *textColorString = JBMSidebarRevealController_titleViewLabel_textColorString;
        
        CGRect frame = CGRectMake(0.0f, 0.0f, self.navigationController.navigationBar.frame.size.width+frameWidthAmmend, frameHeight);
        
        _titleViewLabel = [[UILabel alloc] initWithFrame:frame];
        _titleViewLabel.textAlignment = NSTextAlignmentLeft;
        _titleViewLabel.font = [UIFont boldSystemFontOfSize:fontSize];
        _titleViewLabel.textColor = [UIColor colorWithHexString:textColorString];
    }
    return _titleViewLabel;
}

- (UIView *)selectedIndexView {
    if (!_selectedIndexView) {
        NSString *backgroundColorString = JBMSidebarRevealController_selectedIndexView_backgroundColorString;
        CGFloat cornerRadius = JBMSidebarRevealController_selectedIndexView_cornerRadius;
        
        _selectedIndexView = [UIView new];
        _selectedIndexView.backgroundColor = [UIColor colorWithHexString:backgroundColorString];
        _selectedIndexView.layer.cornerRadius  = cornerRadius;
        _selectedIndexView.layer.masksToBounds = YES;
        
        [self.view insertSubview:_selectedIndexView atIndex:0];
    }
    return _selectedIndexView;
}

@end
