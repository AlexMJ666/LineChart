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
    
    [self drawXAndVirtualLine:context];
    [self createY];
}

-(void)drawXAndVirtualLine:(CGContextRef)context
{
    for (int i = 0; i<self.XArray.count; i++) {
        CGFloat width = (self.frame.size.width - defaultX*2)/self.XArray.count;
        UILabel * xLab = [[UILabel alloc]initWithFrame:CGRectMake(width*i+defaultX,self.frame.size.height-defalutY,width,defalutY)];
        xLab.text = self.XArray[i];
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
            CGContextMoveToPoint(context, xLab.frame.origin.x, self.frame.size.height-defalutY);
            // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
            CGFloat lengths[] = {5,5};
            // 虚线的起始点
            CGContextSetLineDash(context, 0, lengths,2);
            // 绘制虚线的终点
            NSLog(@"%lf",self.frame.size.height);
            CGContextAddLineToPoint(context, xLab.frame.origin.x,defalutY);
            // 绘制
            CGContextStrokePath(context);
        }
    }
}

-(void)createY
{
    for (int i = 0; i<self.YArray.count; i++) {
        CGFloat width = (self.frame.size.height - defalutY*2)/self.XArray.count;
        UILabel * xLab = [[UILabel alloc]initWithFrame:CGRectMake(0,self.frame.size.height-defalutY*2-width*i,width,defalutY)];
        xLab.text = self.YArray[i];
        xLab.textColor = [UIColor blackColor];
        xLab.font = [UIFont systemFontOfSize:10];
        [self addSubview:xLab];
    }
}

@end
