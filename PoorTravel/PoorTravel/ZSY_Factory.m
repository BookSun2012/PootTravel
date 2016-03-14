//
//  ZSY_Factory.m
//  05_UI_Fatory
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 周书阳. All rights reserved.
//

#import "ZSY_Factory.h"

@implementation ZSY_Factory
+(UIButton *)buttonWithFrame:(CGRect)frame
                        Type:(UIButtonType)type
                       Title:(NSString *)title
                    fontSize:(CGFloat)fontSize
                  titleColor:(UIColor *)titleColor
                     bgColor:(UIColor *)bgColor
                      target:(id)target
                    selector:(SEL)sel
                    layer:(CGFloat)layer
                  supperView:(UIView *)supperView{
    UIButton * btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = bgColor;
    btn.layer.cornerRadius = layer;
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    // //[supperView addSubview:btn];
   // return [[btn retain]autorelease];
    [supperView addSubview:btn];
    return btn;
}
+(UIButton *)buttonWithFrame:(CGRect)frame
                       Title:(NSString *)title
                     fontSize:(CGFloat)fontSize
                      target:(id)target
                    selector:(SEL)sel
                   layer:(CGFloat)layer
                  supperView:(UIView *)supperView{
    return [self buttonWithFrame:frame Type:UIButtonTypeSystem Title:title fontSize:fontSize titleColor:[UIColor redColor] bgColor:[UIColor cyanColor] target:target selector:sel layer:(CGFloat)layer supperView:supperView];

}
+(UILabel *)labelWithFrame:(CGRect)frame
                      text:(NSString*)text
                  fontSzie:(CGFloat)fontSize
                     layer:(CGFloat)layer
                 textColor:(UIColor*)textColor
                   bgColor:(UIColor*)bgColor
                     align:(NSTextAlignment)align
                supperView:(UIView *)supperView
{
    UILabel *lab = [[UILabel alloc]initWithFrame:frame];
    lab.text = text;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.layer.cornerRadius = layer;
    lab.textColor = textColor;
    lab.backgroundColor = bgColor;
    lab.textAlignment = align;
    [supperView addSubview:lab];
    return lab;
    
    
}
@end
