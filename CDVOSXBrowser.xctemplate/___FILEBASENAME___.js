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

(function() {

var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks

function ___FILEBASENAME___() {
    // Does nothing
}

// Callback when the location of the page changes
// called from native
___FILEBASENAME___._onLocationChange = function(newLoc)
{
    window.plugins.___FILEBASENAME___.onLocationChange(newLoc);
};

// Callback when the user chooses the 'Done' button
// called from native
___FILEBASENAME___._onClose = function()
{
    window.plugins.___FILEBASENAME___.onClose();
};

// Callback when the user chooses the 'open in Safari' button
// called from native
___FILEBASENAME___._onOpenExternal = function()
{
    window.plugins.___FILEBASENAME___.onOpenExternal();
};

// Pages loaded into the ___FILEBASENAME___ can execute callback scripts, so be careful to
// check location, and make sure it is a location you trust.
// Warning ... don't exec arbitrary code, it's risky and could fuck up your app.
// called from native
___FILEBASENAME___._onJSCallback = function(js,loc)
{
    // Not Implemented
    //window.plugins.___FILEBASENAME___.onJSCallback(js,loc);
};

/* The interface that you will use to access functionality */

// Show a webpage, will result in a callback to onLocationChange
___FILEBASENAME___.prototype.showWebPage = function(loc)
{
    cordovaRef.exec("___FILEBASENAME___.showWebPage", loc);
};

// close the browser, will NOT result in close callback
___FILEBASENAME___.prototype.close = function()
{
    cordovaRef.exec("___FILEBASENAME___.close");
};

// Not Implemented
___FILEBASENAME___.prototype.jsExec = function(jsString)
{
    // Not Implemented!!
    //PhoneGap.exec("___FILEBASENAME___.jsExec",jsString);
};

// Note: this plugin does NOT install itself, call this method some time after deviceready to install it
// it will be returned, and also available globally from window.plugins.childBrowser
___FILEBASENAME___.install = function()
{
    if(!window.plugins) {
        window.plugins = {};
    }
        if ( ! window.plugins.___FILEBASENAME___ ) {
        window.plugins.___FILEBASENAME___ = new ___FILEBASENAME___();
    }

};


if (cordovaRef && cordovaRef.addConstructor) {
    cordovaRef.addConstructor(___FILEBASENAME___.install);
} else {
    console.log("___FILEBASENAME___ Cordova Plugin could not be installed.");
    return null;
}


})();
