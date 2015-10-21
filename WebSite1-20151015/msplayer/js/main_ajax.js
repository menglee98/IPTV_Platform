//產生一個新的XMLHttpRequest物件

var xmlHttp;
function createXmlHttpRequestObject(){
	/*
	try{
		xmlHttp = new XMLHttpRequest();
	}
  catch(e){
		var XmlHttpVersions = new Array("Microsoft.XMLHTTP",
																		"Msxml2.XMLHTTP",
                                    "Msxml2.XMLHTTP.3.0",
                                    "Msxml2.XMLHTTP.4.0",
                                    "Msxml2.XMLHTTP.5.0",
                                    "Msxml2.XMLHTTP.6.0");
		for (var i=0; i<XmlHttpVersions.length && !xmlHttp; i++){
			try{ 
        xmlHttp = new ActiveXObject(XmlHttpVersions[i]);
      } 
      catch (e){}
    }
  }
  */
  xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	if(!xmlHttp)
    alert("Error creating the XMLHttpRequest object.");
  else 
    return xmlHttp;
}

function handleServerResponse_TEXT(url,data){
	createXmlHttpRequestObject();
	xmlHttp.onreadystatechange = handleRequestStateChange;
	//xmlHttp.open("GET",url,true);
	//xmlHttp.send(null);
	xmlHttp.open("POST",url,true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.send(data);
}

function handleRequestStateChange(){
	if(xmlHttp.readyState==4){
		if(xmlHttp.status==200||xmlHttp.status==0){
			try{
				handle_result(xmlHttp.responseText);
			}
			catch(e){
				alert("Error reading the response: " + e.toString());
			}
		}
		else{
			alert("Error: the status code is " + xmlHttp.status);
		}
	}
}