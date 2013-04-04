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
#include <sys/types.h>
#include <sys/sysctl.h>
#import "___FILEBASENAME___ViewController.h"

@implementation ___FILEBASENAME___ViewController

@synthesize imageURL, isImage;
@synthesize delegate, orientationDelegate;
//@synthesize spinner, webView, addressLabel;
@synthesize closeBtn, refreshBtn, backBtn, fwdBtn, safariBtn;
@synthesize webView;

/*
 *   // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 *   - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 *    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 *        // Custom initialization
 *    }
 *    return self;
 *   }
 */


+ (NSString *)resolveImageResource:(NSString *)resource
{
    
    size_t size;
    
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *modelVersion = [NSString stringWithUTF8String:machine];
	free(machine);

	NSString	*systemVersion	= modelVersion;
    
	BOOL		isLessThaniOS4	= ([systemVersion compare:@"4.0" options:NSNumericSearch] == NSOrderedAscending);

    
    
    /*
     
     
     float displayScale = 1;
     if ([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)]) {
     NSArray *screens = [NSScreen screens];
     for (int i = 0; i < [screens count]; i++) {
     float s = [[screens objectAtIndex:i] backingScaleFactor];
     if (s > displayScale)
     displayScale = s;
     }
     }
     
     */
    
	if (isLessThaniOS4) {
		return [NSString stringWithFormat:@"%@.png", resource];
	} else {
		if (([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)] == YES) && ([[NSScreen mainScreen] backingScaleFactor] == 2.00)) {
			return [NSString stringWithFormat:@"%@@2x.png", resource];
		}
	}

	return resource;// if all else fails
}


- (___FILEBASENAME___ViewController *)initWithScale:(BOOL)enabled
{
	self = [super init];
	self.scaleEnabled = enabled;
	return self;
}

- (void)windowWillLoad
{

    NSLog(@"____windowWillLoad____");

}

