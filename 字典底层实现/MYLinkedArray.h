//
//  MYLinkedArray.h
//  链表数组
//
//  Created by 孟遥遥 on 2017/4/30.
//  Copyright © 2017年 孟遥遥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYLinkedArray : NSObject

@property (assign , nonatomic) NSUInteger size; //数组长度


- (void)addObject:(NSObject *)obj; //添加元素

- (void)remove:(NSObject *)obj; //移除指定元素

- (void)removeAtIndex:(NSInteger)index; //移除指定索引元素

- (NSObject *)objectAtIndex:(NSInteger)index;  //获取指定位置的值

+ (instancetype)array; //数组初始化

@end

@interface Node : NSObject

@property (strong , nonatomic) Node *previous; //上个节点

@property (strong , nonatomic) Node *next; //下个节点

@property (strong , nonatomic) id content; //当前节点内容

@end
