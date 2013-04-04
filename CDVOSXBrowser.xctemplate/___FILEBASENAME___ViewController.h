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

#import <Cocoa/Cocoa.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>

@protocol ___FILEBASENAME___Delegate <NSObject>

/*
 *  onChildLocationChanging:newLoc
 *
 *  Discussion:
 *    Invoked when a new page has loaded
 */
- (void)onChildLocationChange:(NSString *)newLoc;
- (void)onOpenInSafari;
- (void)onClose;

@end

@protocol CDVOrientationDelegate <NSObject>

- (NSUInteger)supportedInterfaceOrientations;
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (BOOL)shouldAutorotate;

@end

//@interface ___FILEBASENAME___ViewController : CDVViewController <UIWebViewDelegate>{}
@interface ___FILEBASENAME___ViewController : CDVViewController{}

@property (nonatomic, strong) IBOutlet WebView				*webView;
@property (nonatomic, strong) IBOutlet NSButton			*closeBtn;
@property (nonatomic, strong) IBOutlet NSButton			*refreshBtn;
@property (nonatomic, strong) IBOutlet NSTextField		*addressLabel;
@property (nonatomic, strong) IBOutlet NSButton			*backBtn;
@property (nonatomic, strong) IBOutlet NSButton			*fwdBtn;
@property (nonatomic, strong) IBOutlet NSButton			*safariBtn;
//@property (nonatomic, strong) IBOutlet UIActivityIndicatorView	*spinner;

// unsafe_unretained is equivalent to assign - used to prevent retain cycles in the two properties below
@property (nonatomic, unsafe_unretained) id <___FILEBASENAME___Delegate>	delegate;
@property (nonatomic, unsafe_unretained) id									orientationDelegate;

@property (copy) NSString	*imageURL;
@property (assign) BOOL		isImage;
@property (assign) BOOL		scaleEnabled;

- (___FILEBASENAME___ViewController *)initWithScale:(BOOL)enabled;
- (IBAction)onDoneButtonPress:(id)sender;
- (IBAction)onSafariButtonPress:(id)sender;
- (void)loadURL:(NSString *)url;
- (void)closeBrowser;

@end
