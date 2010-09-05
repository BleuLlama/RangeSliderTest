//
//  SliderTestAppDelegate.h
//  SliderTest
//
//  Created by Scott Lawrence on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SliderTestViewController;

@interface SliderTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SliderTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SliderTestViewController *viewController;

@end

