//
//  SliderTestViewController.h
//  SliderTest
//
//  Created by Scott Lawrence on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderTestViewController : UIViewController {
	IBOutlet UISlider * minSlider;
	IBOutlet UISlider * maxSlider;
	IBOutlet UIView * rangeViewContainer;
	IBOutlet UILabel * rangeText;
	
	UIView * rangeView;
}

- (void) updateRangeText;
- (void) updateRangeDisplay;
- (IBAction) slidersMoved:(id)sender;

@end

