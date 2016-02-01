# BXWeChatSDK

The official WeChat SDK for iOS apps to access WeChat platform. This is a mirror repository maintained by iOS developers from Baixing.


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.
Open `BXWeChatSDK.xcworkspace`. Replace the example target's URL schemes `YOUR_WECAHT_APP_ID` with your WeChat app ID.
Afterwards, set the same app ID in `BXAppDelegate.m`. Now, let's rock.


## Requirements

* iOS 7 and later
* Xcode 7.1 and later


## Installation

BXWeChatSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

``` ruby
pod "BXWeChatSDK"
```

Then follow the [instructions](https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=1417694084&token=&lang=zh_CN)
provided by Tencent.

### iOS 9+ Security Issues

Add the following lines to your project's info.plist file so that your app would be allowed to open WeChat.app.

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>wechat</string>
  <string>weixin</string>
</array>
```

Also, add WeChat domains to your app's whitelist.

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>qq.com</key>
        <dict>
            <key>NSIncludesSubdomains</key>
            <true/>
            <key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
            <true/>
            <key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
            <false/>
        </dict>
    </dict>
</dict>
```

Or if security is not an issue to your app, use the following lines.

```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```
