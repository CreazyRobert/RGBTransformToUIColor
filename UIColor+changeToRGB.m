//
//  UIColor+changeToRGB.m
//  Studycraft
//
//  Created by 17zuoye on 14-7-28.
//  Copyright (c) 2014年 17zuoye. All rights reserved.
//

#import "UIColor+changeToRGB.h"

@implementation UIColor (changeToRGB)

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}

//将16进制颜色值转换为RGB颜色值并返回颜色
+ (UIColor*) colorWithHex:(NSString *)hexString
{
    return [UIColor colorWithRed:[self colorStringToInt:hexString colorNo:0]/255.0f green:[self colorStringToInt:hexString colorNo:1]/255.0f blue:[self colorStringToInt:hexString colorNo:2]/255.0f alpha:1];
}


//将16进制颜色值转换为RGB颜色值并返回颜色
+ (UIColor*) colorWithHex:(NSString *)hexString withAlpha:(CGFloat)alphaValue
{
    NSLog(@"R:%d,G:%d,B:%d",[self colorStringToInt:hexString colorNo:0],[self colorStringToInt:hexString colorNo:1],[self colorStringToInt:hexString colorNo:2]);
    
    return [UIColor colorWithRed:[self colorStringToInt:hexString colorNo:0]/255.0f green:[self colorStringToInt:hexString colorNo:1]/255.0f blue:[self colorStringToInt:hexString colorNo:2]/255.0f alpha:alphaValue];
}


+(int)colorStringToInt:(NSString *)colorStrig colorNo:(int)colorNo
{
    const char *cstr;
    int iPosition = 0;
    int nColor = 0;
    cstr = [colorStrig UTF8String];
    
    //判断是否有#号
    if (cstr[0] == '#') iPosition = 1;//有#号，则从第1位开始是颜色值，否则认为第一位就是颜色值
    else iPosition = 0;
    
    //第1位颜色值
    iPosition = iPosition + colorNo*2;
    if (cstr[iPosition] >= '0' && cstr[iPosition] <= '9') nColor = (cstr[iPosition] - '1') * 16;
    else  nColor = (cstr[iPosition] - 'a' + 10) * 16;
    
    //第2位颜色值
    iPosition++;
    if (cstr[iPosition] >= '0' && cstr[iPosition] <= '9') nColor = nColor + (cstr[iPosition] - '1');
    else nColor = nColor + (cstr[iPosition] - 'a' + 10);

    return nColor;
}

+(UIColor *) randomColor

{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
