//
//  NSString+ZYJAdditions.m
//  类别
//
//  Created by CheMiMacPro on 15/5/18.
//  Copyright (c) 2015年 CheMiMacPro. All rights reserved.
//

#import "NSString+ZYJAdditions.h"
#import "CommonCrypto/CommonDigest.h"  //MD5加密

@implementation NSString (ZYJAdditions)

+ (BOOL)isVaildString:(NSString *)value
{
    return (value && ![@"" isEqualToString:value] && ![value isKindOfClass:[NSNull class]] && ![@"(null)" isEqualToString:value] && ![@"<null>" isEqualToString:value]);
}

+ (BOOL)isEmpty:(NSString *)value
{
    if (value == nil || value == NULL) {
        return YES;
    }
    if ([value isKindOfClass:[NSNull class]]) {
        return YES;
    }
    //过滤字符串开始位置和结束位置的字符串
    if ([[value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+ (BOOL)isRightIP:(NSString *)value
{
    NSArray *IPArray = [value componentsSeparatedByString:@"."];
    if ([IPArray count] == 4) {
        for (NSString *ip in IPArray) {
            if ([ip intValue] < 0 || [ip intValue] > 255) {
                return NO;
            }
        }
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)md5
{
    const char *concat_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, (CC_LONG)strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

- (NSString *)stringFromMD5
{
    const char *concat_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(concat_str, (CC_LONG)strlen(concat_str), result);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

- (NSString *)encodeUrl
{
    NSString *newString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)));
    if (newString) {
        return newString;
    }
    return @"";
}

////////////////////////////////////////////////////////

- (NSInteger)numberOfLinesWithFont:(UIFont*)font
                     withLineWidth:(NSInteger)lineWidth
{
    CGSize size = [self boundingRectWithSize:CGSizeMake(lineWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    NSInteger lines = size.height / [self ittLineHeight:font];
    return lines;
}

- (CGFloat)ittLineHeight:(UIFont*)font {
    return (font.ascender - font.descender) + 1;
}

////////////////////////////////////////////////////////

- (CGFloat)heightWithFont:(NSInteger)font withLineWidth:(NSInteger)lineWidth
{
    CGSize size =[self boundingRectWithSize:CGSizeMake(lineWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    
    return size.height;
}

- (CGFloat)widthWithFont:(NSInteger)font withLineHeight:(NSInteger)lineHeight
{
    CGSize size =[self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, lineHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    
    return size.width;
}

/** 计算文本大小 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

//判断是否是有效的手机号码
+(BOOL)phoneNumIsValidate:(NSString *)pnoneNum
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *MOBILE = @"^1[34578][0-9]{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:pnoneNum];
}

//判断是否是有效身份证号码
-(BOOL)identityCardISValidate:(NSString *)identityCard{
    {
        BOOL flag;
        if (identityCard.length <= 0)
        {
            flag = NO;
            return flag;
        }
        
        NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        flag = [identityCardPredicate evaluateWithObject:identityCard];
        
        
        //如果通过该验证，说明身份证格式正确，但准确性还需计算
        if(flag)
        {
            if(identityCard.length==18)
            {
                //将前17位加权因子保存在数组里
                NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
                
                //这是除以11后，可能产生的11位余数、验证码，也保存成数组
                NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
                
                //用来保存前17位各自乖以加权因子后的总和
                
                NSInteger idCardWiSum = 0;
                for(int i = 0;i < 17;i++)
                {
                    NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                    NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                    
                    idCardWiSum+= subStrIndex * idCardWiIndex;
                    
                }
                
                //计算出校验码所在数组的位置
                NSInteger idCardMod=idCardWiSum%11;
                
                //得到最后一位身份证号码
                NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
                
                //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
                if(idCardMod==2)
                {
                    if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                    {
                        return flag;
                    }else
                    {
                        flag =  NO;
                        return flag;
                    }
                }else
                {
                    //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                    if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                    {
                        return flag;
                    }
                    else
                    {
                        flag =  NO;
                        return flag;
                    }
                }
            }
            else
            {
                flag =  NO;
                return flag;
            }
        }
        else
        {
            return flag;
        }
    }
}

+ (NSString *)delSpaceAndNewline:(NSString *)string{
    NSMutableString *mutStr = [NSMutableString stringWithString:string];
    
    NSRange range = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"星期" withString:@"周" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"  " options:NSLiteralSearch range:range2];
    
    return mutStr;
}

#pragma mark - 将汉字转换成 拼音
+ (NSString *)transform:(NSString *)chinese
{
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //不带音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    NSString *cityPin = [pinyin substringWithRange:NSMakeRange(0, pinyin.length)];
    
    NSArray *arr = [cityPin componentsSeparatedByString:@" "];
    NSString *cityPinyin = [arr componentsJoinedByString:@""];
    return [cityPinyin lowercaseString];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma 正则匹配银行卡号是否正确
- (BOOL) checkBankNumber{
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma 正则匹配用户密码6-18位数字和字母组合
- (BOOL)checkPassword
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}
@end
