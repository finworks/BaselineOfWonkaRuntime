*baselineofwonkaruntime
initialize
	"Monkey Patch! This was the 'cleanest' monkey patch. We never want this thing to cache stuff. We use our local repos. 
	The problem with this guy is that if you restore a GS db or if you copy a pharo image, MCCacheRepository uniqueInstance returns a package cache that was initialised in another context!!! So, we get unpredicable results."

	super initialize.
	self disablePackageCache