function display()
//Show all errors
SetErrorMode(2)

//Set window properties
SetWindowTitle( "The Chained Hero" )
SetWindowSize( 1920, 1080, 1 )
SetWindowAllowResize( 1 ) //Allow the user to resize the window

//Set display properties
SetVirtualResolution( 1920, 1080 ) //Doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) //Allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 ) //30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) //Use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) //Since version 2.0.22 we can use nicer default fonts

endfunction


