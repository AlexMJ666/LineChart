//
//  LineGraph.m
//  LineChart
//
//  Created by 马家俊 on 17/3/20.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "LineGraph.h"

#define defaultX    28
#define defalutY    28
#define defaulArrowW 5
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
    CGContextSetStrokeColorWithColor(context,self.XYlineColor.CGColor);
    CGContextMoveToPoint(context, defaultX, defalutY);
    CGContextAddLineToPoint(context, defaultX, rect.size.height - defalutY);
    CGContextAddLineToPoint(context,rect.size.width - defaultX, rect.size.height - defalutY);
    
    //X轴箭头
    CGContextMoveToPoint(context, rect.size.width - defaultX - defaulArrowW, rect.size.height - defalutY - defaulArrowW);
    CGContextAddLineToPoint(context,rect.size.width - defaultX, rect.size.height - defalutY);
    CGContextAddLineToPoint(context,rect.size.width - defaultX - defaulArrowW, rect.size.height - defalutY + defaulArrowW);
    
    //Y轴箭头
    CGContextMoveToPoint(context, defaultX - defaulArrowW, defalutY + defaulArrowW);
    CGContextAddLineToPoint(context,defaultX, defalutY);
    CGContextAddLineToPoint(context,defaultX + defaulArrowW, defalutY + defaulArrowW);
    CGContextStrokePath(context);
    
    [self drawXYAndVirtualLine];
    [self drawLineAndPointToGraph];
}

-(void)drawXYAndVirtualLine
{
    for (int i = 0; i<self.XArray.count; i++) {
        CGFloat width = (self.frame.size.width - defaultX*2)/self.XArray.count;
        CGFloat Xnum = [self.XArray[i] floatValue];
        UILabel * xLab = [[UILabel alloc]initWithFrame:CGRectMake(width*i+defaultX,self.frame.size.height-defalutY,width,defalutY)];
        xLab.center = CGPointMake((Xnum/_MaxX)*(self.frame.size.width-2*defaultX)+defaultX, xLab.center.y);
        
        if (i != 0) {
            xLab.text = self.XArray[i];
        }
        xLab.textAlignment = NSTextAlignmentCenter;
        xLab.textColor = [UIColor blackColor];
        xLab.font = [UIFont systemFontOfSize:10];
        [self addSubview:xLab];
        
        NSLog(@"%lf",xLab.center.x);
        [self drawVirtualLine:xLab andStartPt:CGPointMake(xLab.center.x, self.frame.size.height-defalutY) andEndPt:CGPointMake(xLab.center.x,defalutY)];
    }
    
    //绘制Y轴
    for (int i = 0; i<self.YArray.count; i++) {
        CGFloat width = (self.frame.size.height - defalutY*2)/self.YArray.count;
        CGFloat Ynum = [self.YArray[i] floatValue];
        UILabel * yLab = [[UILabel alloc]initWithFrame:CGRectMake(0,(Ynum/_MaxY)*(self.frame.size.height-2*defalutY)+defalutY,width,defalutY)];
        
        if (i != 0) {
            yLab.text = self.YArray[i];
        }
        yLab.textAlignment = NSTextAlignmentCenter;
        yLab.textColor = [UIColor blackColor];
        yLab.font = [UIFont systemFontOfSize:10];
        yLab.center = CGPointMake(yLab.frame.size.width/2,(self.frame.size.height-2*defalutY) - (Ynum/_MaxY)*(self.frame.size.height-2*defalutY)+defalutY);
        [self addSubview:yLab];
        [self drawVirtualLine:yLab andStartPt:CGPointMake(defaultX, yLab.center.y) andEndPt:CGPointMake(self.frame.size.width-defaultX,yLab.center.y)];
    }
}

-(void)drawVirtualLine:(UILabel*)lab andStartPt:(CGPoint)pStart andEndPt:(CGPoint)pEnd
{
     CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线的宽度
    CGContextSetLineWidth(context, 0.2f);
    // 线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    // 设置虚线绘制起点
    CGContextMoveToPoint(context, pStart.x, pStart.y);
    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    CGFloat lengths[] = {5,5};
    // 虚线的起始点
    CGContextSetLineDash(context, 0, lengths,2);
    // 绘制虚线的终点
    NSLog(@"%lf",self.frame.size.height);
    CGContextAddLineToPoint(context, pEnd.x,pEnd.y);
    // 绘制
    CGContextStrokePath(context);
}

-(void)drawLineAndPointToGraph
{
    for (int j = 0; j<self.brokenArray.count; j++) {
        NSArray* arr = self.brokenArray[j];
        BrokenLine* brokenLine = [[BrokenLine alloc]init];
        [brokenLine drawBrokenLine:arr andFrame:self.frame andMaxX:_MaxX andMaxY:_MaxY];
    }
}
@end

@implementation BrokenLine

-(void)drawBrokenLine:(NSArray*)ptArr andFrame:(CGRect)lineFrame andMaxX:(CGFloat)maxX andMaxY:(CGFloat)maxY
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建贝塞尔曲线对象
    UIBezierPath *currenPath = [UIBezierPath bezierPath];
    currenPath.lineCapStyle = kCGLineCapRound;//拐弯处为弧线
    currenPath.lineJoinStyle = kCGLineCapRound;
    currenPath.lineWidth = 0.3f;
    UIColor *color = [UIColor blueColor];
    [color set];
    CGFloat lengths[] = {10,0};
    CGContextSetLineDash(context, 0, lengths,2);
    
    for (int i = 0; i<ptArr.count; i++) {
        NSValue* valueStart = ptArr[i];
        CGPoint pointStart = [valueStart CGPointValue];
        CGPoint p = CGPointMake((pointStart.x/maxX)*(lineFrame.size.width-2*defaultX), (pointStart.y/maxY)*(lineFrame.size.height-2*defalutY));
        if (i == 0) {
            [currenPath moveToPoint:CGPointMake(p.x+defaultX,lineFrame.size.height-p.y-defalutY)];
        }
        else
        {
            //把点加入到路径里面
            [currenPath addLineToPoint:CGPointMake(p.x+defaultX,lineFrame.size.height-p.y-defalutY)];
        }
    }
    //画线
    [currenPath stroke];
}

@end
