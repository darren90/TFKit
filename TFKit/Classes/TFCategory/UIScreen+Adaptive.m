//
//  UIScreen+Adaptive.m
//  AFDownloadRequestOperation-iOS8.0
//
//  Created by Fengtf on 2017/11/2.
//

#import "UIScreen+Adaptive.h"

@implementation UIScreen (Adaptive)

+ (CGFloat)width {
    return [self mainScreen].bounds.size.width;
}

+ (BOOL)iPhoneX {
    if (@available(iOS 11.0, *)){
        return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone && (NSInteger)[UIScreen mainScreen].nativeBounds.size.height == 2436; //nativeBounds
    }
    return NO;
}

+ (CGFloat)homeIndeicatrHeight {
    return [self iPhoneX] ? 34 : 0;
}

+ (CGFloat)homeTabBarHeight {
    return [self homeIndeicatrHeight] + 49;
}

+ (CGFloat)statusBarHeight {
    return [self iPhoneX] ? 44 : 20;
}

+ (CGFloat)naviBarHeight {
    return 44;
}

+ (CGFloat)topBarTotalHeight {
    return [self naviBarHeight] + [self statusBarHeight];
}


@end
