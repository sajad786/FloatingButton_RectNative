//
//  PopupModule.m
//  FloatingViewProject
//
//  Created by Dr.mac on 30/01/25.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(PopupModule, NSObject)

// Method to show the popup and accept data
RCT_EXTERN_METHOD(showPopup: (NSDictionary *)data)

// Method to hide the popup
RCT_EXTERN_METHOD(hidePopup)

@end
