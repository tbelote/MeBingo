//
//  GSSSO.h
//  GSSDK
//
//  Created by Dor on 11/11/12.
//
//

#import <Foundation/Foundation.h>


#import "GSObject.h"
#import	"Facebook.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 50000
    #import <Twitter/TWRequest.h>
    #import <Twitter/TWTweetComposeViewController.h>
    #import <Accounts/Accounts.h>
#endif

#define DEFAULT_FACEBOOK_READ_PERMISSIONS @"email"

@class GSAPI_Internal;

@interface GSSSO : NSObject {
    @private
    @public
    FBSession* m_pFbSession;
    ACAccountStore* m_pAccountStore;
    
    BOOL facebookLoginIsActive;
    BOOL twitterLoginIsActive;
    GSAPI_Internal	*m_pGSAPI;
}

@property (nonatomic, retain) FBSession* m_pFbSession;
@property (nonatomic, retain) ACAccountStore* m_pAccountStore;
@property (nonatomic)	BOOL m_bFacebookLoginIsActive;
@property (nonatomic)	BOOL m_bTwitterLoginIsActive;

@property (nonatomic, retain) GSAPI_Internal	*m_pGSAPI;

-(void) initFBSessionWithAppID:(NSString*)appID localAppID:(NSString*)localAppID readPermissions:(NSString*)readPermissions;

-(BOOL) requestFacebookRead:(GSObject*)requestParams callback:(void (^)(BOOL granted, BOOL canceled, GSObject* oParams))callback;
-(BOOL) requestFacebookPublish:(GSObject*)requestParams methodName:(NSString*)methodName callback:(void (^)(BOOL granted, BOOL canceled, GSObject* oParams))callback;

-(BOOL) requestTwitterRead:(GSObject*)requestParams callback:(void (^)(BOOL granted, BOOL canceled, GSObject* oParams))callback;
-(id) initWithGSAPI:(GSAPI_Internal*) gsapi;

- (void) onApplicationBecomeActive:(NSNotification *)pNotification;

@end
