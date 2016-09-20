//
//  Comment.h
//  AutoFinance
//
//  Created by lvdl on 15/7/13.
//  Copyright (c) 2015年 www.palcw.com. All rights reserved.
//

#ifndef AutoFinance_Comment_h
#define AutoFinance_Comment_h


/**
 *  屏幕的宽和高
 */
#define SCREEN_HEIGHT_IPHONE ((SCREEN_WIDTH > SCREEN_HEIGHT) ? (SCREEN_WIDTH) : (SCREEN_HEIGHT))
#define SCREEN_WIDTH_IPHONE ((SCREEN_HEIGHT < SCREEN_WIDTH) ? (SCREEN_HEIGHT) : (SCREEN_WIDTH))

// 判断屏幕尺寸
#define SCREEN_55_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_47_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_4_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREEN_35_INCH	([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

// 主窗口尺寸
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height


/**
 判读是否iOS7及以上版本
 */

#define     iOS7                    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define     iOS8                    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//#define     iPhone6P                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(1242, 2208), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//
//#define     iPhone6                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(750, 1334), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//#define     iPhone5                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(640, 1136), \
//[[UIScreen mainScreen] currentMode].size) : NO)
//
//#define     iPhone4                 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? \
//CGSizeEqualToSize(CGSizeMake(640, 960), \
//[[UIScreen mainScreen] currentMode].size) : NO)

#define     iPhone6P                (([[UIScreen mainScreen] bounds].size.height) > 667)
#define     iPhone6                 (([[UIScreen mainScreen] bounds].size.height) == 667)
#define     iPhone5                 (([[UIScreen mainScreen] bounds].size.height) == 568)
#define     iPhone4                 (([[UIScreen mainScreen] bounds].size.height) == 480)


#define     kLodingGifSize           CGSizeMake(120, 120)
#define     kLodingGifTitle          @"加载中 · · ·"
#define     kLodingGifTitleColor     RGBA(65, 65, 65, 1)
#define     kLodingGifTitleFont      kFont(13)

/**
 *  通知的 名字
 */

#define     kShowInvestmentDetail     @"kShowInvestmentDetail"   //  显示 投资 详情
#define     kInvestment               @"kInvestment"            //  投资
#define     kGoLogin                  @"kGoLogin"            //  登录
#define     kUseRateMore              @"kUseRateMore"            //  使用 加息劵
#define     kUseVouchers              @"kUseVouchers"            //  使用 代金卷
#define     kShowNewActivity          @"kShowNewActivity"        //  显示新活动
#define     kShowRateCouponsCount     @"kShowRateCouponsCount"   //  显示加息券 数量

#define     kDataPageSize             @"20"        //  显示新活动




/**
 * 字体定义
 */

#define     kFont(a)            [UIFont systemFontOfSize:a]

#define     kFontBold(a)           [UIFont fontWithName:@"Helvetica-Bold" size:a]       // 兰亭黑-简 中黑
#define     kFontLight(a)          [UIFont fontWithName:@"Marion-Regular" size:a]       // 兰亭黑-简 纤黑

#define     kFontBoldW6(a)      [UIFont fontWithName:@"STHeitiSC-Medium" size:a]     // 冬青黑体简体中文 W6
#define     kFontBoldW3(a)      [UIFont fontWithName:@"STHeitiSC-Light" size:a]      // 冬青黑体简体中文 W3

/**
 *  文案
 */
#define    kNoConnectInternet           @"设备没有联网"
#define    kErrorUserNameOrPwd          @"用户名或密码错误"
#define    kEmptyPhoneNum               @"手机号不能为空!"
#define    kInvalidatePhoneNum          @"手机号不合法!"
#define    kUsePhoneNumRegister         @"请你输入手机号进行注册"
#define    kRegisteredPhoneNum          @"手机号已注册过,可直接登录!"
#define    kUnRegisteredPhoneNum        @"您的手机号尚未注册,去注册"
#define    kErrorUnRegisteredPhoneNum   @"请输入正确的手机号去进行注册"

#define    kMessageCodeNote         [NSString stringWithFormat:@"我们已发送短信验证码至%@,请在输入框内填写验证码,若未收到请耐心等待~", _mobileNum]
#define    kInputVerifiyCode        @"请输入验证码!"
#define    kInvalidateVerifiyCode   @"验证码不正确!"

#define    kRegisterSuccess         @"注册成功!"
#define    kRegisterFail            @"注册失败!"

