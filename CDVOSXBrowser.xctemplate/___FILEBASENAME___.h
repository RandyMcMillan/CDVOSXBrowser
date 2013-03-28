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

#import <Foundation/Foundation.h>

#import <Cordova/CDVPlugin.h>
@class CDVViewController;

@interface ___FILEBASENAME___ : CDVPlugin {

    CDVViewController *___FILEBASENAME___vc;
    CDVViewController *mvc___FILEBASENAME___;
    NSButton *doneButton;
    NSString *savedURL;
}

@property (nonatomic, strong) IBOutlet CDVViewController* ___FILEBASENAME___vc;
@property (nonatomic, strong) IBOutlet CDVViewController* mvc___FILEBASENAME___;
@property (nonatomic, strong) IBOutlet NSButton* doneButton;
@property (nonatomic,readwrite) IBOutlet NSString* savedURL;

- (void)init:(CDVInvokedUrlCommand *)command;
- (void)nativeFunction:(CDVInvokedUrlCommand *)command;
- (void)showWebPage:(CDVInvokedUrlCommand *)command;
+ (NSString *)cordovaVersion;
- (IBAction)bringContentToFront:(id)sender;
- (void)displayDoneButton:(id)sender;
- (IBAction)done:(id)sender;
- (NSButton *)addDoneButton;

@end
