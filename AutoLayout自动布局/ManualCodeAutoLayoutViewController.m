//
//  ManualCodeAutoLayoutViewController.m
//  AutoLayout自动布局
//
//  Created by lilin on 2017/8/31.
//  Copyright © 2017年 lilin. All rights reserved.
//

#import "ManualCodeAutoLayoutViewController.h"
/*
 * 需求
 *
 * 我们需要布局红(view_1)、绿(view_2)、蓝(view_3)三个view位置如图所示，
 * 他们距离父视图边距以及相互之间的距离都为30px，红色view和绿色view宽度相等，
 * 并且三个view的高度相等。并且在横屏时，他们的位置还是一样保持不变。
 *
 */
/**
 三种布局方式：
 1.Manual layout
 2.Autoresizing
 3.Autolayout
    1.手码自动布局开发中基本不用
    2.VFL（Visual Format Language）可视化语言用来简化autolayout的布局约束
 */

@interface ManualCodeAutoLayoutViewController ()

@end

@implementation ManualCodeAutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    布局不扩展到导航下面
//    self.edgesForExtendedLayout = UIRectEdgeNone;
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
    //    Constraints are of the form "view1.attr1 = view2.attr2 * multiplier + constant"
//    If your equation does not have a second view and attribute, use nil and NSLayoutAttributeNotAnAttribute.
//    设置viewOne距离self.view顶部30，
    NSLayoutConstraint* viewOneLayoutConstraintTop=[NSLayoutConstraint constraintWithItem:viewOne attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.f constant:30];
//    设置viewOne距离self.view左部30，
    NSLayoutConstraint* viewOneLayoutConstraintLeft=[NSLayoutConstraint constraintWithItem:viewOne attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:30];
    //   设置viewOne右部距离viewTwo左部30
    NSLayoutConstraint* viewOneLayoutConstraintRight2ViewTwoLeft=[NSLayoutConstraint constraintWithItem:viewTwo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:viewOne attribute:NSLayoutAttributeRight multiplier:1.f constant:30];
//    设置viewOne底部距离viewThree顶部30
    NSLayoutConstraint* viewOneLayoutConstraintBottom2ViewThreeTop=[NSLayoutConstraint constraintWithItem:viewOne attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:viewThree attribute:NSLayoutAttributeTop multiplier:1.f constant:-30];
# pragma mark 可理解为viewTwo相对父容器最右边减去30
//    设置View2距离self.view右边距离 可理解为viewTwo相对父容器最右边-30
    NSLayoutConstraint* viewTwoLayoutConstraintRight=[NSLayoutConstraint constraintWithItem:viewTwo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:-30];
# pragma mark   viewOne和viewTwo centerY相同
    NSLayoutConstraint* viewTwoCenterY2ViewOneCenterY=[NSLayoutConstraint constraintWithItem:viewTwo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:viewOne attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0];

    
# pragma mark viewThree相对于父容器的最左边加30
    NSLayoutConstraint* viewThreeLayoutConstraintLeft=[NSLayoutConstraint constraintWithItem:viewThree attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.f constant:30];
# pragma mark viewThree相对于父容器的最右边减30
    NSLayoutConstraint* viewThreeLayoutConstraintRight=[NSLayoutConstraint constraintWithItem:viewThree attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.f constant:-30];
    
# pragma mark viewThree相对于父容器的最底边减30
    NSLayoutConstraint* viewThreeLayoutConstraintBottom=[NSLayoutConstraint constraintWithItem:viewThree attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.f constant:-30];
# pragma mark   viewOne和viewTwo 宽度相同
    NSLayoutConstraint* viewTwoWidthViewOneEqual=[NSLayoutConstraint constraintWithItem:viewTwo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewOne attribute:NSLayoutAttributeWidth multiplier:1.f constant:0];
    
# pragma mark   viewOne和viewTwo 高度相同
    NSLayoutConstraint* viewTwoHeightViewOneEqual=[NSLayoutConstraint constraintWithItem:viewTwo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:viewOne attribute:NSLayoutAttributeHeight multiplier:1.f constant:0];
    
# pragma mark   viewOne和viewThree 高度相同
    NSLayoutConstraint* viewOneHeightViewThreeEqual=[NSLayoutConstraint constraintWithItem:viewOne attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:viewThree attribute:NSLayoutAttributeHeight multiplier:1.f constant:0];
    
    [self.view addConstraints:@[viewOneLayoutConstraintTop,viewOneLayoutConstraintLeft,viewOneLayoutConstraintRight2ViewTwoLeft,viewOneLayoutConstraintBottom2ViewThreeTop,viewTwoLayoutConstraintRight,viewTwoCenterY2ViewOneCenterY,viewTwoWidthViewOneEqual,viewTwoHeightViewOneEqual,viewOneHeightViewThreeEqual,viewThreeLayoutConstraintLeft,viewThreeLayoutConstraintRight,viewThreeLayoutConstraintBottom]];
    
    [self.view layoutIfNeeded];
    
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
