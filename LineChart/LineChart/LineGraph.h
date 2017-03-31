//
//  LineGraph.h
//  LineChart
//
//  Created by 马家俊 on 17/3/20.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GraphTypeValue) {
    GraphTypeValue1,                                    //XY轴数字类型折线图
    GraphTypeValue2,                                    //X轴日期，Y轴数字折线图
};
@interface LineGraph : UIView
@property (nonatomic, strong) NSArray* pointArray;      //传入的point数组
@property (nonatomic, strong) NSArray* XArray;          //传入的X轴数据数组
@property (nonatomic, strong) NSArray* YArray;          //传入的Y轴数据数组
@property (nonatomic, assign) CGFloat MaxX;             //X轴最大值
@property (nonatomic, assign) CGFloat MaxY;             //Y轴最大值
@property (nonatomic, assign) UIColor*  lineColor;      //线条颜色
@property (nonatomic, strong) NSString* xUnit;          //X轴单位
@property (nonatomic, strong) NSString* yUnit;          //Y轴单位
@property (nonatomic, assign) GraphTypeValue chartType; //初始化类型
@end
