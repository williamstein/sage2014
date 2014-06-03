var salvus_stats = {test : "value"};
var wsUri = "wss://cloud.sagemath.com/hub/633/q1jxqjfc/websocket";
var wsMGetStats = '["\\u0000{\\"event\\":\\"get_stats\\",\\"id\\":\\"d9a725a3-b60a-4cc2-b7c7-fcc193ef7898\\"}"]';

function init(callback) {
	testWebSocket( function() {
		callback.call(this)
	});
}
function testWebSocket(callback) {
 	websocket = new WebSocket(wsUri); 
	websocket.onopen = function(evt) {
		onOpen(evt)
		}; 
	websocket.onclose = function(evt) {
		onClose(evt)
		}; 
	websocket.onmessage = function(evt) {
		if (evt.data.indexOf("get_stats") != -1) {
			salvus_stats.test = parse_stats(evt.data)
			callback.call(salvus_stats.test);
			
		}
		 onMessage(evt)
		}; 
	websocket.onerror = function(evt) {
		onError(evt)
		};
}
function onOpen(evt) {
	doSend(wsMGetStats)
}
function onClose(evt) {
}
function onMessage(evt) {
		if (evt.data.indexOf("get_stats") != -1) {
			websocket.close();
		}
}
function onError(evt) {
 	writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data); 
}
function doSend(message) {
 	websocket.send(message);
}

function parse_stats(raw) {
	var parsed =  raw.replace(/\\"/g, '"').replace(/\\u0000/g, "").slice(3);
	var jParsed = jQuery.parseJSON(parsed.slice(0,parsed.length-2));
	var clients = 0;
	jQuery.each( jParsed.stats.hub_servers, function( i, val ) {
		clients += val.clients;
	});
	var salvus_stats = {active_clients : clients,
						active_projects : jParsed.stats.active_projects,
						total_accounts : jParsed.stats.accounts,
						total_projects : jParsed.stats.projects,
						last_day_projects : jParsed.stats.last_day_projects,
						last_week_projects : jParsed.stats.last_week_projects,
						last_month_projects : jParsed.stats.last_month_projects						
					}
	return salvus_stats;
}
function writeToScreen(message) {
	$("#tabs-1").append(message); 
}

function fetch_feed() {
  init(function(){display_stats(this)});
}

// Make a string's first character of each word uppercase
function ucwords(string)
{
	return (string + '')
    .replace(/^([a-z\u00E0-\u00FC])|\s+([a-z\u00E0-\u00FC])/g, function($1) {
      return $1.toUpperCase();
    });
}

function display_stats(salvus_stats) {
	var output = '<h3>Status</h3>';
	// Required syntax includes lowercase letters only and underscore "_" for spacing:
	// Examples: this_item, another_important_item, single, long_is_fine_but_dont_get_crazy
	
	for ( var stat in salvus_stats ) {
		output += "<b>"+ucwords(stat.replace(/_/g," "))+"</b>: "+salvus_stats[stat]+"<br>";
	}
	
	// Resource Section
	output += '<br /><h3>SageMath Resources</h3>';
	
	var sage_resources = {trac : "http://trac.sagemath.org/",
							documentation : "http://www.sagemath.org/doc/reference/"
							}
	for ( var res in sage_resources ) {
		output += '[<a href="'+sage_resources[res]+'" target="_blank">'+ucwords(res.replace(/_/g," "))+'</a>]&nbsp;&nbsp;&nbsp;';
	}
	
	output += '<br /><br /><h3>SageCloud Resources</h3>';
	var cloud_resources = {help : "https://cloud.sagemath.com/help",
							issues : "https://github.com/sagemath/cloud/issues",
							FAQ : "https://github.com/sagemath/cloud/issues"
							}
	
	for ( var res in cloud_resources ) {
		output += '[<a href="'+cloud_resources[res]+'" target="_blank">'+ucwords(res.replace(/_/g," "))+'</a>]&nbsp;&nbsp;&nbsp;';
	}
	
  $("#tabs-1").append(output);
}
$(document).ready(function() {
		$( "#button" ).button();
		$( "#tabs" ).tabs();
  fetch_feed();
});
