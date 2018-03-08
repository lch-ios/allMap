

#ifndef DEFIND_h
#define DEFIND_h

#define NOTI_WEIXIN_PAY @"weixinPay"         //微信支付

//文本颜色
#define kColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
/** RGB16进制颜色 **/
#define kHexCol(stringCol,alp) [UIColor colorWithHexString:stringCol alpha:alp]
/** 生成一个拼接字符串 **/
#define YYString(doubleN) [NSString stringWithFormat:@"%f",doubleN]

#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)

//宽和高
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kScreenH  [UIScreen mainScreen].bounds.size.height

//比例定义宽
#define KMD_N(n)  n * kScreenW / 375
//--------

#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif
//--------
//字号
#define font_10 kScreenW*10/375
#define font_11 kScreenW*11/375
#define font_12 kScreenW*12/375
#define font_13 kScreenW*13/375
#define font_15 kScreenW*15/375
#define font_14 kScreenW*14/375
#define font_16 kScreenW*16/375
#define font_17 kScreenW*17/375
#define font_18 kScreenW*18/375
#define font_24 kScreenW*24/375
#define font_25 kScreenW*25/375
#define font_30 kScreenW*30/375
/** 是否为3.5的屏 **/
#define SCREEN3_5 (kScreenH == 480)
/** 是否为4.0的屏 **/
#define SCREEN4 (kScreenH == 568)
/** 是否为4.7的屏 **/
#define SCREEN4_7  (kScreenH == 667)
/** 是否为5.5的屏 **/
#define SCREEN5_5  (kScreenH == 736)

// iPhone X
#define  isiPhoneX (kScreenW == 375.f && kScreenH == 812.f ? YES : NO)
// 状态栏高度
#define  kStatusBarHeight      (isiPhoneX ? 44.f : 20.f)
// 导航栏高度
#define  kNavigationBarHeight  44.f
// 状态栏& 导航栏目高度
#define  kStatusBarAndNavBarHeight  (isiPhoneX ? 88.f : 64.f)
// Tabbar 高度
#define kTabbarHeight         (isiPhoneX ? (49.f+34.f) : 49.f)
// Tabbar 距离底部的间距
#define TabbarSafeBottomMargin         (isiPhoneX ? 34.f : 0.f)
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen]

//自定义log
#ifdef DEBUG//如果程序处于开发阶段
# define YYLog(fmt, ...) NSLog((@"[文件名:%@]""[行号:%d]->" fmt), [self class], __LINE__, ##__VA_ARGS__);
#else//处于发布阶段
# define YYLog(...);
#endif

#define LAST_RUN_VERSION_KEY @"last_run_version_of_application"

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define IOS8 [[[UIDevice currentDevice] systemVersion]floatValue]>=8.0

#endif


