//
//  ViewController.m
//  LineChart
//
//  Created by 马家俊 on 17/3/20.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "ViewController.h"
#import "LineGraph.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LineGraph* lineGraphView = [[LineGraph alloc]initWithFrame:CGRectMake(20, 100, 300, 200)];
    lineGraphView.XArray = @[@"0",@"1",@"2",@"3",@"4"];
    lineGraphView.YArray = @[@"0",@"0.3",@"0.4",@"0.6",@"0.8",@"1.0"];
    lineGraphView.MaxX = 4.0f;
    lineGraphView.MaxY = 1.0f;
    lineGraphView.XYlineColor = [UIColor redColor];
    NSMutableArray* muArr = [NSMutableArray new];
    NSArray* arr = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.7)],[NSValue valueWithCGPoint:CGPointMake(1.3, 0.3)],[NSValue valueWithCGPoint:CGPointMake(1.7, 0.5)],[NSValue valueWithCGPoint:CGPointMake(1.9, 0.8)],[NSValue valueWithCGPoint:CGPointMake(2.4, 0.3)],[NSValue valueWithCGPoint:CGPointMake(3.3, 0.44)],[NSValue valueWithCGPoint:CGPointMake(3.9, 0.3)]];
    
    NSArray* arr2 = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.68)],[NSValue valueWithCGPoint:CGPointMake(1.3, 0.28)],[NSValue valueWithCGPoint:CGPointMake(1.7, 0.48)],[NSValue valueWithCGPoint:CGPointMake(1.9, 0.78)],[NSValue valueWithCGPoint:CGPointMake(2.4, 0.28)],[NSValue valueWithCGPoint:CGPointMake(3.3, 0.42)],[NSValue valueWithCGPoint:CGPointMake(3.9, 0.28)]];
    [muArr addObject:arr];
    [muArr addObject:arr2];
    lineGraphView.brokenArray = muArr;
    
    
    [self.view addSubview:lineGraphView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
