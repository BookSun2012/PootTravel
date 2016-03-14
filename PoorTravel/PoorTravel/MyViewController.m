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
#import "LoginViewController.h"

@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIView *barView;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *HeadView;
@property (nonatomic,strong)UIView *butnView;
@property (nonatomic, assign) CGFloat lastOffsetY;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonnull,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIView *baseView ;
@property (nonatomic,strong)NSArray *dataSouce;
@property (nonatomic,strong)NSMutableArray *imageNameArr;
@property (nonatomic,strong)NSMutableArray *titleNameArr;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataSouce];
    [self creatScrollView];
    self.navigationController.navigationBarHidden = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;

}

- (void)creatScrollView{
    _scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+50);
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+20)];
    [_scrollView addSubview:_baseView];
    [self creatImageVeiw];
    [self creatTabView];
}


- (void)customNavigationBarView {
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"周书阳";
    [self.nameLabel sizeToFit];
   
    self.navigationItem.titleView = self.nameLabel;
    
    // 给导航条的背景图片传递一个空图片的UIImage对象（导航条就是透明的）
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏底部阴影条，传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)creatTabView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    [self.baseView addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView.mas_top).offset(320);
        make.leading.equalTo(self.baseView.mas_leading).offset(0);
        make.trailing.equalTo(self.baseView.mas_trailing).offset(0);
        make.height.mas_equalTo(400);
    }];

}

- (void)loadDataSouce{
    _dataSouce = [NSArray array];
    _imageNameArr = [NSMutableArray array];
    _titleNameArr = [NSMutableArray array];
    NSString *plistpath = [[NSBundle mainBundle]pathForResource:@"set" ofType:@"plist"];
    _dataSouce = [NSArray arrayWithContentsOfFile:plistpath];

    for (NSDictionary *dic in _dataSouce) {
        NSString *icon = dic[@"icon"];
        NSString *title = dic[@"title"];
        [_imageNameArr addObject:icon];
        [_titleNameArr addObject:title];
    }
}
- (void)creatImageVeiw {

    _HeadView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"profileHeader.jpg"]];
    _HeadView.contentMode = UIViewContentModeScaleAspectFill;
    _HeadView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    _HeadView.userInteractionEnabled = YES;
    UIToolbar *view = [[UIToolbar alloc]initWithFrame: CGRectMake(0, 230, self.view.frame.size.width, 70)];
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.8;
   
    for (int i=0; i<=2; i++) {
        NSArray *imageName = @[@"ic_user_article",@"ic_user_guide",@"ic_user_plan"];
        NSArray *lable = @[@"收藏的帖子",@"我的锦囊",@"我的行程"];
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3*i+15,0,100, 70)];

        UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
        [butn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
        butn.frame = CGRectMake(40, 12, 25, 25);
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 85, 20)];
        lable1.text = lable[i];
        lable1.font = [UIFont systemFontOfSize:15];
        lable1.textAlignment = NSTextAlignmentCenter;
        lable1.textColor = [UIColor orangeColor];
        
        [butn setBackgroundImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
        [view1 addSubview:lable1];
        [view1 addSubview:butn];
        
        [view addSubview:view1];
       
    }
    
    UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"avatar_default"]];
    headImageView.frame = CGRectMake(self.view.frame.size.width/2-25,100, 60, 60);
    headImageView.layer.cornerRadius = 30;
    headImageView.clipsToBounds = YES;
    headImageView.userInteractionEnabled = YES;
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [headImageView addGestureRecognizer:tap];
    
    
    UILabel *loginlable = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-85,155, 180, 60)];
    loginlable.text = @"点击登录,体验更多";
    loginlable.textAlignment = NSTextAlignmentCenter;
    loginlable.font = [UIFont systemFontOfSize:20 weight:2];
    loginlable.textColor = [UIColor whiteColor];
    
    [_HeadView addSubview:loginlable];
    [_HeadView addSubview:headImageView];
    
    
    [_HeadView addSubview:view];
    [_baseView addSubview:_HeadView];
   
  
}

//点击手势

- (void)tap{
    [self presentViewController:[[LoginViewController alloc]init] animated:YES completion:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text= _titleNameArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imageNameArr[indexPath.row]];
    return cell;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self presentViewController:[[LoginViewController alloc]init] animated:YES completion:nil];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
