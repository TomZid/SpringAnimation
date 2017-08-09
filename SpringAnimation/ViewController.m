//
//  ViewController.m
//  SpringAnimation
//
//  Created by 朱海波 on 09/08/2017.
//  Copyright © 2017 Tom.zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UIImageView *_portrait;
}
@end

@implementation ViewController
- (IBAction)panCard:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender translationInView:sender.view.superview];
    CGAffineTransform moveTransform = CGAffineTransformMakeTranslation(point.x, point.y);
    CGAffineTransform rotateTransform = CGAffineTransformRotate(moveTransform, -sin(point.x / (_portrait.frame.size.width )));
    _portrait.transform = rotateTransform;
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:.25f
                              delay:.05f
             usingSpringWithDamping:.5f
              initialSpringVelocity:1
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             _portrait.transform = CGAffineTransformIdentity;
                         }
                         completion:nil];
    }
}

@end