- (NSString *)windowTitleForDocumentDisplayName:(NSString *)displayName
{

    NSString *aDisplayName = @"display NAME";
    displayName = aDisplayName;
    return displayName;
    
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)windowDidLoad
{
    
    //[self.window setTitle:[self windowTitleForDocumentDisplayName:nil]];
    [self.window setTitle:@""];
    [self.window setBackgroundColor:[NSColor colorWithCalibratedWhite:0.423 alpha:1.000]];
	[super windowDidLoad];

	[self.refreshBtn setImage:[NSImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/but_refresh"]]];
	[self.backBtn setImage:[NSImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/arrow_left"]]];
	[self.fwdBtn setImage:[NSImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/arrow_right"]]];
	[self.safariBtn setImage:[NSImage imageNamed:[[self class] resolveImageResource:@"___FILEBASENAME___.bundle/compass"]]];

	//self.webView.delegate			= self;
	//self.webView.scalesPageToFit	= TRUE;
	//self.webView.backgroundColor	= [UIColor whiteColor];
	NSLog(@"_______Window did load_______");
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	//[super didReceiveMemoryWarning];

	// Release any cached data, images, etc that aren't in use.
}

- (void)WindowDidUnload
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	NSLog(@"View did UN-load");
}

- (void)dealloc
{
	//self.webView.delegate		= nil;
	self.delegate				= nil;
	self.orientationDelegate	= nil;

#if !__has_feature(objc_arc)
		self.webView		= nil;
		self.closeBtn		= nil;
		self.refreshBtn		= nil;
		self.addressLabel	= nil;
		self.backBtn		= nil;
		self.fwdBtn			= nil;
		self.safariBtn		= nil;
		self.spinner		= nil;

		[super dealloc];
#endif
}

- (void)closeBrowser
{
    
    NSLog(@"closeBrowser");
	if (self.delegate != nil) {
		[self.delegate onClose];
	}

	if ([self respondsToSelector:@selector(presentingViewController)]) {
		// Reference UIViewController.h Line:179 for update to iOS 5 difference - @RandyMcMillan
		//[[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
	} else {
		//[[self parentViewController] dismissModalViewControllerAnimated:YES];
	}
   
    [self.webView.mainFrame loadHTMLString:nil baseURL:[NSURL URLWithString:@""]];

    self.contentView.window.isVisible = FALSE;
    

}

- (IBAction)onDoneButtonPress:(id)sender
{
	[self closeBrowser];
	//NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]];
	//[self.webView loadRequest:request];
}

- (IBAction)onSafariButtonPress:(id)sender
{
	if (self.delegate != nil) {
		[self.delegate onOpenInSafari];
	}

	if (self.isImage) {
		NSURL *pURL = [NSURL URLWithString:self.imageURL];
        //	[[NSApplication sharedApplication] openURL:pURL];
	} else {
		//NSURLRequest *request = self.webView.request;
		//[[NSApplication sharedApplication] openURL:request.URL];
	}
}

- (void)loadURL:(NSString *)url
{
	NSLog(@"Opening Url : %@", url);
    if ([url hasPrefix:@"http://"]) {
        if ([url hasSuffix:@".png"] ||
            [url hasSuffix:@".jpg"] ||
            [url hasSuffix:@".jpeg"] ||
            [url hasSuffix:@".bmp"] ||
            [url hasSuffix:@".gif"]) {
            self.imageURL	= nil;
            self.imageURL	= url;
            self.isImage	= YES;
            NSString *htmlText = @"<html><body style='background-color:#333;margin:0px;padding:0px;'><img style='min-height:200px;margin:0px;padding:0px;width:100%;height:auto;' alt='' src='IMGSRC'/></body></html>";
            htmlText = [htmlText stringByReplacingOccurrencesOfString:@"IMGSRC" withString:url];

            [self.webView.mainFrame loadHTMLString:htmlText baseURL:[NSURL URLWithString:@""]];
        
        } else {
        
            self.imageURL	= @"";
            self.isImage	= NO;

            NSLog(@"url sent from html = %@ ", url);
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
             [self.webView.mainFrame loadRequest:request];
        }
        
    } else {
    
        NSLog(@"Local url sent from html = %@ ", url);
        NSURLRequest *request = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:url ofType:nil inDirectory:@"www"]];
        NSLog(@"Local request sent from html = %@ ", request);
          [self.webView.mainFrame loadRequest:[NSURLRequest requestWithURL:request]];
        
    }

	self.webView.hidden = NO;

}

- (void)webViewDidStartLoad:(WebView *)sender
{
    	self.addressLabel.stringValue	= @"Loading...";
	self.backBtn.enabled	= self.webView.canGoBack;
	self.fwdBtn.enabled		= self.webView.canGoForward;

    //	[self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(WebView *)sender
{

    NSLog(@"New Address is : %@", self.webView.mainFrameURL);
    self.addressLabel.stringValue = self.webView.mainFrameURL;//[command.arguments objectAtIndex:0];

	self.backBtn.enabled	= self.webView.canGoBack;
	self.fwdBtn.enabled		= self.webView.canGoForward;
	//[self.spinner stopAnimating];

	if (self.delegate != NULL) {
        	[self.delegate onChildLocationChange:self.webView.mainFrameURL];
	}
}

/*- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error {
 *    NSLog (@"webView:didFailLoadWithError");
 *    [spinner stopAnimating];
 *    addressLabel.text = @"Failed";
 *    if (error != NULL) {
 *        UIAlertView *errorAlert = [[UIAlertView alloc]
 *                                   initWithTitle: [error localizedDescription]
 *                                   message: [error localizedFailureReason]
 *                                   delegate:nil
 *                                   cancelButtonTitle:@"OK"
 *                                   otherButtonTitles:nil];
 *        [errorAlert show];
 *        [errorAlert release];
 *    }
 *   }
 */

#pragma mark CDVOrientationDelegate

- (BOOL)shouldAutorotate
{
	if ((self.orientationDelegate != nil) && [self.orientationDelegate respondsToSelector:@selector(shouldAutorotate)]) {
		return [self.orientationDelegate shouldAutorotate];
	}

	return YES;
}
/*
- (NSUInteger)supportedInterfaceOrientations
{
	if ((self.orientationDelegate != nil) && [self.orientationDelegate respondsToSelector:@selector(supportedInterfaceOrientations)]) {
		return [self.orientationDelegate supportedInterfaceOrientations];
	}

	return //UIInterfaceOrientationMaskPortrait;
}
*/

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ((self.orientationDelegate != nil) && [self.orientationDelegate respondsToSelector:@selector(shouldAutorotateToInterfaceOrientation:)]) {
		return [self.orientationDelegate shouldAutorotateToInterfaceOrientation:interfaceOrientation];
	}

	return YES;
}
*/

@end
