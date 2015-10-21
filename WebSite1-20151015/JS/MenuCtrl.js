

var X;
var Y	;
var XSize; //Different by need
var YSize; //Different by need
var LstInFocus;
var LstAmount ;
var BorderImg ;
var SelImg ;
var ImgWidth;
var ImgHeight ;
var Pos;	


function LstRight()
{
	if(X==XSize){
		X=1;
		
		if(Y==YSize){
			Y=1;
		}
		else
			++Y;
	}
	else
		++X;
		
	ChangeImg();
}

function LstLeft()
{
	if(X==1){
		X=XSize;
		
		if(Y==1){
			Y = YSize;
		}
		else{
			--Y;
		}
	}
	else
		--X;
		
	ChangeImg();
}

function LstDown()
{
	if(Y==YSize){
		Y = 1;
		
		if(X==XSize){
			X=1;
		}
		else
			++X;
	}
	else{
		++Y;
	}
	ChangeImg();
}

function LstUp()
{
	if(Y==1){
		Y = YSize;
		
		if(X==1){
			X = XSize;
		}
		else{
			--X;
		}
	}
	else{
		--Y;
	}
	ChangeImg();
}

function ChangeImg()
{
	//Hide pre img
	LstHide(Pos);
	
	//Calculate the new Position
	Pos = X + (Y-1)*XSize;	
	
	//Show target img
	LstShow(Pos);
}

function LstHide(i)
{
	//eval("document.s" + i + ".src='" + this.BorderImg + "'  ;") ;
	//alert("Hide:" + i) ;
}
function LstShow(i)
{
	//eval("document.s" + i + ".src='" + this.SelImg + "'  ;") ;
	eval("document.forms[0].s" + i + ".focus();");
	//alert("Show:" + i) ;
}

function LstRender()
{
	++this.LstAmount;
	return'<INPUT class="list" id="s' + this.LstAmount + '" style="WIDTH: 293px; HEIGHT: 48px" type="button" value="' + arrMenu[this.LstAmount-1].Title + '" name="s' + this.LstAmount + '" borderimage="./_Index/s0.gif" selimage="./_Index/s' + this.LstAmount + '-1.jpg">' ;
	//return '<img src="' + this.BorderImg + '" alt=" " width="' + this.ImgWidth + '" height="' + this.ImgHeight + '" id="s' + this.LstAmount + '" name="s' + this.LstAmount + '">' ;
}
