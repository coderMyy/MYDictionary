//
//  MYDictionary.h
//  字典底层实现
//
//  Created by 孟遥遥 on 2017/4/30.
//  Copyright © 2017年 孟遥遥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYDictionary : NSObject

+ (instancetype)dictionary;

- (void)setValue:(id)value forkey:(NSString *)key;

- (id)valueForKey:(NSString *)key;

@end
