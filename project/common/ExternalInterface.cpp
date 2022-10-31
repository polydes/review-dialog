#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "ReviewDialog.h"
#include <stdio.h>

using namespace reviewdialog;

#ifdef IPHONE

static value reviewdialog_request_review(){
	requestReview();
	return alloc_null();
}
DEFINE_PRIM(reviewdialog_request_review,0);

#endif

extern "C" void reviewdialog_main () {
	val_int(0); // Fix Neko init
	
}
DEFINE_ENTRY_POINT (reviewdialog_main);

extern "C" int reviewdialog_register_prims () { return 0; }
