package com.polydes.reviewdialog;

#if cpp
import cpp.Lib;
#end

#if ios
@:buildXml('<include name="${haxelib:com.polydes.reviewdialog}/project/Build.xml"/>')
//This is just here to prevent the otherwise indirectly referenced native code from bring stripped at link time.
@:cppFileCode('extern "C" int reviewdialog_register_prims();void com_stencyl_reviewdialog_link(){reviewdialog_register_prims();}')
#end
class ReviewDialog
{
	private static var initialized:Bool = false;
	private static var __requestReview:Void->Void = function(){};

	private static function loadFunctions():Void
	{
		if(initialized) return;

		#if ios
		try
		{
			__requestReview = cpp.Lib.load("reviewdialog","reviewdialog_request_review",0);
			initialized = true;
		}
		catch(e:Dynamic)
		{
			trace("iOS function loading exception: " + e);
		}
		#end
	}

	public static function requestReview():Void
	{
		if(!initialized) loadFunctions();
		if(__requestReview != null) __requestReview();
	}
}