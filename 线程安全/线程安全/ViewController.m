//
//  ViewController.m
//  线程安全
//
//  Created by panhongliu on 2017/5/17.
//  Copyright © 2017年 wangsen. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *obj = [[NSObject alloc] init];

    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//
//        @synchronized (obj) {
//
//            NSLog(@"需要线程同步的操作1 开始");
//            sleep(3);
//
//            NSLog(@"需要线程同步的操作1 结束");
//        }
//       
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        sleep(1);
//        @synchronized (obj) {
//            NSLog(@"需要线程同步的操作2");
// 
//        }
//
//    });
    
    
#pragma mark dispatch_semaphore1
    
//    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
//    
//    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW,2 * NSEC_PER_SEC);
//    dispatch_time_t overTime2 = dispatch_time(DISPATCH_TIME_NOW, 30 * NSEC_PER_SEC);
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        dispatch_semaphore_wait(signal, overTime);
//        NSLog(@"需要线程同步的操作1 开始");
////        sleep(1);
//        for( long i= 0 ;i<100000;i++)
//        {
//            
//            
//        }
//        
//        NSLog(@"需要线程同步的操作1 结束");
//        dispatch_semaphore_signal(signal);
//        
//    });
//                   
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////        sleep(2);
//        dispatch_semaphore_wait(signal, overTime2);
//        NSLog(@"需要线程同步的操作2");
//        dispatch_semaphore_signal(signal);
//    });
    
#pragma mark dispatch_semaphore2

//    dispatch_semaphore_t signal;
//    signal = dispatch_semaphore_create(1);
//    __block long x = 0;
//    NSLog(@"0_x:%ld",x);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        sleep(3);
//        NSLog(@"waiting");
//        x = dispatch_semaphore_signal(signal);
//        NSLog(@"1_x:%ld",x);
//        
//        sleep(2);
//        NSLog(@"waking22");
//        x = dispatch_semaphore_signal(signal);
//        NSLog(@"2_x:%ld",x);
//    });
//    //    dispatch_time_t duration = dispatch_time(DISPATCH_TIME_NOW, 1*1000*1000*1000); //超时1秒
//    //    dispatch_semaphore_wait(signal, duration);
//    
//    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//    NSLog(@"3_x:%ld",x);
//    
//    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//    NSLog(@"wait 2");
//    NSLog(@"4_x:%ld",x);
//    
//    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//    NSLog(@"wait 3");
//    NSLog(@"5_x:%ld",x);
//    x = dispatch_semaphore_signal(signal);

#pragma mark NSLock
//    NSLock *lock = [[NSLock alloc] init];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////        [lock lock];
////       BOOL isLock= [lock lockBeforeDate:[NSDate date]];
////        NSLog(@"%@",isLock ?@"1":@"0");
//        [lock lock];
//
//        NSLog(@"需要线程同步的操作1 开始");
//        sleep(4);
//        NSLog(@"需要线程同步的操作1 结束");
//        [lock unlock];
//        
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        sleep(3);
//
//        if ([lock tryLock]) {//尝试获取锁，如果获取不到返回NO，不会阻塞该线程
//            NSLog(@"锁可用的操作");
//            [lock lock];
//        }else{
//            NSLog(@"锁不可用的操作");
//        }
//        
//        
//        //线程2
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            sleep(1);//以保证让线程2的代码后执行
//            [lock lock];
//            NSLog(@"线程的二操作");
//
//            
//            [lock unlock];
//        });
//        
//    NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3];
//        if ([lock lockBeforeDate:date]) {//尝试在未来的3s内获取锁，并阻塞该线程，如果3s内获取不到恢复线程, 返回NO,不会阻塞该线程
//            NSLog(@"没有超时，获得锁");
//            [lock unlock];
//        }else{
//            NSLog(@"超时，没有获得锁");
//        }
//    });
//    
#pragma mark NSRecursiveLock

    
//    NSLock *lock = [[NSLock alloc] init];
//    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        static void (^RecursiveMethod)(int);
//        
//        RecursiveMethod = ^(int value) {
//            
//            [lock lock];
//            if (value > 0) {
//                
//                NSLog(@"value = %d", value);
//                sleep(1);
//                RecursiveMethod(value - 1);
//            }
//            [lock unlock];
//        };
//        
//        RecursiveMethod(5);
//    });
#pragma mark NSConditionLock
    
    
//        NSConditionLock *lock = [[NSConditionLock alloc] init];
//
//    NSMutableArray *products = [NSMutableArray array];
//    
//    NSInteger HAS_DATA = 1;
//    NSInteger NO_DATA = 0;
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        while (1) {
//            [lock lockWhenCondition:NO_DATA];
//            [products addObject:[[NSObject alloc] init]];
//            NSLog(@"produce a product,总量:%zi",products.count);
//            [lock unlockWithCondition:HAS_DATA];
//            sleep(1);
//        }
//        
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        while (1) {
//            NSLog(@"wait for product");
//            [lock lockWhenCondition:HAS_DATA];
//            [products removeObjectAtIndex:0];
//            NSLog(@"custome a product");
//            [lock unlockWithCondition:NO_DATA];
//        }
//        
//    });
    
#pragma mark NSCondition

//    NSCondition *condition = [[NSCondition alloc] init];
//    
//    NSMutableArray *products = [NSMutableArray array];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        while (1) {
//            [condition lock];
//            if ([products count] == 0) {
//                NSLog(@"wait for product");
//                [condition wait];
//            }
//            [products removeObjectAtIndex:0];
//            NSLog(@"custome a product");
//            [condition unlock];
//        }
//        
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        while (1) {
//            [condition lock];
//            [products addObject:[[NSObject alloc] init]];
//            NSLog(@"produce a product,总量:%zi",products.count);
//            [condition signal];
//            [condition unlock];
//            sleep(1);
//        }
//        
//    });
    
#pragma mark pthread_mutex
    
    __block pthread_mutex_t theLock;
    pthread_mutex_init(&theLock, NULL);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        pthread_mutex_lock(&theLock);
        NSLog(@"需要线程同步的操作1 开始");
        sleep(3);
        NSLog(@"需要线程同步的操作1 结束");
        pthread_mutex_unlock(&theLock);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        pthread_mutex_lock(&theLock);
        NSLog(@"需要线程同步的操作2");
        pthread_mutex_unlock(&theLock);
        
    });

//    pthread_mutex_destroy(&theLock);

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
