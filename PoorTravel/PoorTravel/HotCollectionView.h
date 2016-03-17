//
//  HotCollectionView.h
//  PoorTravel
//
//  Created by Qianfeng on 16/3/16.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSMutableArray *hotCityDataSouce;
@end
