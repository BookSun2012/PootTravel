//
//  MyViewController.m
//  PoorTravel
//
//  Created by Qianfeng on 16/3/10.
//  Copyright © 2016年 杜帅统. All rights reserved.
//

#import "MyViewController.h"
#define View_Width self.view.frame.size.width
#define View_Height self.view.frame.size.height

#define kHeadHeight 200
#define kNavAndStatusBarHeight 64
#define kTabBarHeight 44
#import "UIImage+ImageColor.h"
#import "Masonry.h"


@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIView *barView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *HeadView;
@property (nonatomic,strong)UIView *butnView;
@property (nonatomic, assign) CGFloat lastOffsetY;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationBarView];
    [self creatTabView];
    [self creatImageVeiw];
    [self creatLable];
    NSLog(@"%@",self.navigationItem.title);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;

}
- (void)customNavigationBarView {
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"秋恨雪";
    [self.nameLabel sizeToFit];
   
    self.navigationItem.titleView = self.nameLabel;
    
    // 给导航条的背景图片传递一个空图片的UIImage对象（导航条就是透明的）
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏底部阴影条，传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)creatImageVeiw {
    
    UIView *HeadPartView = [[UIView alloc]init];
    self.HeadView = HeadPartView;
    
    UIImage *image = [UIImage imageNamed:@"profileHeader.jpg"];
    UIImageView *BgImage = [[UIImageView alloc]initWithImage:image];
    
    
    BgImage.contentMode = UIViewContentModeScaleAspectFill;
    [HeadPartView addSubview:BgImage];
    [self.view addSubview:HeadPartView];
    
    HeadPartView.translatesAutoresizingMaskIntoConstraints = NO;
    [HeadPartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(200);
    }];
   
    BgImage.translatesAutoresizingMaskIntoConstraints = NO;
    [BgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(HeadPartView.mas_top).offset(0);
        make.leading.equalTo(HeadPartView.mas_leading).offset(0);
        make.trailing.equalTo(HeadPartView.mas_trailing).offset(0);
        make.bottom.equalTo(HeadPartView.mas_bottom).offset(0);
    }];

}

- (void)creatLable {
    UIView *butnView = [[UIView alloc]init];
    butnView.backgroundColor = [UIColor purpleColor];
    self.butnView = butnView;
    [self.view addSubview:butnView];
    butnView.translatesAutoresizingMaskIntoConstraints = NO;
    [butnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.HeadView.mas_bottom).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(44);
    }];
   
}

- (void)creatTabView{
    _tableView = [[UITableView alloc]init];
    _tableView.backgroundColor =[UIColor yellowColor ];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(kHeadHeight + kTabBarHeight, 0, 0, 0);
   
    [self.view addSubview:_tableView];

    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
    
    
}
//
#pragma mark- ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.lastOffsetY = -(kHeadHeight + kTabBarHeight);
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat delta = offsetY-self.lastOffsetY;
    CGFloat height = kHeadHeight-delta;
    if (height<kNavAndStatusBarHeight) {
        height = kNavAndStatusBarHeight;
    }
    
    CGFloat alpha = delta/(kHeadHeight-kNavAndStatusBarHeight);
    if (alpha>=1) {
        alpha = 1;
    }
    
    self.nameLabel.alpha = alpha;
    [self.HeadView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.leading.equalTo(self.view.mas_leading).offset(0);
        make.trailing.equalTo(self.view.mas_trailing).offset(0);
        make.height.mas_equalTo(height);
    }];
    
    UIImage *image = [UIImage imageViewColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
}



#pragma  mark - TableVeiwDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text= [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
