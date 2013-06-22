//
//  GSContext.h
//	Version: GIGYAVERSION


#import <Foundation/Foundation.h>

@protocol GSResponseDelegate;
@protocol GSLoginUIDelegate;
@protocol GSAddConnectionsUIDelegate;



@interface GSContext : NSObject {
	id<GSResponseDelegate>	responseDelegate;
	id<GSLoginUIDelegate>	loginUIDelegate;
	id<GSAddConnectionsUIDelegate>	addConnectionsUIDelegate;
	id	context;
}
@property (nonatomic, retain) 	id<GSResponseDelegate>	responseDelegate;
@property (nonatomic, retain) 	id<GSLoginUIDelegate>	loginUIDelegate;
@property (nonatomic, retain) 	id<GSAddConnectionsUIDelegate>	addConnectionsUIDelegate;
@property (nonatomic, retain) 	id	context;

+	(id) contextWithGSResponseDelegate:(id<GSResponseDelegate>)pDelegate context:(id)pContext;
+	(id) contextWithGSLoginUIDelegate:(id<GSLoginUIDelegate>)pDelegate context:(id)pContext;
+	(id) contextWithGSAddConnectionsUIDelegate:(id<GSAddConnectionsUIDelegate>)pDelegate context:(id)pContext;

@end
