//
//  ViewController.m
//  AutoLayout自动布局
//
//  Created by lilin on 2017/8/31.
//  Copyright © 2017年 lilin. All rights reserved.
//

#import "ViewController.h"
#import "ManualCodeAutoLayoutViewController.h"
#import "VisualFromatLanguageViewController.h"
#import "XibAutoLayoutViewController.h"
#import "MasonryAutoLayoutViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray* demos;

@end

@implementation ViewController

#pragma mark 懒加载数据模型

-(NSArray*)demos{
    if (_demos==nil) {
        _demos=@[@"aotulayout（手码）",@"VFL(Visual Format Language)",@"aotulayout（Xib）",@"Masonry（第三方框架）"];
    }
    return _demos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航栏标题
    self.navigationItem.title=@"首页";
    self.navigationController.navigationBar.translucent = NO;
    
    NSLog(@"viewDidLoad");
    // Do any additional setup after loading the view, typically from a nib.
}

# pragma mark 返回cell行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.demos.count;
}


# pragma mark 返回tableview的每行视图
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* reusableIdentifier=@"reusableIdentifier";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:reusableIdentifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusableIdentifier];
    }
//    设置数据
    cell.textLabel.text=self.demos[indexPath.row];
    return cell;
}


#pragma mark 点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[ManualCodeAutoLayoutViewController alloc] init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[VisualFromatLanguageViewController alloc] init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[XibAutoLayoutViewController alloc] init] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[[MasonryAutoLayoutViewController alloc] init] animated:YES];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
