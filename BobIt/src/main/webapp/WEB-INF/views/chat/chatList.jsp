<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
<style>
//
Variables
 $primary: rgba(23, 190, 187, 1) ;
 $secondary: rgba(240, 166, 202, 1) ;

 $active: rgba(23, 190, 187, 0.8) ;
 $busy: rgba(252, 100, 113, 0.8) ;
 $away: rgba(255, 253, 130, 0.8) ; // Triangle Mixin
 @mixin triangle( $color, $size, $direction) {
	width: 0;
	height: 0; @ if $direction == "up" { border-right : ($ size + px) solid
	transparent;
	border-left: ($size+ px) solid transparent;
	border-bottom: ($size+ px) solid$color;
}

@
if $direction == "down " {
	border-right: ($size+ px) solid transparent;
	border-left: ($size+ px) solid transparent;
	border-top: ($size+ px) solid$color;
}

@
if $direction == "right " {
	border-top: ($size+ px) solid transparent;
	border-bottom: ($size+ px) solid transparent;
	border-left: ($size+ px) solid$color;
}

@
if $direction == "left " {
	border-top: ($size+ px) solid transparent;
	border-bottom: ($size+ px) solid transparent;
	border-right: ($size+ px) solid$color;
}

}
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Nunito', sans-serif;
}

html, body {
	background: linear-gradient(120deg, $ primary, $ secondary);
	overflow: hidden;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100vh;
	width: 100vw; h1 { margin : 0.5em auto;
	color: #FFF;
	text-align: center;
}

}
.chatbox {
	background: rgba(255, 255, 255, 0.05);
	width: 600px;
	height: 75%;
	border-radius: 0.2em;
	position: relative;
	box-shadow: 1px 1px 12px rgba(0, 0, 0, 0.1); & __messages { & :
	nth-of-type( odd) .chatbox__messages__user-message--ind-message {
      float : right; &: after { content : '';
	position: absolute;
	margin: -1.5em -17.06em;
	@
	include
	triangle(rgba(255,
	255,
	255,
	0.2),
	10,
	left);
}

}
&
:nth-of-type(even) .chatbox__messages__user-message--ind-message {
	float: left; &: after { content : '';
	position: absolute;
	margin: -1.5em 1.87em;
	@
	include
	triangle(rgba(255,
	255,
	255,
	0.2),
	10,
	right);
}

}
}
&
__messages__user-message {
	width: 450px;
}

&
__messages__user-message--ind-message {
	background: rgba(255, 255, 255, 0.2);
	padding: 1em 0;
	height: auto;
	width: 65%;
	border-radius: 5px;
	margin: 2em 1em;
	overflow: auto; & > p .name { color : #FFF;
	font-size: 1em;
}

&
>
p.message {
	color: #FFF;
	font-size: 0.7em;
	margin: 0 2.8em;
}

}
&
__user-list {
	background: rgba(255, 255, 255, 0.1);
	width: 25%;
	height: 100%;
	float: right;
	border-top-right-radius: 0.2em;
	border-bottom-right-radius: 0.2em; h1 { background : rgba( 255, 255,
	255, 0.05);
	color: rgba(255, 255, 255, 0.9);
	font-size: 0.9em;
	padding: 1em;
	margin: 0;
	font-weight: 300;
	text-align: center;
}

}
&
__user {
	width: 0.5em;
	height: 0.5em;
	border-radius: 100%;
	margin: 1em 0.7em; &- -active { @extend .chatbox__user;
	background: $active;
}

&
--busy
{
@
extend
.chatbox__user;
background
:
$
busy;
}
&
--away
{
@
extend
.chatbox__user;
background
:
$
away;
}
}
p {
	float: left;
	text-align: left;
	margin: -0.25em 2em;
	font-size: 0.7em;
	font-weight: 300;
	color: #FFF;
	width: 200px;
}

form {
	background: #222; input { background : rgba( 255, 255, 255, 0.03);
	position: absolute;
	bottom: 0;
	left: 0;
	border: none;
	width: 75%;
	padding: 1.2em;
	outline: none;
	color: rgba(255, 255, 255, 0.9);
	font-weight: 300;
}

}
}
//
Placeholder Styling
::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.9);
}

:-moz-placeholder {
	color: rgba(255, 255, 255, 0.9);
}

::-moz-placeholder {
	color: rgba(255, 255, 255, 0.9);
}

:-ms-input-placeholder {
	color: rgba(255, 255, 255, 0.9);
}
</style>
</head>
<body>
	<div class='container' ng-cloak ng-app="chatApp">
		<h1>Swanky Chatbox UI With Angular</h1>
		<div class='chatbox' ng-controller="MessageCtrl as chatMessage">
			<div class='chatbox__user-list'>
				<h1>User list</h1>
				<div class='chatbox__user--active'>
					<p>Jack Thomson</p>
				</div>
				<div class='chatbox__user--busy'>
					<p>Angelina Jolie</p>
				</div>
				<div class='chatbox__user--active'>
					<p>George Clooney</p>
				</div>
				<div class='chatbox__user--active'>
					<p>Seth Rogen</p>
				</div>
				<div class='chatbox__user--away'>
					<p>John Lydon</p>
				</div>
			</div>
			<div class="chatbox__messages" ng-repeat="message in messages">
				<div class="chatbox__messages__user-message">
					<div class="chatbox__messages__user-message--ind-message">
						<p class="name">{{message.Name}}</p>
						<br />
						<p class="message">{{message.Message}}</p>
					</div>
				</div>
			</div>
			<form>
				<input type="text" placeholder="Enter your message">
			</form>
		</div>
		
		<script>
		(function() {
			  var app = angular.module('chatApp', []);

			  app.controller('MessageCtrl', function($scope) {
			    $scope.messages = [{
			      Name: 'George Clooney',
			      Message: "The only failure is not to try"
			    }, {
			      Name: 'Seth Rogen',
			      Message: "I grew up in Vancouver, man. That's where more than half of my style comes from."
			    }, {
			      Name: 'John Lydon',
			      Message: "There's nothing glorious in dying. Anyone can do it."
			    }];
			  });

			})();
		</script>
</body>
</html>