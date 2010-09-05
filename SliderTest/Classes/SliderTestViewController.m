//
//  SliderTestViewController.m
//  SliderTest
//
//  Created by Scott Lawrence on 9/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SliderTestViewController.h"

@implementation SliderTestViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


#define kRangePadInset	(5)

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	rangeView = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, 0, 0 )]; // frame is set later.
	[rangeView setBackgroundColor:[UIColor yellowColor]];
	[rangeViewContainer addSubview:rangeView];
	
	[minSlider setValue:0.25];
	[maxSlider setValue:0.75];
	
	[self slidersMoved:nil];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark handler type stuff

- (void) updateRangeText
{
	rangeText.text = [NSString stringWithFormat:@"%0.2f - %0.2f", minSlider.value, maxSlider.value];
}

- (void) updateRangeDisplay
{	
	// start and ending X positions in the container.
	float ew = rangeViewContainer.frame.size.width - 2*kRangePadInset; // effective width
	float sx = minSlider.value * ew; // start x
	float ex = maxSlider.value * ew; // end x
	
	// make sure it's always visible
	if( ex-sx == 0.0 ) {
		if( maxSlider.value == 1.0 )
			sx -= 1.0; // don't expand outside our pad
		else 
			ex += 1.0; // expand to the right
	}
	
	// and set the frame.
	rangeView.frame = CGRectMake( kRangePadInset+sx,
								  kRangePadInset, 
								  ex-sx, 
								  rangeViewContainer.frame.size.height - 2*kRangePadInset );
}

- (IBAction) slidersMoved:(id)sender
{
	float mins = minSlider.value;
	float maxs = maxSlider.value;
	
	if( mins > maxs ) maxSlider.value = mins;
	if( maxs < mins ) minSlider.value = maxs;
	
	[self updateRangeText];
	[self updateRangeDisplay];
}

@end
