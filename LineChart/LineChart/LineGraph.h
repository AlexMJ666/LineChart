//
//  LineGraph.h
//  LineChart
//
//  Created by 马家俊 on 17/3/20.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BrokenLine;
@class LineNameView;
typedef NS_ENUM(NSUInteger, GraphTypeValue) {
    GraphTypeValue1,                                        //XY轴数字类型折线图
    GraphTypeValue2,                                        //X轴日期，Y轴数字折线图
};
typedef NS_ENUM(NSUInteger, LineNamePosition) {
    LineNamePositionUpleft,                                     //折线对应的名称在左上
    LineNamePositionUpRight,                                    //折线对应的名称在右上
    LineNamePositionCenter,                                     //折线对应的名称在中上
};

@interface LineGraph : UIView
@property (nonatomic, strong) NSMutableArray* totalBrokenArray;    //传入的折线数组
@property (nonatomic, strong) NSArray* XArray;              //传入的X轴数据数组
@property (nonatomic, strong) NSArray* YArray;              //传入的Y轴数据数组
@property (nonatomic, assign) CGFloat MaxX;                 //X轴最大值
@property (nonatomic, assign) CGFloat MaxY;                 //Y轴最大值
@property (nonatomic, assign) UIColor*  XYlineColor;        //线条颜色
@property (nonatomic, strong) NSString* xUnit;              //X轴单位
@property (nonatomic, strong) NSString* yUnit;              //Y轴单位
@property (nonatomic, assign) GraphTypeValue chartType;     //初始化类型
@property (nonatomic, assign) LineNamePosition namePosition;//名称的位置
-(void)addBrokenLine:(BrokenLine*)bkLin;
@end

@interface BrokenLine : NSObject
@property (nonatomic, assign) UIColor*  lineColor;          //折线颜色

@property (nonatomic, strong) NSArray* brokenArray;         //传入的point数组
@property (nonatomic, strong) NSString* lineName;           //该折线对应的名称
-(NSMutableArray*)drawBrokenLine:(CGRect)lineFrame andMaxX:(CGFloat)maxX andMaxY:(CGFloat)maxY;
@end

@interface LineNameView : UIView
@property (nonatomic, strong) IBOutlet UIView* colorView;
@property (nonatomic, strong) IBOutlet UILabel* nameLab;

+ (instancetype)viewFromNIB;
@end
