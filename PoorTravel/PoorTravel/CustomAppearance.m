//
//  customAppearance.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "CustomAppearance.h"
#import <UIKit/UIKit.h>
@implementation CustomAppearance

+(instancetype)defaultManager {
    
    static CustomAppearance *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[CustomAppearance alloc]init];
    });
    
    
    return manager;
}



- (void)customizeSearchBarAppearance
{
    [[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar_backgroud"]];
}

- (void)customizeButtonAppearance
{
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[[UIImage imageNamed:@"button_item_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [[UIBarButtonItem appearance] setBackgroundImage:[[UIImage imageNamed:@"button_blue"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)customizePageControlAppearance
{
    // 设置当前页指示器的颜色
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[UIColor colorWithRed:67/255.0 green:103.0/255.0 blue:173.0/255.0 alpha:1.0]];
    
    // 设置未选择指示器的颜色
    [[UIPageControl appearance] setPageIndicatorTintColor:[UIColor whiteColor]];
}

- (void)customizetoolBarAppearance
{
    // 设置toolBar背景
    [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"backgroud_toolbar"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
}

- (void)customizeSegmentedControlAppearance
{
    [[UISegmentedControl appearance] setBackgroundColor:[UIColor colorWithRed:52.0/255.0 green:51.0/255.0 blue:57.0/255.0 alpha:1.0]];
    
    /* Unselected background */
    UIImage *unselectedBackgroundImage = [[UIImage imageNamed:@"segment_black"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [[UISegmentedControl appearance] setBackgroundImage:unselectedBackgroundImage
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
    
    /* Selected background */
    UIImage *selectedBackgroundImage = [[UIImage imageNamed:@"segment_blue"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [[UISegmentedControl appearance] setBackgroundImage:selectedBackgroundImage
                                               forState:UIControlStateSelected
                                             barMetrics:UIBarMetricsDefault];
    
    UIImage *highlightedBackgroundImage = [[UIImage imageNamed:@"segment_blue"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [[UISegmentedControl appearance] setBackgroundImage:highlightedBackgroundImage
                                               forState:UIControlStateHighlighted
                                             barMetrics:UIBarMetricsDefault];
    
    /* Image between two unselected segments */
    UIImage *bothUnselectedImage = [[UIImage imageNamed:@"backgroud_blank"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 0, 15, 0)];
    [[UISegmentedControl appearance] setDividerImage:bothUnselectedImage
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    
    /* Image between segment selected on the left and unselected on the right */
    UIImage *leftSelectedImage = [[UIImage imageNamed:@"backgroud_blank"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 0, 15, 0)];
    [[UISegmentedControl appearance] setDividerImage:leftSelectedImage
                                 forLeftSegmentState:UIControlStateSelected
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    
    /* Image between segment selected on the right and unselected on the left */
    UIImage *rightSelectedImage = [[UIImage imageNamed:@"backgroud_blank"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 0, 15, 0)];
    [[UISegmentedControl appearance] setDividerImage:rightSelectedImage
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateSelected
                                          barMetrics:UIBarMetricsDefault];}

- (void)customizeTabBarAppearance
{
    
    UIImage *tabBackground = [[UIImage imageNamed:@"tabbar_backgroud"]
                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // 设置tabBar的背景
    [[UITabBar appearance] setBackgroundImage:tabBackground];
    
    // 设置选中时的背景
    [[UITabBar appearance] setSelectionIndicatorImage:
     [UIImage imageNamed:@"tabbar_backgroud_selected"]];
}

- (void)customizeNavgationBarAppearance
{
    // Create resizable images
    UIImage *gradientImage44 = [[UIImage imageNamed:@"navigationBar_backgroud"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    //    UIImage *gradientImage32 = [[UIImage imageNamed:@"world"]
    //                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    // Set the background image for *all* UINavigationBars
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44
                                       forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setBackgroundImage:gradientImage32
    //                                       forBarMetrics:UIBarMetricsLandscapePhone];
    
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
     
      nil]];
}
@end
