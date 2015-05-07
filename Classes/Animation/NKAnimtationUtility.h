//
//  NKAnimtationUtility.h
//  NoopedKit
//
//  Created by Kenneth Poon on 8/5/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NKAnimtationUtility : NSObject

-(void) animateFadeView: (UIView*) fadeView initialAlpha: (float) initialAlpha targetAlpha: (float) targetAlpha duration: (float) duration delegate: (id) delegate  selector: (SEL) selector;
-(void) animateFadeView: (UIView*) fadeView initialAlpha: (float) initialAlpha targetAlpha: (float) targetAlpha duration: (float) duration;
@end
