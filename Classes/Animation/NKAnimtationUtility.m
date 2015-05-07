//
//  NKAnimtationUtility.m
//  NoopedKit
//
//  Created by Kenneth Poon on 8/5/15.
//
//

#import "NKAnimtationUtility.h"

@implementation NKAnimtationUtility


-(void) animateFadeView: (UIView*) fadeView initialAlpha: (float) initialAlpha targetAlpha: (float) targetAlpha duration: (float) duration delegate: (id) delegate  selector: (SEL) selector{
    fadeView.alpha = initialAlpha;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: duration];
    fadeView.alpha = targetAlpha;
    if (delegate!=nil && selector!=nil){
        [UIView setAnimationDelegate:delegate];
        [UIView setAnimationDidStopSelector:selector];
    }
    [UIView commitAnimations];
}


-(void) animateFadeView: (UIView*) fadeView initialAlpha: (float) initialAlpha targetAlpha: (float) targetAlpha duration: (float) duration{
    [self animateFadeView:fadeView initialAlpha:initialAlpha targetAlpha:targetAlpha duration: duration delegate:nil selector:nil];
}

@end
