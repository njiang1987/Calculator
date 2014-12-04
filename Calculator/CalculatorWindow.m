//
//  CalculatorWindow.m
//  Calculator
//
//  Created by jn11585852 on 12/3/14.
//  Copyright (c) 2014 JiangNan. All rights reserved.
//

#import "CalculatorWindow.h"

const static CGFloat kPercent191 = 0.191;
const static CGFloat kPercent238 = 0.238;
const static CGFloat kPercent500 = 0.500;
const static CGFloat kPercent682 = 0.682;

@interface CalculatorWindow ()

@property (weak) IBOutlet NSTextField *minTextField;
@property (weak) IBOutlet NSTextField *maxTextField;

@property (weak) IBOutlet NSTextField *rangeTextField;


@property (weak) IBOutlet NSTextField *higher191;
@property (weak) IBOutlet NSTextField *higher238;
@property (weak) IBOutlet NSTextField *higher500;
@property (weak) IBOutlet NSTextField *higher682;

@property (weak) IBOutlet NSTextField *highToLow191;
@property (weak) IBOutlet NSTextField *highToLow238;
@property (weak) IBOutlet NSTextField *highToLow500;
@property (weak) IBOutlet NSTextField *highToLow682;

@property (weak) IBOutlet NSTextField *lowToHigh191;
@property (weak) IBOutlet NSTextField *lowToHigh238;
@property (weak) IBOutlet NSTextField *lowToHigh500;
@property (weak) IBOutlet NSTextField *lowToHigh682;

@property (weak) IBOutlet NSTextField *lower191;
@property (weak) IBOutlet NSTextField *lower238;
@property (weak) IBOutlet NSTextField *lower500;
@property (weak) IBOutlet NSTextField *lower682;

@end

@implementation CalculatorWindow

- (IBAction)runButtonDidClicked:(id)sender
{
    [self run];
}

- (IBAction)clearButtonDidClicked:(id)sender
{
    [self clear];
}

- (void)run
{
    CGFloat lMin = [[self.minTextField stringValue] floatValue];
    CGFloat lMax = [[self.maxTextField stringValue] floatValue];
    
    [self setHigherGroupValueMin:lMin max:lMax];
    [self setHighToLowGroupValueMin:lMin max:lMax];
    [self setLowToHighGroupValueMin:lMin max:lMax];
    [self setLowerGroupValueMin:lMin max:lMax];
    [self.rangeTextField setStringValue:[NSString stringWithFormat:@"%.f", lMax - lMin]];
}

- (void)clear
{
    [self.minTextField setStringValue:@"0"];
    [self.maxTextField setStringValue:@"0"];
    [self.rangeTextField setStringValue:@"0"];
    
    [self setHigherGroupValueMin:0 max:0];
    [self setHighToLowGroupValueMin:0 max:0];
    [self setLowToHighGroupValueMin:0 max:0];
    [self setLowerGroupValueMin:0 max:0];
}

- (void)setHigherGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    
    CGFloat range = lMax - lMin;
    [self.higher191 setStringValue:[NSString stringWithFormat:@"%.2f", lMax + range * kPercent191]];
    [self.higher238 setStringValue:[NSString stringWithFormat:@"%.2f", lMax + range * kPercent238]];
    [self.higher500 setStringValue:[NSString stringWithFormat:@"%.2f", lMax + range * kPercent500]];
    [self.higher682 setStringValue:[NSString stringWithFormat:@"%.2f", lMax + range * kPercent682]];
}

- (void)setHighToLowGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    
    CGFloat range = lMax - lMin;
    [self.highToLow191 setStringValue:[NSString stringWithFormat:@"%.2f", lMax - range * kPercent191]];
    [self.highToLow238 setStringValue:[NSString stringWithFormat:@"%.2f", lMax - range * kPercent238]];
    [self.highToLow500 setStringValue:[NSString stringWithFormat:@"%.2f", lMax - range * kPercent500]];
    [self.highToLow682 setStringValue:[NSString stringWithFormat:@"%.2f", lMax - range * kPercent682]];
}

- (void)setLowToHighGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    
    CGFloat range = lMax - lMin;
    [self.lowToHigh191 setStringValue:[NSString stringWithFormat:@"%.2f", lMin + range * kPercent191]];
    [self.lowToHigh238 setStringValue:[NSString stringWithFormat:@"%.2f", lMin + range * kPercent238]];
    [self.lowToHigh500 setStringValue:[NSString stringWithFormat:@"%.2f", lMin + range * kPercent500]];
    [self.lowToHigh682 setStringValue:[NSString stringWithFormat:@"%.2f", lMin + range * kPercent682]];
}

- (void)setLowerGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    
    CGFloat range = lMax - lMin;
    [self.lower191 setStringValue:[NSString stringWithFormat:@"%.2f", lMin - range * kPercent191]];
    [self.lower238 setStringValue:[NSString stringWithFormat:@"%.2f", lMin - range * kPercent238]];
    [self.lower500 setStringValue:[NSString stringWithFormat:@"%.2f", lMin - range * kPercent500]];
    [self.lower682 setStringValue:[NSString stringWithFormat:@"%.2f", lMin - range * kPercent682]];
}

@end