#define    kEmptyPassword           @"密码不能为空!"
#define    kEmptyOldPassword        @"旧密码不能为空!"
#define    kPasswordNotice          @"密码由6-15位英文字母、数字或下划线组成"
#define    kNotSamePassword         @"两次密码输入不一致!"
#define    kReInputPassword         @"请再次输入密码!"
#define    kSameOldAndNewPassword   @"新密码不能和旧密码想相同"
#define    kModifyPwdSuccess        @"恭喜您,密码修改成功"

#define    kInputRealName           @"请输入真实姓名!"
#define    kEmptyCardId             @"身份证号不能为空!"
#define    kInvalidateCardId        @"身份证号不合法!"

#define    kInvalidateUserRealInfo      @"您输入的身份信息有误!"
#define    kSignNotice                  @"今日已领取1枚苹果币，明天还可继续领取"
#define    kSignFailNotice              @"签到失败!"

#define    kInputInvestmentMoney        @"请输入投资金额"
#define    kInputTopUpMoney             @"请输入充值金额!"
#define    kInputWithdrawalMoney        @"请输入提现金额!"
#define    kInputTransferMoney          @"请输入转让金额!"

#define    kInputWelfareWithdrawalMoney   @"提现金额不能为空"
#define    kWelfareWithdrawalNote         @"提现金额不能大于红包总额"
#define    kMoneyFormatNote               @"输入的金额必须是不以0开头的整数或最多两位小数"

#define    kVouchersNote                  @"您最多只能选择1张现金券"
#define    kRateMoreNote                  @"您最多只能选择2张加息券"
#define    kAppleCoinExchangeMoneySus     @"兑换成功，现金已存入您的账户"
#define    kAppleCoinExchangeGiftSus      @"兑换成功！工作人员会在1~3个工作日内与您联系"


#define    kOfficialQQGroup                @"398504621"   //  官方 QQ 群
#define    kOfficialWeChat                 @"palcw8"      //  官方 微信号
#define    kCustomerServiceTime            @"工作日09:00~19:00"      //  客服 工作 时间
#define    kCustomerServiceNumber          @"4006917677"      //  客服 电话
#define    kCustomerServiceNumberNote      @"400-691-7677"      //  客服 电话
#define    kClearCache                     @"确认清除缓存"

#define    kUnAuthentic                    @"你还没有进行实名认证,不能进行银行卡管理、充值、提现等操作"
#define    kUnAuthenticRedPackage          @"你还没有实名认证,不能进行红包转出操作"
#define    kUnBindCard                     @"绑定银行卡后才可以提现"
#define    kUnBindCardRecharge             @"充值之前请先绑卡，是否绑卡？"

#define    kInputContactName               @"请输入紧急联系人姓名"
#define    kInputContactPhone              @"请输入紧急联系人手机号"

#define    kMinTenderMoney                 @"自动投标起投金额为1000元"   //  自定义 投标金额
#define    kTenderMoney                    @"金额为1000元或1000的整数倍"   //  自定义 投标金额
#define    kRemainMoney                    @"您当前可用的保留余额为"   //  保留金额
#define    kCancleSetTenderMoneyInfo       @"是否放弃设置自动投标信息"   // 设置 自动投标信息


#define    kLoading                        @"数据加载中"
#define    kInvalidateEmail                @"电子邮箱不合法!"

#define    kShortageAppleCoins             @"您的苹果币不足"

#define    kCancleBindBankCardNote          @"您的银行卡预约解绑成功"      //  银行卡 预约解绑 成功

/**
 *  本地 json 文件
 */
#define    kHelpCenterInfo                     @"help_center_info"    //  帮助中心

/**
 *  颜色
 */
#define kBackGroundColor        RGBA(246, 246, 248, 1)

#define kRedColor               RGBA(255, 100, 100, 1)   // 红色
#define kRedColorAlpha(a)       RGBA(255, 100, 100, a)   // 红色

#define kGreenColor             RGBA(0, 200, 200, 1)     // 绿色
#define kGreenColorAlpha(a)     RGBA(0, 200, 200, a)     // 绿色

#define kWhiteColor             RGBA(255, 255, 255, 1)   // 白色

#define kLineColor              RGBA(220, 221, 221, 1)   // 分割线颜色
#define kLineColorAlpha(a)      RGBA(220, 221, 221, a)   // 分割线颜色


#define  RGBA(r, g, b, a)       [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]


/**
 返回一个介于-1到1之间的随机浮点数
 */
#define IMRANDOM_MINUS1_1() ((2.0f*((float)rand()/RAND_MAX))-1.0f)


/**
 返回一个介于0到1之间的随机浮点数
 */
#define IMRANDOM_0_1() ((float)rand()/RAND_MAX)

#endif
