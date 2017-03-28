//
//  LineGraph.m
//  LineChart
//
//  Created by 马家俊 on 17/3/20.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "LineGraph.h"

#define defaultX    18
#define defalutY    18
@implementation LineGraph

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context,[UIColor redColor].CGColor);
    CGContextMoveToPoint(context, defaultX, defalutY);
    CGContextAddLineToPoint(context, defaultX, rect.size.height - defalutY);
    CGContextAddLineToPoint(context,rect.size.width - defaultX, rect.size.height - defalutY);
    CGContextStrokePath(context);
    
    [self drawXYAndVirtualLine];
    [self drawLineAndPointToGraph];
}

-(void)drawXYAndVirtualLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0; i<self.XArray.count; i++) {
        CGFloat width = (self.frame.size.width - defaultX*2)/self.XArray.count;
        UILabel * xLab = [[UILabel alloc]initWithFrame:CGRectMake(width*i+defaultX,self.frame.size.height-defalutY,width,defalutY)];
        xLab.center = CGPointMake(width*i+defaultX, xLab.center.y);
        xLab.text = self.XArray[i];
        xLab.textAlignment = NSTextAlignmentCenter;
        xLab.textColor = [UIColor blackColor];
        xLab.font = [UIFont systemFontOfSize:10];
        [self addSubview:xLab];
        
        if (i!=0) {
            // 设置线条的样式
            CGContextSetLineCap(context, kCGLineCapRound);
            // 绘制线的宽度
            CGContextSetLineWidth(context, 1.0);
            // 线的颜色
            CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
            // 开始绘制
            CGContextBeginPath(context);
            // 设置虚线绘制起点
            CGContextMoveToPoint(context, xLab.center.x, self.frame.size.height-defalutY);
            // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
            CGFloat lengths[] = {5,5};
            // 虚线的起始点
            CGContextSetLineDash(context, 0, lengths,2);
            // 绘制虚线的终点
            NSLog(@"%lf",self.frame.size.height);
            CGContextAddLineToPoint(context, xLab.center.x,defalutY);
            // 绘制
            CGContextStrokePath(context);
        }
    }
    
    //绘制Y轴
    for (int i = 0; i<self.YArray.count; i++) {
        CGFloat width = (self.frame.size.height - defalutY*2)/self.XArray.count;
        UILabel * xLab = [[UILabel alloc]initWithFrame:CGRectMake(0,self.frame.size.height-defalutY*2-width*i,width,defalutY)];
        xLab.text = self.YArray[i];
        xLab.textAlignment = NSTextAlignmentCenter;
        xLab.textColor = [UIColor blackColor];
        xLab.font = [UIFont systemFontOfSize:10];
        xLab.center = CGPointMake(xLab.frame.origin.x, self.frame.size.height-defalutY-width*i);
        [self addSubview:xLab];
    }
}

-(void)drawLineAndPointToGraph
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 1.0);
    
    //创建贝塞尔曲线对象
    UIBezierPath *currenPath = [UIBezierPath bezierPath];
    currenPath.lineCapStyle = kCGLineCapRound;//拐弯处为弧线
    currenPath.lineJoinStyle = kCGLineJoinRound;
    
    for (int i = 0; i<self.pointArray.count; i++) {
        NSValue* valueStart = self.pointArray[i];
        CGPoint pointStart = [valueStart CGPointValue];
//        NSValue* valueEnd = self.pointArray[i+1];
//        CGPoint pointEnd = [valueEnd CGPointValue];
        
        CGPoint p = CGPointMake(pointStart.x/_MaxX*(self.frame.size.width-2*defaultX), pointStart.y/_MaxY*(self.frame.size.height-2*defalutY));
//        CGContextMoveToPoint(context, pointStart.x/_MaxX*(self.frame.size.width-2*defaultX), pointStart.y/_MaxY*(self.frame.size.height-2*defalutY));
//        CGContextAddLineToPoint(context,  pointEnd.x/_MaxX*(self.frame.size.width-2*defaultX), pointEnd.y/_MaxY*(self.frame.size.height-2*defalutY));
//        CGContextStrokePath(context);
        // 设置起点
        if (i == 0) {
            [currenPath moveToPoint:CGPointMake(pointStart.x/_MaxX*self.frame.size.width+defaultX,self.frame.size.height - pointStart.y/_MaxY*(self.frame.size.height-defalutY))];
        }
        else
        {
            //把点加入到路径里面
            [currenPath addLineToPoint:CGPointMake(pointStart.x/_MaxX*self.frame.size.width+defaultX,self.frame.size.height -  pointStart.y/_MaxY*self.frame.size.height - defalutY)];
        }
        
        

    }
    //画线
    [currenPath stroke];
}
@end
