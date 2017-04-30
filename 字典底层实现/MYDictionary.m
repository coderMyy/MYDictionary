//
//  MYDictionary.m
//  字典底层实现
//
//  Created by 孟遥遥 on 2017/4/30.
//  Copyright © 2017年 孟遥遥. All rights reserved.
//

#import "MYDictionary.h"
#import "MYLinkedArray.h"

@interface KeyValueCache : NSObject

@property (nonatomic, strong) NSString *key;

@property (nonatomic, strong) id  value;

@end

@implementation KeyValueCache

+ (instancetype)key:(NSString *)key value:(id)value
{
    KeyValueCache *model = [[self alloc]init];
    
    model.key   = key;
    model.value = value;
    
    return model;
}

@end




@interface MYDictionary ()

@end

@implementation MYDictionary
{
    MYLinkedArray *_keyValues[999];
}

//构造方法
+ (instancetype)dictionary
{
    return [[self alloc]init];
}


//赋值
- (void)setValue:(id)value forkey:(NSString *)key
{
    //获取hashCode
    NSUInteger hash        = key.hash;
    //默认一个对象占用8个字节
    NSUInteger realCode    = hash%(sizeof(_keyValues)/8);
    
    MYLinkedArray *linkArr = _keyValues[realCode];
    if (linkArr) { //如果存在链表数组
        
        for (NSInteger index = 0; index < linkArr.size; index ++) {
            
            KeyValueCache *keyValue = (KeyValueCache *)[linkArr objectAtIndex:index];
            if ([keyValue.key isEqualToString:key]) { //如果存在相同的Key ，更新value
                keyValue.value = value; //重新赋值value
                return;
            }
        }
        
        //创建新的键值对存储
        KeyValueCache *newKeyValue  = [KeyValueCache key:key value:value];
        [linkArr addObject:newKeyValue];
        
    }else{ //不存在链表数组
        
        //创建新的链表数组
        MYLinkedArray *newLinkArray = [MYLinkedArray array];
        KeyValueCache *newKeyValue  = [KeyValueCache key:key value:value];
        [newLinkArray addObject:newKeyValue];
        _keyValues[realCode]        = newLinkArray;
    }
}


//根据键取值
- (id)valueForKey:(NSString *)key
{
    if (!key.length) return nil;
    
    //获取hashCode
    NSUInteger hash        = key.hash;
    NSUInteger realCode    = hash%999;
    
    MYLinkedArray *linkArr = _keyValues[realCode];
    if (linkArr) {
        
        //遍历链表，取出value
        for (NSInteger index = 0; index < linkArr.size; index ++) {
         
            KeyValueCache *keyvalue = (KeyValueCache *)[linkArr objectAtIndex:index];
            if ([keyvalue.key isEqualToString:key]) {
                
                return keyvalue.value;
            }
        }
    }
    
    return nil;
}


@end



