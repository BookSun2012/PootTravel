//
//  HotCityCell.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/15.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HotCityCell.h"
#import "UIImageView+WebCache.h"
@implementation HotCityCell

- (void)awakeFromNib {
   
}
- (void)configerData:(Hot_CountryModel *)model {
//    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.photo]]];
    
    
//    self.boomImage.image = image;
    
    [self.boomImage sd_setImageWithURL:[NSURL URLWithString:model.photo]];
    
    self.cnname.font = [UIFont systemFontOfSize:20 weight:2];
    self.cnname.text = model.cnname;
    
    self.enname.font = [UIFont systemFontOfSize:12 weight:2];
    self.enname.text = model.enname;
    
    self.count.font = [UIFont systemFontOfSize:18 weight:2];
    self.count.text  = [NSString stringWithFormat:@"%ld",model.count];

    self.lable.font = [UIFont systemFontOfSize:15 weight:2];
    self.lable.text  = model.label;
}

@end
