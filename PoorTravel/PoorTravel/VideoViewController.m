//
//  VideoViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "VideoViewController.h"
#import "Masonry.h"
#import "TheHotPlaceCollectionViewController.h"
#import "HttpEngine.h"
#import "Define.h"
#import "FirstModel.h"
#import "HotCityCell.h"
@interface VideoViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataSocue;
@property (nonatomic,strong)NSMutableArray *titleSouce;
@property (nonatomic,strong)NSMutableArray *da;
@property (nonatomic,strong)NSMutableArray *db;
@property (nonatomic,strong)NSMutableArray *hotCountrySouce;
@property (nonatomic,strong)UIImageView *mapView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creaScrollView];
    [self loadDataSouce];
    self.edgesForExtendedLayout = NO;
}
- (void)creaScrollView{
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(self.view.frame.size.height);
    }];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.8);
    [self creatMapView];
}

- (void)creatMapView{
    _mapView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"map"]];
    _mapView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    _mapView.userInteractionEnabled = YES;
    [_scrollView addSubview:_mapView];
    
}

- (void)loadDataSouce {
    _dataSocue = [NSMutableArray array];
    _titleSouce = [NSMutableArray array];
    _da = [NSMutableArray array];
    _db = [NSMutableArray array];
    HttpEngine *enger = [HttpEngine shareEngine];
    [enger GET:URL parameters:nil success:^(id response) {
        NSError *error= nil;
        NSLog(@"%@",response);
        
        self.dataSocue = [DataModel arrayOfModelsFromDictionaries:response[@"data"] error:&error];
        NSLog(@" %ld %@",self.dataSocue.count,self.dataSocue);
        
        for (int i=0; i<self.dataSocue.count; i++) {
            DataModel *model = self.dataSocue[i];
            [_titleSouce addObject:model.cnname];
        }
        NSArray *arr = response[@"data"];
        for (NSDictionary *dic  in arr) {
            [_da addObject:[Hot_CountryModel  arrayOfModelsFromDictionaries:dic[@"hot_country"] error:nil]];
            [_db addObject:[CountryModel arrayOfModelsFromDictionaries:dic[@"country"] error:nil]];
            }
        
        self.hotCountrySouce = self.da[0];
        [self creatButn];
        [self creatCollection];
    } failed:^(NSError *error) {
        
    }];

    
    
}


- (void)creatButn {
    for (int i=0; i<self.titleSouce.count; i++) {
        UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
        butn.frame = CGRectMake(self.view.frame.size.width/7*i, 170, self.view.frame.size.width/7, 30);
        [butn setBackgroundColor:[UIColor grayColor]];
        [butn setTitle:_titleSouce[i] forState:UIControlStateNormal];
        butn.titleLabel.font = [UIFont systemFontOfSize:12 weight:2];
        butn.titleLabel.textColor = [UIColor orangeColor];
        butn.tag = 200+i;
        [butn addTarget:self action:@selector(butnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.mapView addSubview:butn];
    }
}


- (void)butnPress:(UIButton *)butn{
    switch (butn.tag) {
        case 200:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[0];
            [self.collectionView reloadData];
            break;
        case 201:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[1];
            [self.collectionView reloadData];
            break;
        case 202:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[2];
            [self.collectionView reloadData];
            break;
        case 203:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[3];
            [self.collectionView reloadData];
            break;
        case 204:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[4];
            [self.collectionView reloadData];
            break;
        case 205:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[5];
            [self.collectionView reloadData];
            
            break;
        case 206:
            NSLog(@"点击了%@按钮",butn.titleLabel);
            self.hotCountrySouce = self.da[6];
            [self.collectionView reloadData];
            break;
        default:
            break;
    }
}
#pragma mark CollectionView

- (void)creatCollection{
    
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
    flowLayOut.itemSize = CGSizeMake(160, 220);
    flowLayOut.minimumLineSpacing = 20;
    //每行内部cell item的间距
    flowLayOut.minimumInteritemSpacing = 5;
    //内边距
    flowLayOut.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayOut.footerReferenceSize = CGSizeMake(50, 50);
    
    _collectionView  = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 240*self.hotCountrySouce.count/2) collectionViewLayout:flowLayOut];
    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.scrollEnabled = NO;
    [_collectionView registerNib:[UINib nibWithNibName:@"HotCityCell" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:_collectionView];
    
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
