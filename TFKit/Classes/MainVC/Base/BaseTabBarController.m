//
//  BaseTabBarController.m
//  RollClient
//
//  Created by Fengtf on 16/3/30.
//  Copyright © 2016年 tengfei. All rights reserved.
//

#import "BaseTabBarController.h"
#import "RDVTabBarItem.h"
#import "BaseNavigationController.h"

#import "Home_RootController.h"
#import "Setting_RootController.h"
#import "Select_RootController.h"
//#import "HeiHan_RootController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self setHidesBottomBarWhenPushed:YES];
    //    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
    
    [self  initViewControllers];
    //    NSArray *array =  self.viewControllers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViewControllers
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    Home_RootController  *homeVc = [sb instantiateViewControllerWithIdentifier:@"HomeVC"];
    BaseNavigationController *homeNav = [[BaseNavigationController alloc]initWithRootViewController:homeVc];
    
    Select_RootController *selectVc = [sb instantiateViewControllerWithIdentifier:@"SelectVC"];
    BaseNavigationController *selectNav = [[BaseNavigationController alloc]initWithRootViewController:selectVc];
    
    Setting_RootController *settingVc = [sb instantiateViewControllerWithIdentifier:@"SettingVC"];
    BaseNavigationController *settingNav = [[BaseNavigationController alloc]initWithRootViewController:settingVc];
 
     [self setViewControllers:@[selectNav, homeNav, settingNav]];
    
    [self initTabBarForController];
    self.delegate = self;
}

-(void)initTabBarForController
{
    //    UIImage *backgroundImage = [UIImage imageNamed:@"bg_topbar"];
    
    NSArray *tabBarItemImages = @[@"gather",@"tab_new2",@"setting"];
    NSArray *tabBarItemTitles = @[@"首页",@"精选",@"设置"];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in self.tabBar.items) {
        item.titlePositionAdjustment = UIOffsetMake(0, 2);
        //        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        [[UIImage imageNamed:@"refresh"] imageWithTintColor:[UIColor lightGrayColor]];
        
        NSString *selectStr = [NSString stringWithFormat:@"%@",
                               tabBarItemImages[index]];
        UIImage *selectedimage = [[UIImage imageNamed:selectStr] imageWithTintColor:KColor(106, 149, 218)];
        
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        tabBarItemImages[index]]];
        
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:[tabBarItemTitles objectAtIndex:index]];
        item.unselectedTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : KColor(153, 153, 153)};
        item.selectedTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : KColor(106, 149, 218)};
        
        index++;
    }
}

#pragma mark RDVTabBarControllerDelegate

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedViewController != viewController) {
        return YES;
    }
    if (![viewController isKindOfClass:[UINavigationController class]]) {
        return YES;
    }
    UINavigationController *nav = (UINavigationController *)viewController;
    if (nav.topViewController != nav.viewControllers[0]) {
        return YES;
    }
    return YES;
}


/**
 *  Description
 *
 *  @return return value description
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

//- (BOOL)shouldAutorotate{
//    return YES;
//}
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    return [self.selectedViewController supportedInterfaceOrientations];
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
//}


// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    if (self.selectedIndex > self.viewControllers.count) {
        return NO;
    }
    UIViewController *vc = self.viewControllers[self.selectedIndex];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.topViewController shouldAutorotate];
    } else {
        return [vc shouldAutorotate];
    }
}

// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.selectedIndex > self.viewControllers.count) {
        return UIInterfaceOrientationMaskPortrait;
    }
    UIViewController *vc = self.viewControllers[self.selectedIndex];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.topViewController supportedInterfaceOrientations];
    } else {
        return [vc supportedInterfaceOrientations];
    }
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    if (self.selectedIndex > self.viewControllers.count) {
        return UIInterfaceOrientationPortrait;
    }
    UIViewController *vc = self.viewControllers[self.selectedIndex];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)vc;
        return [nav.topViewController preferredInterfaceOrientationForPresentation];
    } else {
        return [vc preferredInterfaceOrientationForPresentation];
    }
}


@end
