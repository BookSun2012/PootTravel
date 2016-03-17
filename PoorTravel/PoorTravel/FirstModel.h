//
//  FirstModel.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/15.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "JSONModel.h"

@class DataModel,CountryModel,Hot_CountryModel;
@interface FirstModel : JSONModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<DataModel *> *data;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, assign) NSInteger times;

@property (nonatomic, copy) NSString *ra_referer;




@end


@interface DataModel : JSONModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, strong) NSArray<Hot_CountryModel *> *hot_country;

@property (nonatomic, strong) NSArray<CountryModel *> *country;

@property (nonatomic, copy) NSString *enname;

@end




@interface CountryModel : JSONModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger flag;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *photo;

@end




@interface Hot_CountryModel : JSONModel

@property (nonatomic, copy) NSString *cnname;

@property (nonatomic, copy) NSString *enname;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger flag;

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *photo;

@end




