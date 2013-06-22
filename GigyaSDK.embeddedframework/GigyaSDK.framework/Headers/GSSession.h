//
//  GSSession.h
//	Version: GIGYAVERSION


#import <Foundation/Foundation.h>
#import "GSObject.h"
#import "GSProviderSession.h"

@interface GSSession : NSObject {

	NSString	*secret;
	NSString	*accessToken;
	NSDate		*expirationTime;
	
}
@property (nonatomic, retain) NSString	*secret;
@property (nonatomic, retain) NSString	*accessToken;
@property (nonatomic, retain) NSDate	*expirationTime;
@property (nonatomic, retain) GSObject	*providersSessions;
-(BOOL) IsValid;
-(GSProviderSession*) getProviderSession:(NSString*)provider;
-(void) setProviderSession:(NSString*)provider token:(NSString*)token expiration:(int)expiration;
-(NSString*)getProvidersSessionsJson;
-(void)setProvidersSessionsFromJson:(NSString*)json;
@end



@interface GSSession (Private_Internal)
-(id) initWithLoginResponse:(GSObject *)pResponse;
-(id) initWithSessionToken:(NSString *)pToken sessionSecret:(NSString*)pSecret expirationTime:(NSDate*)pExpiration;
-(id) initWithSessionToken:(NSString *)pToken sessionSecret:(NSString*)pSecret;

@end
