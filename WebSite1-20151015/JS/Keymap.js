var iFullScreenStatus = 0;
var iPlaybackStatus = 1;
var iLatestPosition = 0;

function keymap()
{

	/*
	if (event.shiftKey && altKey && event.ctrlKey)
	{
		alert(" shift && alt && ctrl + KeyCode: " + event.keyCode);
	}
	if (event.shiftKey && event.ctrlKey)
	{
		alert(" shift && ctrl + KeyCode: " + event.keyCode);
	}
	if (event.altKey && event.ctrlKey)
	{
		alert(" alt && ctrl + KeyCode: " + event.keyCode);
	}
	if (event.shiftKey && event.altKey)
	{
		alert(" shift && alt + KeyCode: " + event.keyCode);
	}
	else if (event.ctrlKey)
	{
		alert(" Ctrl + KeyCode: " + event.keyCode);
	}
	else if (event.altKey)
	{
		alert(" alt + KeyCode: " + event.keyCode);
	}
	else if (event.shiftKey)
	{
		alert(" shift + KeyCode: " + event.keyCode);
	}
	else
	{
		alert(" KeyCode: " + event.keyCode);
	}
	*/
	

	//alert("iFullScreenStatus: " + iFullScreenStatus);

	//window.self.focus();

	/*
	if ( event.keyCode == 27 )  // ESC
	{
		event.returnValue = false;
		return false;
	}
	*/

	//if ( event.keyCode == 8 )  // FullScreen
	if ( event.altKey && event.keyCode == 13 )  // FullScreen
	{
		if (iFullScreenStatus ==0)
		{
			iFullScreenStatus = 1;
			//alert("iFullScreenStatus : " + iFullScreenStatus );
			MPlyr.DisplaySize=3;
			//DoPlay();
		}
		else
		{
			iFullScreenStatus = 0;
			//alert("iFullScreenStatus : " + iFullScreenStatus );
			MPlyr.DisplaySize=2;
			//alert("CurrentPosition : " + MPlyr.CurrentPosition );
			mainpage.focus();
		}
		event.returnValue = false;
		return false;
	}
	
	/*
	if ( event.keyCode == 9 )  // Tab
	{
	    //movie.focus();
	}
	*/

	if ( event.keyCode == 13 )  // OK/Enter
	{
		/*
		if (iFullScreenStatus ==0)
		{
			iFullScreenStatus = 1;
			//alert("iFullScreenStatus : " + iFullScreenStatus );
			MPlyr.DisplaySize=3;
		}
		else
		{
			iFullScreenStatus = 0;
			//alert("iFullScreenStatus : " + iFullScreenStatus );
			MPlyr.DisplaySize=2;
			//alert("CurrentPosition : " + MPlyr.CurrentPosition );
			//window.self.focus();
		}
		*/
	}

	//if ( event.keyCode == 37 ){ }  // Arrow Left
	//if ( event.keyCode == 38 ){ }  // Arrow Up
	//if ( event.keyCode == 39 ){ }  // Arrow Right
	//if ( event.keyCode == 40 ){ }  // Arrow Down


	if ( event.keyCode == 96 ){ num00.focus(); }  // 0
	
	if ( event.keyCode == 97 ){ num01.focus(); }  // 1
	if ( event.keyCode == 98 ){ num02.focus(); }  // 2
	if ( event.keyCode == 99 ){ num03.focus(); }  // 3
	if ( event.keyCode == 100 ){ num04.focus(); }  // 4
	if ( event.keyCode == 101 ){ num05.focus(); }  // 5
	if ( event.keyCode == 102 ){ num06.focus(); }  // 6
	if ( event.keyCode == 103 ){ num07.focus(); }  // 7
	if ( event.keyCode == 104 ){ num08.focus(); }  // 8
	if ( event.keyCode == 105 ){ num09.focus(); }  // 9

	//if ( event.keyCode == 112 ){ }  // K/B
	if ( event.keyCode == 135 )  // K/B [F24]
	{
		alert(" Apps(Microsoft Natural K/B) : " + event.keyCode );
	}
	//if ( event.keyCode == 116 ){ }  // Refresh

	if ( event.keyCode == 124 || event.keyCode == 173){ MPlyr.Mute=true; }	 // MUTE
	if ( event.keyCode == 125 || event.keyCode == 175 || event.keyCode == 107){ MPlyr.Mute=false; MPlyr.Volume = MPlyr.Volume + 200; }  // Volume+
	if ( event.keyCode == 126 || event.keyCode == 174 || event.keyCode == 109){ MPlyr.Mute=false; MPlyr.Volume = MPlyr.Volume - 200; }  // Volume-
	
	if ( event.keyCode == 127 )  // CH+
	{ MPlyr.DisplaySize=3; }
	if ( event.keyCode == 128 )  // CH-
	{ MPlyr.DisplaySize=2; }
	
	if ( event.keyCode == 129 )	 // Root MENU
	{
		//location.href = "http://140.112.114.52/YWH_LIVE_V1.0/";
		//location.href = document.URL;
		//location.href = document.Domain;
		location.href = "http://140.112.114.52/YWH_LIVE_V1.0/";
	}
	
	if ( event.keyCode == 130 || event.keyCode == 177 )  // Rewind
	{
	    //alert("Playback Status: " + MPlyr.PlayState + ", ReadyStatus: " + MPlyr.ReadyState + ", iPlaybackStatus: " + iPlaybackStatus);
	    
        if (iFullScreenStatus ==1)
        {
    		iPlaybackStatus = -1;
	        MPlyr.FastReverse();
        }
        else
        {
        
		    if (iPlaybackStatus != 1)
		    {
    		    //iPlaybackStatus = 1;
		        ResumePlaying();
		    }
		    else
		    {
    			iPlaybackStatus = -1;
		        MPlyr.FastReverse();
		    }
		}
	}

	if ( event.keyCode == 131 || event.keyCode == 176)  // Forward
	{
	    //alert("Playback Status: " + MPlyr.PlayState + ", ReadyStatus: " + MPlyr.ReadyState + ", iPlaybackStatus: " + iPlaybackStatus);

        if (iFullScreenStatus ==1)
        {
   		    iPlaybackStatus = 2;
	        MPlyr.FastForward();
        }
        else
        {
        
		    if (iPlaybackStatus != 1 )
		    {
    		    //iPlaybackStatus = 1;
		        ResumePlaying();
		    }
		    else
		    {
        		iPlaybackStatus = 2;
	            MPlyr.FastForward();
    		}
	    }

	}
	
	if ( event.keyCode == 132 || event.keyCode == 178)  // Stop
	{
	    iPlaybackStatus = 0;
	    MPlyr.DisplaySize = 2;
	    MPlyr.stop();
	    history.back(-1);
	    //location.href = "default.htm";
	}
	
	if ( event.keyCode == 133 || event.keyCode == 250 || event.keyCode == 179)  // Play
	{
	    DoPlay();
	}
	
	if ( event.keyCode == 134 || event.keyCode == 19)  // Pause
	{
	    //iPlaybackStatus = 1;
	    MPlyr.Pause(); 
	}
	
	
}

function DoPlay()
{
	if (iPlaybackStatus == 1)
	{
	    MPlyr.Play();
	}
	else
    if (iPlaybackStatus == 0)
	{
	    iPlaybackStatus = 1; 
	    MPlyr.Play();
	}
	else
	{
	    ResumePlaying();
	}
}

function ResumePlaying()
{
	iPlaybackStatus = 1;
	iLatestPosition = MPlyr.CurrentPosition;
	MPlyr.Stop();
	MPlyr.CurrentPosition = iLatestPosition;
	MPlyr.Play();
}

