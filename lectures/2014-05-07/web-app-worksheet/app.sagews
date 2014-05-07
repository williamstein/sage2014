︠73d9cd7e-11d8-4f5f-8072-2517fce80b1di︠
%md
## Example of a standard Javascript/HTML/CSS application in a worksheet.

 - Edit the files app.html, app.css and app.js, then evaluate the cell below.


︡09c1e655-83cf-4482-8554-2f5629c87ac9︡{"html":"<h2>Example of a standard Javascript/HTML/CSS application in a worksheet.</h2>\n\n<ul>\n<li>Edit the files app.html, app.css and app.js, then evaluate the cell below.</li>\n</ul>\n"}︡
︠dbb5c6c0-32cc-46e3-b8a0-6b594886d530︠
a = 'something else'
︡9171e045-9c15-4c8d-a4e4-a8a4540a75d2︡
︠208a9eb0-e3d1-471a-a9de-357e0f005e45︠
%load app.html app.css

sleep(0.1); salvus.javascript(open('app.js').read())  # I'll later make it so you can do '%load app.js'...

︡7e2bc459-7287-4c3f-b4a1-4ef58422cc53︡{"once":false,"file":{"show":false,"uuid":"ea60a5a9-248a-49dc-a6f5-e1ca54581d9b","filename":"app.html"}}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"opts.element.append($(\"<div>\").load(\"/blobs/app.html?uuid=ea60a5a9-248a-49dc-a6f5-e1ca54581d9b\"))"},"once":false}︡{"once":false,"file":{"show":false,"uuid":"6eb51297-400c-45d5-9ef3-a5c356f7e731","filename":"app.css"}}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$.get(\"/blobs/app.css?uuid=6eb51297-400c-45d5-9ef3-a5c356f7e731\", function(css) { $('<style type=text/css></style>').html(css).appendTo(\"body\")});"},"once":false}︡{"obj":"{}","javascript":{"coffeescript":false,"code":"$(\".app-button\").click(function(e) {\n\n    n = parseFloat($(\".app-input\").val());\n\n    worksheet.execute_code({\n        code: \"print a; salvus.data['n'] * random()\",\n        data: {n:n},\n        preparse: true,\n        cb : function(mesg) {\n            console.log(mesg);\n            if (mesg.stdout) {\n                $(\".app-output\").append(mesg.stdout);\n            }\n        }\n    })\n})"},"once":false}︡
︠cd8cb026-c432-4ce1-ae37-86be83a57851︠

@interact
def f(n=(1..10)):
    print n*random()
︡d0c47e71-39a1-4b73-97dd-50ef516a25ec︡{"interact":{"style":"None","flicker":false,"layout":[[["n",12,null]],[["",12,null]]],"id":"0c0e71c1-3504-4a7d-8608-17fb5d3142d5","controls":[{"control_type":"slider","default":0,"var":"n","width":null,"vals":["1","2","3","4","5","6","7","8","9","10"],"animate":true,"label":"n","display_value":true}]}}︡
︠bdd8a3f7-8a5f-4946-8f05-b7660d04b5ae︠
interact.controls.range_slider?
︠9290a7fc-3e57-4523-b594-a71b2b22745f︠









