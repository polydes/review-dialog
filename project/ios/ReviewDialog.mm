#include <hx/CFFI.h>
#include <ReviewDialog.h>

#import <StoreKit/StoreKit.h>

namespace reviewdialog {
    
	void requestReview(){
        
        [SKStoreReviewController requestReview];

    }
    
}
