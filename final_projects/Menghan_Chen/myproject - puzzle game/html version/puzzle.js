// Menghan Chen, MATH480B, 14sp, Project
// This page is the JavaScript code for the web page
// This project let the user play a puzzle game.

"use strict";

var emptyLeft = 300; // the initial x position of the empty square
var emptyTop = 300; // the initial y position of the empty square
var wins = 0; // the initial win count is 0 if there's no localStorage

window.onload = function() {
	// restore last win count 
	var totalWin = document.getElementById("total");
	if (localStorage["total"]){
		wins = localStorage["total"];	
	} 
	totalWin.innerHTML = "Total wins: " + wins;
	
	// restore last background image if there was one saved by the user 
	if (localStorage["backImg"]){
		var backgroundImg = localStorage["backImg"];
	} else {
		var backgroundImg = "background1.jpg";
	}
	// select the corresponding background image option
	document.getElementById("background").options[backgroundImg.charAt(10)-1].selected = true;
	
	putSquares(backgroundImg);
	document.getElementById("background").onchange = changeBackground; 
	document.getElementById("shuffle").onclick = shuffle;
};

// put several squares to the page to make a puzzle
function putSquares(backgroundImg){
	var x = 0;
	var y = 0;
	var area = document.getElementById("puzzlearea");
	for (var i = 0; i < 15; i++) {
		// <div class="square"></div>
		var div = document.createElement("div");
		div.className = "square";
		
		// put the square in the puzzle 
		div.style.left = x + "px"; // x/y postion of each square
		div.style.top = y + "px";
		//each square has a specific part of the background image
		imgPostion(-x, -y, div, backgroundImg);
		div.innerHTML = i+1;  
		//x/y position for the next square
		x += 100;
		if (x > 300){
			x = 0;
			y += 100;
		}
		
		div.onmouseover = squareMouseOver;
		div.onmouseout = squareMouseOut;
		div.onclick = move;			
		area.appendChild(div);
	}
}

//Change the background image, with no change of the state of the puzzle
function changeBackground() {
	var squares = document.querySelectorAll(".square");
	var backgroundImg = document.getElementById("background").value;
	//remember this background for the next time the page is loaded
	localStorage["backImg"] = backgroundImg;
	//get the position of each square, and change its background image
	for (var i = 0; i < squares.length; i++) {
		var square = squares[i];
		var x = square.style.backgroundPosition.left;
		var y = square.style.backgroundPosition.top;
		//change background image of this square
		imgPostion(x, y, square, backgroundImg);
	}
}

//change the background image of one square
function imgPostion(x, y, square, backgroundImg) {
	square.style.backgroundImage="url(" + backgroundImg + ")";
	square.style.backgroundPosition = x + "px " + y + "px";
}

//When the mouse button is pressed on a puzzle square, if that square is next to the blank square, 
//it is moved into the blank space. If the square does not neighbor the blank square, no action 
//occurs. If the mouse is pressed on the empty square or elsewhere on the page, no action occurs.
function move() {
	moveThis(this);
	// now check whether the puzzle is solved
	var winMessage = document.getElementById("win");
	var totalWin = document.getElementById("total");
	if (solved()){
		if (winMessage.innerHTML == "&nbsp;"){
			winMessage.innerHTML = "Congratulations! You win!";
			wins++;
			localStorage["total"] = wins;
			totalWin.innerHTML = "Total wins: " + wins;
		}
	} else {
		winMessage.innerHTML = "&nbsp;";
	}
}

//if a square is movable, move it to the location of the empty square.
function moveThis(square){
	//current square
	var curLeft = parseInt(square.style.left);
	var curTop = parseInt(square.style.top);

	//if the square is directly left or right from the empty square, exchange them vertically
	if(directLeftRight(curLeft, curTop, emptyLeft, emptyTop)) {
		square.style.left = emptyLeft + "px";
		emptyLeft = curLeft;
	}
	
	//if the square is directly up or down from the empty square, exchange them horizontally
	if(directUpDown(curLeft, curTop, emptyLeft, emptyTop)) {
		square.style.top = emptyTop + "px";
		emptyTop = curTop;
	}
}

// randomly rearrange the tiles of the puzzle
function shuffle() {
	// After the user makes a shuffle, the win message should disappear
	var winMessage = document.getElementById("win");
	winMessage.innerHTML = "&nbsp;";
	for (var i = 0; i < 1000; i++) {
		//for each neighbor n that is directly up, down, left, right from empty square
		//put n into the array so that a random square could be chosen later
		var neighbors = [];
		var squares = document.querySelectorAll(".square");
		for (var j = 0; j < squares.length; j++){
			var square = squares[j];
			if (isMovable(square)){
				neighbors.push(square);		
			}	
		}
		var randomNum = parseInt(Math.random() * (neighbors.length)); //choose one random square
		var randomSquare = neighbors[randomNum];
		moveThis(randomSquare); 
	}
}

// find out the puzzle is solved
function solved(){
	var match = true;
	var squares = document.querySelectorAll(".square");
	//get the position of each square, and change its background image
	for (var i = 0; i < squares.length; i++) {
		var square = squares[i];
		//if x/y values of backgroundPosition is equal to the negative x/y value of the 
		//square's position, this square is in the expected proper position
		var backP = square.style.backgroundPosition;
		var sL = parseInt(square.style.left);
		var sT = parseInt(square.style.top);
		var sP = changePtoN(sL) + "px " + changePtoN(sT) + "px";	
		if (backP != sP){
			match = false;
		} 
	}
	return match;
}

// change a positive number to an negative number
function changePtoN(num) {
	if (num>0){
		num = "-" + num;
	}
	return num;
}

//When the mouse hovers over a square that can be moved, its border and text color
//become red. Also, the mouse cursor changes into a "hand" cursor pointing at the square
function squareMouseOver() {
	if (isMovable(this)){
		this.classList.add("highlight");
	}
}

//Once the cursor is no longer hovering on the square, 
//its appearance should revert to its original state. (black border and text, arrow cursor)
function squareMouseOut() {
	this.classList.remove("highlight");
}

// find out whether the square is directly up or down from the empty square
function directUpDown(curLeft, curTop, emptyLeft, emptyTop) {
	return curLeft == emptyLeft && (curTop == emptyTop - 100 || curTop == emptyTop + 100);
}

// find out whether the square is directly left or right from the empty square
function directLeftRight(curLeft, curTop, emptyLeft, emptyTop) {
	return curTop == emptyTop && (curLeft == emptyLeft - 100 || curLeft == emptyLeft + 100);
}

// find out whether the sqaure is movable
function isMovable(square){
	//current square
	var curLeft = parseInt(square.style.left);
	var curTop = parseInt(square.style.top);
	if (directLeftRight(curLeft, curTop, emptyLeft, emptyTop) || 
		directUpDown(curLeft, curTop, emptyLeft, emptyTop)){
		return true;
	} else {
		return false;
	}
}