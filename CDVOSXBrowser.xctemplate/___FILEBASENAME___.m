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

	CDVViewController	*mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
	CDVPluginResult		*result;

	NSString *jsString = k___FILEBASENAME___INIT;
	[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
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

	CDVViewController *mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
	// CDVPluginResult		*result;

	NSString *jsString = k___FILEBASENAME___FUNCTION;
	[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"messageAsString"];
	[self.commandDelegate sendPluginResult:result callbackId:[command.arguments objectAtIndex:0]];
}

- (void)getDeviceInfo:(CDVInvokedUrlCommand *)command
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

	CDVViewController *mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];

	NSString *jsString = k___FILEBASENAME___FUNCTION;
	[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	 CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:[deviceProperties objectForKey:@"model"]];
	[self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
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
