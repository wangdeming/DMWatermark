//
//  WatermarkVc.m
//  DMWatermark
//
//  Created by SDC201 on 2017/4/28.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "WatermarkVc.h"
#import "UIImage+WaterMark.h"

#define AppW self.view.frame.size.width
#define AppH self.view.frame.size.height

#define ImageRect CGRectMake(100, AppH - 200, 120, 120)
#define StrRect CGRectMake(240, AppH - 80, 120, 60)

#define ImagePoint CGPointMake(100, AppH - 200)
#define StrPoint CGPointMake(240, AppH - 80)
#define AttributeDictionary @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:25]}

@interface WatermarkVc ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation WatermarkVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatView];
}

- (void)creatView
{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AppW, AppH)];
    [self.view addSubview:self.imageView];
    
    switch (self.index) {
        case 0:
            [self creatWatermarkWithImageAndImgRect];
            break;
        case 1:
            [self creatWatermarkWithImageAndImgPoint];
            break;
        case 2:
            [self creatWatermarkWithStringAndStrRect];
            break;
        case 3:
            [self creatWatermarkWithStringAndStrPoint];
            break;
        case 4:
            [self creatWatermarkWithImageAndStringAndStrRect];
            break;
        case 5:
            [self creatWatermarkWithImageAndStringAndStrpoint];
            break;
            
        default:
            break;
    }
}

//图片+水印图片+imgRect -可以控制图片显示大小
- (void)creatWatermarkWithImageAndImgRect
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印image
    UIImage *markImage = [UIImage imageNamed:@"1.jpg"];
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithImage:markImage imageRect:ImageRect alpha:0.7];
    
    self.imageView.image = resultImage;
}
//图片+水印图片+imgPoint -显示图片本身大小
- (void)creatWatermarkWithImageAndImgPoint
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印image
    UIImage *markImage = [UIImage imageNamed:@"1.jpg"];
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithImage:markImage imagePoint:ImagePoint alpha:0.7];
    
    self.imageView.image = resultImage;
}
//图片+水印文字+strRect
- (void)creatWatermarkWithStringAndStrRect
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印str
    NSString *str = @"狐狸阿狸";
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithString:str rect:StrRect attribute:AttributeDictionary];
    
    self.imageView.image = resultImage;
}
//图片+水印文字+strPoint
- (void)creatWatermarkWithStringAndStrPoint
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印str
    NSString *str = @"狐狸阿狸";
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithString:str point:StrPoint attribute:AttributeDictionary];
    
    self.imageView.image = resultImage;
}
//图片+水印图片+水印文字+Rect
- (void)creatWatermarkWithImageAndStringAndStrRect
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印image
    UIImage *markImage = [UIImage imageNamed:@"1.jpg"];
    //水印str
    NSString *str = @"狐狸阿狸";
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithString:str rect:StrRect attribute:AttributeDictionary image:markImage imageRect:ImageRect alpha:0.7];
    
    self.imageView.image = resultImage;
}
//图片+水印图片+水印文字+Point
- (void)creatWatermarkWithImageAndStringAndStrpoint
{
    //底层image
    UIImage *baseImage = [UIImage imageNamed:@"0.jpg"];
    //水印image
    UIImage *markImage = [UIImage imageNamed:@"1.jpg"];
    //水印str
    NSString *str = @"狐狸阿狸";
    //合成image
    UIImage *resultImage = [baseImage imageWaterMarkWithString:str point:StrPoint attribute:AttributeDictionary image:markImage imagePoint:ImagePoint alpha:0.7];
    
    self.imageView.image = resultImage;
}

@end
