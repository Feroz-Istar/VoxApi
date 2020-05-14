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


<script>

function callback(ret, resp) {
	 if (ret == 200) {
	    console.log("SDK "+CS.version+" initialized ");
	    console.log(ret);
	    console.log(CS);
	    CS.login("feroz", "test123", function(err, resp) {
	    	 if (err != 200) { 
	    	   console.log("login failed with response code "+err+" reason "+resp);
	    	 } else {
	    	   console.log("login Successful");
	    	  /*  CS.contacts.addContact("anurag", function (err, resp) {
	    		   if (err != 200 && err != 204) {
	    		     console.log("add contact failed with response code " + err + " reason " + resp);
	    		   } else {
	    		     console.log("contact added successfully.");
	    		   }
	    		  }); */
	    	 }
	    	});
	 }
}
	 let config = {
	    appId:"pid_61f57072_4f58_4aa0_bc8f_838594cd939f"
	 };
$( document).ready(function() {
    console.log( "ready!" );
    CS.initialize(config, callback);
    
});

</script>
</body>
</html>
