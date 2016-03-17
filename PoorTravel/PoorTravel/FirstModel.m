//
//  FirstModel.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/15.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "FirstModel.h"

@implementation FirstModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [DataModel class]};
}
@end
@implementation DataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"country" : [CountryModel class], @"hot_country" : [Hot_CountryModel class]};
}

@end


@implementation CountryModel

@end


@implementation Hot_CountryModel

@end


