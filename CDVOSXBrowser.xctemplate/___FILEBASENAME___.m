//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//

#import "___FILEBASENAME___.h"
#import <Cordova/CDVViewController.h>
#import <AVFoundation/AVFoundation.h>

@implementation ___FILEBASENAME___

@synthesize ___FILEBASENAME___;

- (void)showWebPage:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options	// args: url
{
	/* setting audio session category to "Playback" (since iOS 6) */
	AVAudioSession	*audioSession		= [AVAudioSession sharedInstance];
	NSError			*setCategoryError	= nil;
	BOOL			ok = [audioSession setCategory:AVAudioSessionCategoryPlayback error:&setCategoryError];

	if (!ok) {
		NSLog(@"Error setting AVAudioSessionCategoryPlayback: %@", setCategoryError);
	}

	if (self.___FILEBASENAME___ == nil) {
#if __has_feature(objc_arc)
			self.___FILEBASENAME___ = [[___FILEBASENAME___ViewController alloc] initWithScale:NO];
#else
			self.___FILEBASENAME___ = [[[___FILEBASENAME___ViewController alloc] initWithScale:NO] autorelease];
#endif
		self.___FILEBASENAME___.delegate			= self;
		self.___FILEBASENAME___.orientationDelegate = self.viewController;
	}

	/* // TODO: Work in progress
	 *   NSString* strOrientations = [ options objectForKey:@"supportedOrientations"];
	 *   NSArray* supportedOrientations = [strOrientations componentsSeparatedByString:@","];
	 */

	[self.viewController presentModalViewController:___FILEBASENAME___ animated:YES];

	NSString *url = (NSString *)[arguments objectAtIndex:0];

	[self.___FILEBASENAME___ loadURL:url];
}

- (void)getPage:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString *url = (NSString *)[arguments objectAtIndex:0];

	[self.___FILEBASENAME___ loadURL:url];
}

- (void)close:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options	// args: url
{
	[self.___FILEBASENAME___ closeBrowser];
}

- (void)onClose
{
	[self.webView stringByEvaluatingJavaScriptFromString:@"window.plugins.___FILEBASENAME___.onClose();"];
}

- (void)onOpenInSafari
{
	[self.webView stringByEvaluatingJavaScriptFromString:@"window.plugins.___FILEBASENAME___.onOpenExternal();"];
}

- (void)onChildLocationChange:(NSString *)newLoc
{
	NSString	*tempLoc	= [NSString stringWithFormat:@"%@", newLoc];
	NSString	*encUrl		= [tempLoc stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	NSString *jsCallback = [NSString stringWithFormat:@"window.plugins.___FILEBASENAME___.onLocationChange('%@');", encUrl];

	[self.webView stringByEvaluatingJavaScriptFromString:jsCallback];
}

#if !__has_feature(objc_arc)
	- (void)dealloc
	{
		self.___FILEBASENAME___ = nil;

		[super dealloc];
	}

#endif

@end
