//
//  AppControl.h
//  chow
//
//  Created by wangyuliang on 14-9-19.
//  Copyright (c) 2014年 eallcn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ECProportion(num) (num)*[UIScreen mainScreen].bounds.size.width/(320.0)
#define ECProportion_height(num) (num)*[UIScreen mainScreen].bounds.size.height/(568.0)
@interface ECUtil : NSObject

//+ (ECUtil *)sharedInstance;

+ (BOOL)checkInputPhoneNum:(NSString*)num;

+ (BOOL)checkoutIsMobile;

+ (CGSize)textSize:(NSString *)text font:(UIFont *)font bounding:(CGSize)size;

+ (CGFloat)widgetHeight:(UIView *)widget sizeMakeWidth:(CGFloat)wid;

+ (NSInteger)textLength:(NSString *)text;

+ (UIColor *)colorWithHexString:(NSString *)color;

+ (NSNumberFormatter *)numberFormatter;

+ (NSString *)formatTime:(NSInteger)time;

+ (NSString *)stringWithSeconds:(NSTimeInterval)seconds timeFormat:(NSString *)format;

+ (NSTimeInterval)secondsWithString:(NSString *)string timeFormat:(NSString *)format;

+ (NSString *)formatMessageTime:(NSInteger)time;

+ (NSString *)formatDayTime:(NSInteger)time;

+ (UIImage *)compressImage:(UIImage *)image;

+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;

+ (NSString *)setWeekTime:(NSInteger)time;

+ (NSString *)setMessageWeekTime:(NSInteger)time;

+ (BOOL)isBlankString:(NSString *)string;

+ (NSString *)formatMoney:(CGFloat)number;

+ (CGFloat)singleLineHeight:(UIFont *)font;

// 返回设备的图片参数（2.0或3.0）
+ (float)imagePixByDevice;

+ (BOOL)validateUserName:(NSString *)name;

// 从bundle中获取图片
+ (UIImage *)getImageName:(NSString *)imgName formBundle:(NSString *)bundleName isThreeFix:(BOOL)isFix imgType:(NSString *)imageType;

+ (BOOL)textField:(UITextField *)textField evaluateNumberChargeInRange:(NSRange)range replacementString:(NSString *)string hasDot:(BOOL *)hasDot;

//修改图片方向
+ (UIImage *)fixOrientation:(UIImage *)aImage;
+ (void)saveImageToAlbum:(UIImage *)image;

+ (void)gradientLayer:(UIView *)v startPoint:(CGPoint)start endPoint:(CGPoint)end colorArr1:(UIColor *)color1 colorArr2:(UIColor *)color2 location1:(CGFloat)v1 location2:(CGFloat)v2;

+ (NSAttributedString *)mutableArrtibuteString:(NSString *)str1 foregroundColor:(UIColor *)color1 fontName:(UIFont *)font1 attribut:(NSString *)str2 foregroundColor:(UIColor *)color2 fontName:(UIFont *)font2;

+ (NSString *)getUUID;
+ (NSString *)getIDFA;

@end
