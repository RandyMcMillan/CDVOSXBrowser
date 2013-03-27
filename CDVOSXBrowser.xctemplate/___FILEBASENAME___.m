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

#define SYSTEM_VERSION_PLIST @"/System/Library/CoreServices/SystemVersion.plist"

#import <Cordova/CDVAvailability.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVDebug.h>

#import "___FILEBASENAME___.h"
#import "___FILEBASENAME____JS.h"


@implementation ___FILEBASENAME___
@synthesize mvc___FILEBASENAME___;
@synthesize ___FILEBASENAME___vc;

//  CDVInvokedUrlCommand* command = [[CDVInvokedUrlCommand alloc] initWithArguments:arguments callbackId:callbackId className:service methodName:action];

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

    self.mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
    CDVPluginResult		*result;

	NSString *jsString = k___FILEBASENAME___INIT;
	[self.mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Success!"];
    //    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];


}

- (void)nativeFunction:(CDVInvokedUrlCommand *)command
{
	NSLog(@"nativeFunction called from %@!", [self class]);

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

	self.mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
	// CDVPluginResult		*result;

	NSString *jsString = k___FILEBASENAME___FUNCTION;
	[self.mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"messageAsString"];
	[self.commandDelegate sendPluginResult:result callbackId:[command.arguments objectAtIndex:0]];
}

- (void)showWebPage:(CDVInvokedUrlCommand *)command
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

	NSDictionary *deviceProperties = [self deviceProperties];

self.mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
self.___FILEBASENAME___vc = [[CDVViewController alloc]init];
    //[___FILEBASENAME___vc.contentView setFrame:mvc___FILEBASENAME___.contentView.frame];

    
    
    //[self.mvc___FILEBASENAME___.contentView addSubview:___FILEBASENAME___vc.contentView];
    //self.___FILEBASENAME___vc.contentView.alphaValue = 1.0;
    self.___FILEBASENAME___vc.startPage = @"http://www.google.com";

    
    
    //        [self.mvc___FILEBASENAME___.webView setMainFrameURL:self.___FILEBASENAME___vc.startPage];

    //[self.mvc___FILEBASENAME___.contentView addABox:self.mvc___FILEBASENAME___.contentView];

    
    //self.___FILEBASENAME___vc.webView.alphaValue = 1.0;

    //self.mvc___FILEBASENAME___.contentView.alphaValue = 0.5;
    
	//NSString *jsString = k___FILEBASENAME___FUNCTION;
	//[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
    //CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[deviceProperties objectForKey:@"model"]];
	//[self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

    
    [self addABox:self];
    
    
}



/* Create a new view to be added/animated. Any kind of view can be added here, we go for simple colored box using the Leopard "custom" box type.
 */
- (NSView *)viewToBeAdded {
    
    
    //NSView *superview = [window contentView];
    NSRect frame = NSMakeRect(self.mvc___FILEBASENAME___.contentView.frame.size.width/2-50, 10, 100, 50);
    NSButton *button = [[NSButton alloc] initWithFrame:frame];
    [button setAutoresizingMask: NSViewMinXMargin | NSViewMaxXMargin];
    [button setTitle:@"Done"];
    
    
    [button setTarget:self];
    [button setAction:@selector(done:)];
    
    //[superview addSubview:button];
    //[button release];
    
    
    NSBox *box = [[NSBox alloc] initWithFrame:NSMakeRect(0.0, 0.0, 300, 300)];
    [box setBoxType:NSBoxCustom];
    [box setBorderType:NSLineBorder];
    [box setTitlePosition:NSNoTitle];
    [box setFillColor:[NSColor blackColor]];
    //return box;
    return button;
}

/* Action methods to add/remove boxes, giving us something to animate.  Note that we cause a relayout here; a better design is to relayout in the view automatically on addition/removal of subviews.
 */
- (void)addABox:(id)sender {
    [self.mvc___FILEBASENAME___.contentView addSubview:[self viewToBeAdded]];
    //[self layout];
}

- (IBAction)done:(id)sender
{


    NSLog(@"done");
    

}

- (IBAction)bringContentToFront:(id)sender {
    NSWindow *windowRef = (NSWindow *)[NSApplication sharedApplication];
	[windowRef makeKeyAndOrderFront:sender];
}

- (NSDictionary *)deviceProperties
{
	NSMutableDictionary *devProps = [NSMutableDictionary dictionaryWithCapacity:4];

	[devProps setObject:[self modelVersion] forKey:@"model"];
	[devProps setObject:[self platform] forKey:@"platform"];
	[devProps setObject:[self systemVersion] forKey:@"version"];
	[devProps setObject:[self uniqueAppInstanceIdentifier] forKey:@"uuid"];
	[devProps setObject:[self model] forKey:@"name"];
	[devProps setObject:[[self class] cordovaVersion] forKey:@"cordova"];

	NSDictionary *devReturn = [NSDictionary dictionaryWithDictionary:devProps];
	return devReturn;
}

- (NSString *)modelVersion
{
	size_t size;

	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	NSString *modelVersion = [NSString stringWithUTF8String:machine];
	free(machine);

	return modelVersion;
}

- (NSString *)model
{
	size_t size;

	sysctlbyname("hw.model", NULL, &size, NULL, 0);
	char *model = malloc(size);
	sysctlbyname("hw.model", model, &size, NULL, 0);
	NSString *name = [NSString stringWithUTF8String:model];
	free(model);

	return name;
}

- (NSString *)uniqueAppInstanceIdentifier
{
	NSUserDefaults	*userDefaults	= [NSUserDefaults standardUserDefaults];
	static NSString *UUID_KEY		= @"CDVUUID";

	NSString *app_uuid = [userDefaults stringForKey:UUID_KEY];

	if (app_uuid == nil) {
		CFUUIDRef	uuidRef		= CFUUIDCreate(kCFAllocatorDefault);
		CFStringRef uuidString	= CFUUIDCreateString(kCFAllocatorDefault, uuidRef);

		app_uuid = [NSString stringWithString:(__bridge NSString *)uuidString];
		[userDefaults setObject:app_uuid forKey:UUID_KEY];
		[userDefaults synchronize];

		CFRelease(uuidString);
		CFRelease(uuidRef);
	}

	return app_uuid;
}

- (NSString *)platform
{
	return [[NSDictionary dictionaryWithContentsOfFile:SYSTEM_VERSION_PLIST] objectForKey:@"ProductName"];
}

- (NSString *)systemVersion
{
	return [[NSDictionary dictionaryWithContentsOfFile:SYSTEM_VERSION_PLIST] objectForKey:@"ProductVersion"];
}

+ (NSString *)cordovaVersion
{
	return CDV_VERSION;
}

- (void)handleOpenURL:(NSNotification *)notification
{
	NSLog(@"%@ handleOpenURL!", [self class]);
}

- (void)onAppTerminate
{
	NSLog(@"%@ onAppTerminate!", [self class]);
}

- (void)onMemoryWarning
{
	NSLog(@"%@ onMemoryWarning!", [self class]);
}

- (void)onReset
{
	NSLog(@"%@ onReset!", [self class]);
}

- (void)dispose
{
	NSLog(@"%@ dispose!", [self class]);
}

@end
