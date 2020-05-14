<html>

<head>
<%

String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";%>
<script src="https://developer.vox-cpaas.com/js/jquery.min.js"></script>
<script src="https://developer.vox-cpaas.com/js/bootstrap.min.js"></script>
<script src="<%=baseURL %>assets/js/adapter-latest.js"></script>
<script src="<%=baseURL %>assets/js/protobuf.min.js"></script>
<script src="<%=baseURL %>assets/js/aws-sdk-2.154.0.min.js"></script>
<script src="<%=baseURL %>assets/js/OneSignalSDK.js"></script>
<script src="<%=baseURL %>assets/js/sha256.js"></script>
<script src="<%=baseURL %>assets/js/calmsdk-001.js"></script>
<script src="<%=baseURL %>assets/js/wrtc.js"></script>
<script src="<%=baseURL %>assets/js/RecordRTC.js"></script>
</head>
<body>
<h2>Hello World!</h2>


<audio controls id="localAudio">
  
  Your browser does not support the audio tag.
</audio>

<audio controls id="remoteAudio">
  Your browser does not support the audio tag.
</audio>


<script>

function sdkcallback(ret, resp) {
	 if (ret == 200) {
	    console.log("SDK "+CS.version+" initialized ");
	    console.log(ret);
	    console.log(CS);
	    login();
	 }
}

function login(){
	 CS.login("feroz", "test123", function(err, resp) {
    	 if (err != 200) { 
    	   console.log("login failed with response code "+err+" reason "+resp);
    	 } else {
    	   console.log("login Successful");
    	   placeAudioCall();
    	 }
    	});
}

function placeAudioCall(){
	var callId = CS.call.startCall("anurag", "localAudio", "remoteAudio", false, audiocallbackFunc);
	setTimeout(function(){ 
		console.log('Call ending .........')
		CS.call.end(callId, "Bye", function(ret, resp) {
			  If (ret == 200)
			      console.log("call end successfully");
			});
	}, 30000);

}


function audiocallbackFunc(code, resp){
	 if (code != 200) { 
	   alert("call failed with response code "+code+" reason "+resp);
	 }else{
		 console.log("audio call back ....")
	 }
	}


	 let config = {
	    appId:"pid_61f57072_4f58_4aa0_bc8f_838594cd939f"
	 };
$( document).ready(function() {
    console.log( "ready!" );
    CS.initialize(config, sdkcallback);
    
});

</script>
</body>
</html>
