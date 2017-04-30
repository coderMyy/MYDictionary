//
//  MYLinkedArray.m
//  链表数组
//
//  Created by 孟遥遥 on 2017/4/30.
//  Copyright © 2017年 孟遥遥. All rights reserved.
//

#import "MYLinkedArray.h"

@interface MYLinkedArray ()

@property (nonatomic, strong) Node *first; //首个节点

@property (nonatomic, strong) Node *last; //最后节点    

@end

@implementation MYLinkedArray

//添加元素
- (void)addObject:(NSObject *)obj
{
    
    if (!obj) return;
    _size ++ ;
    
    Node *node = [[Node alloc]init];
    //首个节点为空
    if (!_first) {
        _first = node;
        _last  = node;
        node.previous = nil;
        node.next     = nil;
        node.content  = obj;
        return;
    }
    
   //数组中有值
    node.previous = _last;
    node.next     = nil;
    node.content  = obj;
    _last         = node;
    _last.next    = node;   
}


//移除元素
- (void)remove:(NSObject *)obj
{
    if (!obj||!_size) return;
    
    Node *tmpNode = _first;
    
    for (NSInteger index = 0; index < _size; index ++) {
        
        if ([tmpNode.content isEqual:obj]) {
            
            [self removeNode:tmpNode]; //移除节点
            
            break;
        }
    }
}


//根据索引移除元素
- (void)removeAtIndex:(NSInteger)index
{
    
    if (index<0||index>=_size) return;
    
    Node *tmpNode = _first;
    
    for (NSInteger i = 0; i < _size; i ++) {
        
        if (i == index) {
           
            [self removeNode:tmpNode]; //移除节点
            
            break;
        }
        tmpNode   = tmpNode.next;
    }
}


//获取指定索引元素
- (NSObject *)objectAtIndex:(NSInteger)index
{
    if (index<0||index>=_size) return nil;
    
    Node *tmpNode = _first;
    
    for (NSInteger i = 0; i < _size; i ++) {
        
        if (i == index) {
            
            return tmpNode.content;
        }
        tmpNode   = tmpNode.next;
    }
    return nil;
}


//私有
- (void)removeNode:(Node *)node
{
    //连接上下节点
    Node *preNode     = node.previous;
    Node *nextNode    = node.next;
    preNode.next      = nextNode;
    nextNode.previous = preNode;
    node.content      = nil; //清空被移除节点内容
    _size -- ;//长度更新
}


//构造方法
+ (instancetype)array
{
    return [[self alloc]init];
}


@end



@implementation Node



@end
