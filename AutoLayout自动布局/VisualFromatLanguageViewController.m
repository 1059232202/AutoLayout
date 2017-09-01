//
//  VisualFromatLanguageViewController.m
//  AutoLayout自动布局
//
//  Created by lilin on 2017/9/1.
//  Copyright © 2017年 lilin. All rights reserved.
//

#import "VisualFromatLanguageViewController.h"

@interface VisualFromatLanguageViewController ()

@end

@implementation VisualFromatLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSNumber* margin=@(30);
    NSNumber* spacing=@(30);
//    NSDictionaryOfVariableBindings(v1, v2, v3) is equivalent to [NSDictionary dictionaryWithObjectsAndKeys:v1, @"v1", v2, @"v2", v3, @"v3", nil];
    NSDictionary* views=NSDictionaryOfVariableBindings(viewOne,viewTwo,viewThree);
    // 添加水平方向的约束1
    NSString *vfl1 = @"H:|-margin-[viewOne]-spacing-[viewTwo(==viewOne)]-margin-|";
    NSDictionary* metrics1=NSDictionaryOfVariableBindings(margin,spacing);
    NSArray* constraints1=[NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:metrics1 views:views];
    
    [self.view addConstraints:constraints1];
    
    //viewThree水平方向约束2
    NSString* vfl2=@"|-margin-[viewThree]-margin-|";
    NSDictionary* metrics2=NSDictionaryOfVariableBindings(margin);
    NSDictionary* views1=NSDictionaryOfVariableBindings(viewThree);
    NSArray* constraints2=[NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:NSLayoutFormatDirectionLeadingToTrailing metrics:metrics2 views:views1];
    [self.view addConstraints:constraints2];
    
    // 添加竖直方向的约束
    NSString *vfl3 = @"V:|-margin-[viewOne]-spacing-[viewThree(==viewOne)]-margin-|";
    NSDictionary *mertrics3 = NSDictionaryOfVariableBindings(margin, spacing);
    NSDictionary* views3=NSDictionaryOfVariableBindings(viewOne,viewThree);
    NSArray *constraints3 = [NSLayoutConstraint constraintsWithVisualFormat:vfl3 options:NSLayoutFormatDirectionLeadingToTrailing metrics:mertrics3 views:views3];
    
    [self.view addConstraints:constraints3];

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
