//
//  ViewController.m
//  DMWatermark
//
//  Created by SDC201 on 2017/4/28.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "ViewController.h"
#import "WatermarkVc.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"水印";
    
    self.dataArray = @[@"图片+水印图片+imgRect",@"图片+水印图片+imgPoint",@"图片+水印文字+strRect",@"图片+水印文字+strPoint",@"图片+水印图片+水印文字+Rect",@"图片+水印图片+水印文字+Point"];
    
    [self creatTableView];
}

- (void)creatTableView
{
    self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.view addSubview:self.mainTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        UILabel *label = [[UILabel alloc]init];
        label.bounds = cell.contentView.bounds;
        label.center = cell.contentView.center;
        label.text = self.dataArray[indexPath.row];
        label.textAlignment = NSTextAlignmentCenter;
        
        [cell.contentView addSubview:label];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WatermarkVc *watermarkVc = [[WatermarkVc alloc]init];
    watermarkVc.index = indexPath.row;
    
    [self.navigationController pushViewController:watermarkVc animated:YES];
}

@end
