//
//  FFColorMacros.h
//  fangfull_new
//
//  Created by Lee on 16/7/19.
//  Copyright © 2016年 zhonhong. All rights reserved.
//

#ifndef FFColorMacros_h
#define FFColorMacros_h

/*--------------------------App掉用颜色方法封装--------------------------------------------*/

#define FFColorRGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define FFColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define FFColorRGBHex(hexString) [UIColor colorWithHexString:hexString]
#define FFColorRGBAHex(hexString, alpha_) [UIColor colorWithHexString:(hexString) alpha:(alpha_)]

/*--------------------------App常用颜色定义----------------------------------------------*/
#define FFColor_NavigationBarBackGround   FFColorRGB(0.0f,148.0f,124.0f)


#endif /* FFColorMacros_h */
