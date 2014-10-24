//
//  UIColor+changeToRGB.h
//  Studycraft
//
//  Created by 17zuoye on 14-7-28.
//  Copyright (c) 2014年 17zuoye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (changeToRGB)

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSString *)hexString;
+ (UIColor*) colorWithHex:(NSString *)hexString withAlpha:(CGFloat)alphaValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;
+(int)colorStringToInt:(NSString *)colorStrig colorNo:(int)colorNo;
+(UIColor *) randomColor;
@end
