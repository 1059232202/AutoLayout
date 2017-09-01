//
//  MasonryAutoLayoutViewController.m
//  AutoLayout自动布局
//
//  Created by lilin on 2017/9/1.
//  Copyright © 2017年 lilin. All rights reserved.
//

#import "MasonryAutoLayoutViewController.h"
#import "Masonry.h"
@interface MasonryAutoLayoutViewController ()

@end

@implementation MasonryAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIView* viewOne=[[UIView alloc] init];
    viewOne.backgroundColor=[UIColor redColor];
    [self.view addSubview:viewOne];
    UIView* viewTwo=[[UIView alloc] init];
    viewTwo.backgroundColor=[UIColor greenColor];
    [self.view addSubview:viewTwo];
    UIView* viewThree=[[UIView alloc] init];
    viewThree.backgroundColor=[UIColor blueColor];
    [self.view addSubview:viewThree];
    //不转换autoresize为约束
    viewOne.translatesAutoresizingMaskIntoConstraints=NO;
    viewTwo.translatesAutoresizingMaskIntoConstraints=NO;
    viewThree.translatesAutoresizingMaskIntoConstraints=NO;
    
    __weak __typeof(self) weakSelf=self;
//    viewOne的约束
    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.top).with.offset(30);
        make.left.equalTo(weakSelf.view.left).with.offset(30);
    }];
    
//    viewTwo的约束
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(viewOne.centerY).with.offset(0);
        make.left.equalTo(viewOne.right).with.offset(30);
        make.right.equalTo(weakSelf.view.right).with.offset(-30);
        make.height.equalTo(viewOne.height);
        make.width.equalTo(viewOne.width);
    }];
//    viewThree的约束
    [viewThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewOne.bottom).with.offset(30);
        make.left.equalTo(weakSelf.view.left).with.offset(30);
        make.bottom.equalTo(weakSelf.view.bottom).with.offset(-30);
        make.right.equalTo(weakSelf.view.right).with.offset(-30);
        make.height.equalTo(viewOne.height);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
