/*
 *   Licensed to the Apache Software Foundation (ASF) under one
 *   or more contributor license agreements.  See the NOTICE file
 *   distributed with this work for additional information
 *   regarding copyright ownership.  The ASF licenses this file
 *   to you under the Apache License, Version 2.0 (the
 *   "License"); you may not use this file except in compliance
 *   with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing,
 *   software distributed under the License is distributed on an
 *   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *   KIND, either express or implied.  See the License for the
 *   specific language governing permissions and limitations
 *   under the License.
 *
 *      ___FILEBASENAME___
 *      ___FILEBASENAME___ Template Created ___DATE___.
 *      Copyright 2013 @RandyMcMillan
 *
 *     Created by ___FULLUSERNAME___ on ___DATE___.
 *     Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
 */

#import "___FILEBASENAME___.h"
#import <Cordova/CDVViewController.h>
#import <AVFoundation/AVFoundation.h>

@implementation ___FILEBASENAME___

@synthesize ___FILEBASENAME___;

- (void)init:(CDVInvokedUrlCommand *)command
{
	NSLog(@"init called from %@!", [self class]);
    
	for (int i = 0; i < [command.arguments count]; i++) {
		NSLog(@"[command.arguments objectAtIndex:%i] = %@", i, [command.arguments objectAtIndex:i]);
	}
    
	NSLog(@"command.callBackId = %@", command.callbackId);
	NSLog(@"[command class] =  %@", [command class]);
	NSLog(@"[command methodName] = %@", [command methodName]);
    
	if (self.hasPendingOperation) {
		NSLog(@"%@.hasPendingOperation = YES", [self class]);
	} else {
		NSLog(@"%@.hasPendingOperation = NO", [self class]);
	}
    
	NSHost *host = [NSHost currentHost];
	NSLog(@"[host localizedName] =  %@", [host localizedName]);
    
	CDVViewController *mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
    NSString *const k___FILEBASENAME___INIT		= @"(function() {console.log('k___FILEBASENAME___INIT evalutated from native string!');})();";
 
	self.savedURL = mvc___FILEBASENAME___.webView.mainFrameURL;
	NSLog(@"mainFrameURL =\n  %@", mvc___FILEBASENAME___.webView.mainFrameURL);
	NSLog(@"saved.URL =\n  %@", self.savedURL);
    
	CDVPluginResult *result;
    
	NSString *jsString = k___FILEBASENAME___INIT;
	[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success!"];
	//    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
	[self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)showWebPage:(CDVInvokedUrlCommand *)command
//- (void)showWebPage:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options	// args: url
{
    
    NSLog(@"getDeviceInfo called from %@!", [self class]);
	for (int i = 0; i < [command.arguments count]; i++) {
		NSLog(@"[command.arguments objectAtIndex:%i] = %@", i, [command.arguments objectAtIndex:i]);
	}
	NSLog(@"command.callBackId = %@", command.callbackId);
	NSLog(@"[command class] =  %@", [command class]);
	NSLog(@"[command methodName] = %@", [command methodName]);
    
	NSHost *host = [NSHost currentHost];
	NSLog(@"hostName %@", [host localizedName]);

	/* setting audio session category to "Playback" (since iOS 6) */
	//AVAudioSession	*audioSession		= [AVAudioSession sharedInstance];
    //	NSError			*setCategoryError	= nil;
	//BOOL			ok = [audioSession setCategory:AVAudioSessionCategoryPlayback error:&setCategoryError];

	//if (!ok) {
	//	NSLog(@"Error setting AVAudioSessionCategoryPlayback: %@", setCategoryError);
	//}

	if (self.___FILEBASENAME___ == nil) {
#if __has_feature(objc_arc)
        //self.___FILEBASENAME___ = [[___FILEBASENAME___ViewController alloc] initWithScale:NO];
        self.___FILEBASENAME___ = [[___FILEBASENAME___ViewController alloc] initWithWindowNibName:@"___FILEBASENAME___ViewController"];

#else
        //self.___FILEBASENAME___ = [[[___FILEBASENAME___ViewController alloc] initWithScale:NO] autorelease];
		self.___FILEBASENAME___ = [[___FILEBASENAME___ViewController alloc] initWithWindowNibName:@"___FILEBASENAME___ViewController"];

#endif
		self.___FILEBASENAME___.delegate			= self;
		self.___FILEBASENAME___.orientationDelegate = self.viewController;
	}

    
    
    [self.___FILEBASENAME___.contentView setAutoresizingMask:NSViewMinXMargin | NSViewMaxXMargin | NSViewWidthSizable | NSViewHeightSizable];
	[self.___FILEBASENAME___.webView setAutoresizingMask:NSViewMinXMargin | NSViewMaxXMargin | NSViewWidthSizable | NSViewHeightSizable];
    
	[self.___FILEBASENAME___.window makeKeyAndOrderFront:nil];
	[self.___FILEBASENAME___.webView setMainFrameURL:[command.arguments objectAtIndex:0]];
	//[self.___FILEBASENAME___.textField setTextColor:[NSColor redColor]];
	//self.___FILEBASENAME___.textField.stringValue = [command.arguments objectAtIndex:0];
    
	//[self displayLeftButton:self];
	//[self displayDoneButton:self];
	//[self displayRightButton:self];

    
    
	/* // TODO: Work in progress
	 *   NSString* strOrientations = [ options objectForKey:@"supportedOrientations"];
	 *   NSArray* supportedOrientations = [strOrientations componentsSeparatedByString:@","];
	 */

	//[self.viewController presentModalViewController:___FILEBASENAME___ animated:YES];

	NSString *url = (NSString *)[command.arguments objectAtIndex:0];

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
    
    NSLog(@"onChildLocationChange");
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
