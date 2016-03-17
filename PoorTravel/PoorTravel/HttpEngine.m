//
//  HttpEngine.m
//  LimitFreeApp
//
//  Created by Qianfeng on 16/2/17.
//  Copyright © 2016年 zhoushuyang. All rights reserved.
//

#import "HttpEngine.h"
#import "AFNetworking.h"
#import "Define.h"

@interface HttpEngine ()
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@end

@implementation HttpEngine

//声明一个单例
+ (instancetype)shareEngine {
    static HttpEngine *engine = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        NSLog(@"只执行一次");
        engine = [[HttpEngine alloc]init];
    });//block 代码块 只执行一次
    return  engine;
}

//重写init 方法
- (instancetype)init {
    if (self = [super init]) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    }
    return self;
}

- (void)GET:(NSString *)URLString parameters:(id)parameter success:(SuccessBlockType)success failed:(FailedBlockType)failed {
    
    [_manager GET:URLString parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failed) {
            failed(error);
        }
    }];
    
    
}


@end
