//
//  HotCollectionView.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/16.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "HotCollectionView.h"
#import "HotCityCell.h"
@implementation HotCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self =[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self dataSouce1];
        [self registerNib:[UINib nibWithNibName:@"HotCityCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    }
    return self;
}
- (void)dataSouce1{

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotCityDataSouce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    Hot_CountryModel *model = self.hotCityDataSouce[indexPath.row];
    
    [cell configerData:model];
    return cell;
}


@end
