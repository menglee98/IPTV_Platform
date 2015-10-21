var iFullScreenStatus = 0;
var iPlaybackStatus = 1;
var iLatestPosition = 0;

function keymap()
{

	//alert("iFullScreenStatus: " + iFullScreenStatus);

	if ( event.keyCode == 8 )  // FullScreen
	{
	}
	
	/*
	if ( event.keyCode == 9 )  // Tab
	{
	    //movie.focus();
	}
	*/

	if ( event.keyCode == 13 )  // OK/Enter
	{
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

		}
	}

	if ( event.keyCode == 18 )  // Clear
	{
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
		//location.href = "http://stb.netmovies.com.tw";
		//location.href = document.URL;
		//location.href = document.Domain;
		location.href = "default.aspx";
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
	
	
	//alert("KeyCode: " + event.keyCode);
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

