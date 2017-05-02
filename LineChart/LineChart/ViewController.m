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
    lineGraphView.XArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    lineGraphView.YArray = @[@"0",@"0.3",@"0.4",@"0.6",@"0.8",@"1.0"];
    lineGraphView.MaxX = 10.0f;
    lineGraphView.MaxY = 1.0f;
    lineGraphView.XYlineColor = [UIColor redColor];
    lineGraphView.namePosition = LineNamePositionUpRight;
    lineGraphView.layer.borderWidth = 1;
    [self.view addSubview:lineGraphView];
    
    BrokenLine* bkLin = [BrokenLine new];
    bkLin.lineColor = [UIColor greenColor];
    bkLin.lineName = @"测试1";
    bkLin.brokenArray = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.7)],[NSValue valueWithCGPoint:CGPointMake(1.3, 0.3)],[NSValue valueWithCGPoint:CGPointMake(1.7, 0.5)],[NSValue valueWithCGPoint:CGPointMake(1.9, 0.8)],[NSValue valueWithCGPoint:CGPointMake(2.4, 0.3)],[NSValue valueWithCGPoint:CGPointMake(3.3, 0.44)],[NSValue valueWithCGPoint:CGPointMake(3.9, 0.3)]];
    [lineGraphView addBrokenLine:bkLin];
    
    BrokenLine* bkLin1 = [BrokenLine new];
    bkLin1.lineColor = [UIColor blueColor];
    bkLin1.lineName = @"测试2";
    bkLin1.brokenArray = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.65)],[NSValue valueWithCGPoint:CGPointMake(1.3, 0.25)],[NSValue valueWithCGPoint:CGPointMake(1.7, 0.45)],[NSValue valueWithCGPoint:CGPointMake(1.9, 0.75)],[NSValue valueWithCGPoint:CGPointMake(2.4, 0.25)],[NSValue valueWithCGPoint:CGPointMake(3.3, 0.39)],[NSValue valueWithCGPoint:CGPointMake(3.9, 0.25)]];
    [lineGraphView addBrokenLine:bkLin1];
    
    BrokenLine* bkLin2 = [BrokenLine new];
    bkLin2.lineColor = [UIColor redColor];
    bkLin2.lineName = @"测试3";
    bkLin2.brokenArray = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.45)],[NSValue valueWithCGPoint:CGPointMake(1.3, 0.15)],[NSValue valueWithCGPoint:CGPointMake(1.7, 0.35)],[NSValue valueWithCGPoint:CGPointMake(1.9, 0.65)],[NSValue valueWithCGPoint:CGPointMake(2.4, 0.15)],[NSValue valueWithCGPoint:CGPointMake(3.3, 0.69)],[NSValue valueWithCGPoint:CGPointMake(3.9, 0.75)]];
    [lineGraphView addBrokenLine:bkLin2];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
