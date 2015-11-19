//
//  MyUIView.m
//  Topic 13
//
//  Created by Lun Sovathana on 11/19/15.
//  Copyright © 2015 Lun Sovathana. All rights reserved.
//

#import "MyUIView.h"

@implementation MyUIView

int r;
int currentR=0;

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}

-(void)awakeFromNib {
    [self setUp];
}

-(void)setUp{
    
    self.backgroundColor = [UIColor whiteColor];
    self.opaque = YES;
    
    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self addGestureRecognizer:singleFingerTap];
    
    //[self setNeedsDisplay];
    
}



//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    //CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    [self setNeedsDisplay];
}

//draw circle
- (void)drawCircle:(CGContextRef)context {
    UIGraphicsPushContext(context);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds]; [path addClip];
    [path fill];
    UIGraphicsPopContext();
}

//draw triangle
- (void)drawTriangle:(CGContextRef)context {
    UIGraphicsPushContext(context); UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(45, 0)]; [path addLineToPoint:CGPointMake(90, 90)]; [path addLineToPoint:CGPointMake(0, 90)];
    [path closePath];
    [path fill];
}

//draw Rectangle
- (void)drawRectangle:(CGContextRef)context { UIGraphicsPushContext(context);
    CGContextAddRect(context, self.bounds);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

//draw pentagon
-(void)drawPentagon:(CGContextRef)context { UIGraphicsPushContext(context);
    UIBezierPath *path = [UIBezierPath bezierPath];
    // Set the starting point of the shape.
    [path moveToPoint:CGPointMake(45.0, 0.0)];
    // Draw the lines.
    [path addLineToPoint:CGPointMake(90.0, 20.0)]; [path addLineToPoint:CGPointMake(80, 70)]; [path addLineToPoint:CGPointMake(20.0, 70)]; [path addLineToPoint:CGPointMake(0.0, 20.0)]; [path closePath];
    [UIColor colorWithRed:0.1 green:1 blue:1 alpha:1];
    [path fill];
}

- (void)drawRect:(CGRect)rect{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    NSArray *array = @[@"Circle", @"Rectangle", @"Pentagon", @"Triangle"];
    
    r= arc4random_uniform(4);
    
    while (r == currentR) {
        r= arc4random_uniform(4);
    }
    
    currentR = r;
    
    if (currentR == 0) {
        [self drawCircle:ctx];
    }else if(currentR == 1){
        [self drawRectangle:ctx];
    }else if(currentR == 2){
        [self drawPentagon:ctx];
    }else{
        [self drawTriangle:ctx];
    }
    
    
}

@end
