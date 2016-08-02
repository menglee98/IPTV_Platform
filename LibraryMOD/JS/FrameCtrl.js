
function FrameHide()
{
	window.scroll(0,0);
}

function FrameShow()
{
	if(top.STBVersion=="MSIE")
	{	window.scroll(0,3000);	
		
	}
	else
	{	window.scroll(0,480);	}

	ifrMain.window.focus();
	//alert("FrameShow");
}

function FrameGo(url)
{
	FrameHide() ;
	ifrMain.location.href = url ;
}

function FrameProcessing()
{
}
/*************************AutoRolling-V1.0**********************
var i=0;
function FrameRoll(height)
{
		if(i<(height-2))
		{	
			i=i+2;
			setTimeout("FrameRoll("+height+");",100);
			
		}
		else 
		{
			i = height;
		}
		//alert(i);
		ifrMain.ifrINFO.window.scroll(0,i);
}
*/

var ObjScroll = new Object();
ObjScroll.RollingPixel=0;
ObjScroll.AutoScrollStatus="OFF";//Frame Auto Scrolling Status
function FrameRoll(MODE,HEIGHT,FRAMESIZE)
{	
	switch(MODE)
	{
	case "AUTO":
			ObjScroll.HEIGHT=HEIGHT;
			ObjScroll.FRAMESIZE=FRAMESIZE;
			ObjScroll.myInterID = setInterval('FrameRoll("ROLL",'+HEIGHT+','+FRAMESIZE+');',1000);
			ObjScroll.AutoScrollStatus = "ON";
			
			break;
			
	case "STOP":
			clearInterval(ObjScroll.myInterID);
			ObjScroll.AutoScrollStatus = "OFF";
			
			break;
	case "UP":
			if(ObjScroll.AutoScrollStatus == "ON")
				FrameRoll("STOP",ObjScroll.HEIGHT,ObjScroll.FRAMESIZE);
			
			if((ObjScroll.RollingPixel-20)>=0)
				ObjScroll.RollingPixel=ObjScroll.RollingPixel-20;
			else 
			{
				ObjScroll.RollingPixel=ObjScroll.HEIGHT+ObjScroll.FRAMESIZE;
			}
	
			ifrMain.ifrINFO.window.scroll(0,ObjScroll.RollingPixel);
			break;
			
	
	case "DOWN":
			if(ObjScroll.AutoScrollStatus == "ON")
				FrameRoll("STOP",HEIGHT,FRAMESIZE);
				if((ObjScroll.RollingPixel+20)>=(ObjScroll.HEIGHT+ObjScroll.FRAMESIZE))	
				ObjScroll.RollingPixel=0;
				//alert(ObjScroll.HEIGHT+ObjScroll.FRAMESIZE);
				else
				ObjScroll.RollingPixel=ObjScroll.RollingPixel+20;
				
			ifrMain.ifrINFO.window.scroll(0,ObjScroll.RollingPixel);
			break;
	case "ROLL":
			if((ObjScroll.RollingPixel+20)>=(ObjScroll.HEIGHT+ObjScroll.FRAMESIZE))
				ObjScroll.RollingPixel=0;
				else
				ObjScroll.RollingPixel=ObjScroll.RollingPixel+20;
			
			ifrMain.ifrINFO.window.scroll(0,ObjScroll.RollingPixel);
			break;
	}
	
}

