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
    lineGraphView.YArray = @[@"0.2",@"0.4",@"0.6",@"0.8",@"1.0"];
    lineGraphView.lineColor = [UIColor redColor];
    lineGraphView.pointArray = @[[NSValue valueWithCGPoint:CGPointMake(0, 0.7)],[NSValue valueWithCGPoint:CGPointMake(1, 0.3)],[NSValue valueWithCGPoint:CGPointMake(2, 0.5)],[NSValue valueWithCGPoint:CGPointMake(3, 0.8)],[NSValue valueWithCGPoint:CGPointMake(4, 0.3)]];
    [self.view addSubview:lineGraphView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
