//
//  ViewController.m
//  KVODemo
//
//  Created by mac on 15-3-10.
//  Copyright (c) 2015年 wangTao. All rights reserved.
//

#import "ViewController.h"
#import "Human.h"
#import <objc/runtime.h>
@interface ViewController ()
{
    Human *somePeople;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    somePeople = [[Human alloc]init];
    printDescription(@"somePeople", somePeople);
    
    [somePeople setValue:@"who" forKey:@"name"];
    
    [somePeople addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    printDescription(@"somePeople", somePeople);
    [somePeople setValue:@"i donnot know" forKey:@"name"];
    //somePeople.name = @"WangTao";
   
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"ok");
    }
}
static void printDescription(NSString* name, id obj)
{
    NSString* string = [NSString stringWithFormat:@"%@:%@\n\tclass %@\n\tobjclass %@\n\timplementmethod %@\n",
                        name,
                        obj,
                        [obj class],
                        object_getClass(obj),
                        [classMethodList(object_getClass(obj)) componentsJoinedByString:@" , "]];
    printf("%s", [string UTF8String]);
}
static NSArray* classMethodList(Class c)
{
    NSMutableArray* array = [NSMutableArray arrayWithCapacity:5];
    unsigned int count = 0;
    Method* methodList = class_copyMethodList(c, &count);
    for(int i = 0; i < count; ++i)
    {
        SEL sel = method_getName(*(methodList+i));
        [array addObject:NSStringFromSelector(sel)];
    }
    free(methodList);
    return array;
}
- (void)dealloc{
   [somePeople removeObserver:self forKeyPath:@"name"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
