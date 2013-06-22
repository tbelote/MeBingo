//
//  GSProviderSession.h
//  GigyaSDK
//
//  Created by Dor-mac on 4/11/13.
//  Copyright (c) 2013 Gigya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSObject.h"

@interface GSProviderSession : NSObject {
	NSString	*token;
	int		expiration;
}
@property (nonatomic, retain) NSString	*token;
@property (nonatomic) int	expiration;

+(id)sessionWithJsonString:(NSString *)json;
+(id)sessionWithProviderToken:(NSString*)token expiration:(int)expiration;

-(NSString*)stringValue;
@end
