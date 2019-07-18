<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML>
<html manifest="">

<head>
<title>DChart</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=10, user-scalable=yes">
<%
	String redirecturl = request.getParameter("redirecturl");
	String checkUrl = "loginCheck";
	if (redirecturl != null && redirecturl.length() > 0) {
		checkUrl += "?redirecturl=";
		checkUrl += redirecturl;
	}
%>
<style type="text/css">
a:link {
	color: #FFF;
}

a:visited {
	color: #FFF;
}

@font-face {
	font-family: "Open Sans";
	src: url(resources/images/login/OpenSans-Light-webfont.woff)
		format("woff");
	font-weight: 300;
	font-style: normal;
}

@font-face {
	font-family: "Open Sans";
	src: url(resources/images/login/OpenSans-Semibold-webfont.woff)
		format("woff");
	font-weight: 600;
	font-style: normal;
}

html {
	background: linear-gradient(145deg, #484962 30%, #d06b41 100%);
}

@media ( min-width : 1000px) {
	/* load on wide screens */
	body {
		background-color: transparent;
		background-image: url(resources/images/login/bg1.jpg);
		background-size: cover;
	}
}

button {
	background-color: #4b4b65;
}

#logo {
	display: inline-block;
	width: 60px;
	height: 60px;
	border-radius: 100%;
	/*background-image: url(resources/images/login/icon-96.png);*/
	background-size: contain;
	background-repeat: no-repeat;
	/*background-color: rgba(255,255,255,0.2);*/
	/*box-shadow: 3px 3px 8px rgba(0,0,0,.2);*/
}

/* Layout */
*, *:before, *:after {
	box-sizing: border-box;
}

html, body {
	height: 100%;
	font: 100 16px/1.55 "Open Sans", sans-serif;
	margin: 0;
}

#info {
	color: #fff;
	text-align: center;
	padding: 28px;
}

#form {
	height: 100%;
	display: flex;
	background-color: #fff;
	justify-content: center;
}

/* Responsive behaviour */
@media ( max-width : 1000px) {
	h2 {
		display: none;
	}
}

@media ( min-width : 1001px) {
	body {
		display: flex;
		align-items: center;
		justify-content: center;
	}
	#logo {
		width: 96px;
		/*height: 96px;*/
		height: 20px;
	}
	#info, #form {
		height: 450px;
		box-shadow: 0 2px 3px rgba(0, 0, 0, .2);
	}
	#info {
		background-color: rgba(255, 255, 255, .2);
		width: 465px;
		border-radius: 5px 0 0 5px;
	}
	#form {
		width: 320px;
		padding: 28px;
		border-radius: 0 5px 5px 0;
	}
}

/* Elements / components theme */
h1 {
	font-size: 42px;
	font-weight: 200;
}

h2 {
	font-size: 28px;
	font-weight: 100;
	margin-bottom: 14px;
}

form {
	max-width: 320px;
}

label {
	font-size: 14px;
	padding: 16px 0 5px 0;
	display: inline-block;
}

input[type='text'], input[type='password'] {
	width: 100%;
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	-o-appearance: none;
	appearance: none;
	font: inherit;
	font-size: 14px;
	height: 37px;
	border-radius: 4px;
	padding: 4px 9px;
	border: 1px solid rgba(0, 0, 0, .2);
}

button {
	width: 100%;
	margin-top: 37px;
	height: 37px;
	border: 1px solid #666;
	border-radius: 4px;
	background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.2) 2%,
		rgba(0, 0, 0, 0.1) 98%);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), inset 0 -1px 0
		rgba(0, 0, 0, 0.2), 0 2px 3px rgba(0, 0, 0, 0.05);
	outline: none;
	cursor: pointer;
	color: #fff;
	text-align: center;
	position: relative;
	font: inherit;
	font-weight: 600;
}

#button-submit:focus:after {
	box-shadow: 0 0 0 2px rgba(0, 0, 0, .5);
	content: "";
	position: absolute;
	top: -2px;
	right: -2px;
	bottom: -2px;
	left: -2px;
	border-radius: inherit;
}

.error input {
	display: block;
	border-color: red;
}

.error form:after {
	content:
		"The username and password you entered do not match our records. Please double-check and try again.";
	display: block;
	border: 1px solid red;
	border-radius: 4px;
	width: 100%;
	margin-top: 16px;
	font-size: 14px;
	padding: 8px;
}
</style>
</head>
<body>
	<div id="info" class="info">
		<!-- <div id="logo"></div> -->
		<h1>
			<B>DChart</B>
		</h1>
		<BR> <span style="align: center;"> </span>
	</div>
	<div id="form">
		<form method="post" action="<%=checkUrl%>" id="theform">
			<h2>Sign in</h2>
			<%
				String str = (String) request.getSession().getAttribute("msg");
				if (str != null) {
			%><span style="color: red;"><B><%=str%></B></span>
			<%
				}
				request.getSession().setAttribute("msg", null);
			%>

			<label id="login-label" for="login">User Name:</label> <input
				type="text" id="login" name="username" aria-labelledby="login-label"
				autofocus placeholder=""> <label id="password-label"
				for="password">Password</label> <input type="password" id="password"
				name="password" aria-labelledby="password-label">
			<button id="button-submit" type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>