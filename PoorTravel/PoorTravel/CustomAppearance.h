//
//  customAppearance.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/14.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomAppearance : NSObject

+(instancetype)defaultManager;

- (void)customizeSearchBarAppearance;

- (void)customizeButtonAppearance;

- (void)customizePageControlAppearance;

- (void)customizetoolBarAppearance;

- (void)customizeSegmentedControlAppearance;

- (void)customizeTabBarAppearance;

- (void)customizeNavgationBarAppearance;
@end
