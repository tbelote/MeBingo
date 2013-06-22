//
//  ProviderSelectorViewController.h
//	Version: GIGYAVERSION


#import <UIKit/UIKit.h>
#import "GSAPI_Internal.h"
#import "FBSession.h"
@interface GSWebViewController : UIViewController <UIWebViewDelegate,UINavigationControllerDelegate>{
//@interface GSWebViewController : UIViewController <UIWebViewDelegate,GSWebViewControllerDelegate>{
	id <GSWebViewControllerDelegate> delegate;
	UIWebView	*m_pWebView;
	GSEventType m_EventType;
	GSWebActionType	m_ActionType;
	GSAPI_Internal	*m_pGSAPI;
	GSObject	*m_pRequestParams;
    GSObject    *m_pServerParams;
	GSResponse	*m_pResponse;
	id	m_pSavedContext;
	NSString	*m_pNotificationMessage;
	BOOL	m_bFirstAppearance;
	GSLogger	*m_pTrace;
	UIActivityIndicatorView *m_pSpinner;
}
@property (nonatomic, retain) IBOutlet UIWebView	*m_pWebView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView	*m_pSpinner;
@property (nonatomic) GSEventType	m_EventType;
@property (nonatomic) GSWebActionType	m_ActionType;
@property (nonatomic, assign) id <GSWebViewControllerDelegate> delegate;
@property (nonatomic, retain) GSObject	*m_pRequestParams;
@property (nonatomic, retain) GSObject	*m_pServerParams;
@property (nonatomic, retain) GSAPI_Internal	*m_pGSAPI;
@property (nonatomic, retain) GSResponse	*m_pResponse;
@property (nonatomic, retain) id	m_pSavedContext;
@property (nonatomic, retain) NSString	*m_pNotificationMessage;
@property (nonatomic, retain) GSLogger	*m_pTrace;
@property (nonatomic)	BOOL	m_bFirstAppearance;

-(void) NavigateToProviderSelector;
-(void) NavigateToLogin;
-(void) NavigateToConnect;
-	(void) OnResult:(GSObject *)pResponse;
-	(NSString	*)GetProvider;
-	(NSString	*)GetProviderDisplayName;
-	(NSString	*)GetCID;
-	(NSString	*)getForceAuthentication;
-	(NSString	*)GetLang;
-	(NSString	*)GetExtraPermissions;

-(IBAction)	OnCancel:(id)Sender;
-(IBAction)	OnBack:(id)Sender;

@end

