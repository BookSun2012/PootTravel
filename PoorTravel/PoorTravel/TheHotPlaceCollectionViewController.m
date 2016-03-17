//
//  TheHotPlaceCollectionViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/15.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "TheHotPlaceCollectionViewController.h"
#import "FirstModel.h"
#import "HotCityCell.h"
@interface TheHotPlaceCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *hotCountrySouce;
@end

@implementation TheHotPlaceCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dataSouce1];
    [self creatCollectionView];

    
}
- (void)creatCollectionView {
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(150, 200);
    flowLayOut.minimumLineSpacing = 20;
    //每行内部cell item的间距
    flowLayOut.minimumInteritemSpacing = 5;
    //内边距
    flowLayOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    _collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 0, self.view.frame.size.width-40, self.view.frame.size.height) collectionViewLayout:flowLayOut];
    //注册Item
    [_collectionView registerNib:[UINib nibWithNibName:@"HotCityCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
  
    
}
- (void)dataSouce1{
    _hotCountrySouce = [NSMutableArray array];
    _hotCountrySouce = self.dataSouce[0];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hotCountrySouce.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotCityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    Hot_CountryModel *model = self.hotCountrySouce[indexPath.row];
    [cell configerData:model];
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
