︠71f19040-3896-499d-bada-f28950bd297a︠
x,y=var('x,y')
v=plot_slope_field(x^2*y^2,(x,-5,5),(y,-10,10),headaxislength=3, headlength=3)
a=6
b=-3
c=0.3
#d1=plot(-3/(x^3+a),(x,0,4))
#d2=plot(-3/(x^3+b),(x,0,1.4))
#d3=plot(-3/(x^3+c),(x,0,4))
#show(v+d1+d2+d3)


︡12c30652-22a6-4ef5-b430-1285b5df0552︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/numpy/core/fromnumeric.py\", line 2693, in var\n    keepdims=keepdims)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/numpy/core/_methods.py\", line 68, in _var\n    arrmean = um.add.reduce(arr, axis=axis, dtype=dtype, keepdims=True)\nTypeError: cannot perform reduce with flexible type\n"}︡
︠fb821eb7-147c-444c-9c05-d6ec77dea9c9︠
︡6d3c32e2-dcdf-456f-9bde-c5b0d83617de︡
︠1ca0b455-edc7-42b9-a535-4d0b7379512b︠
x,y = var('x,y')
dy_dx(4*x, 5*y^2)
︡bdcddb53-a2d0-46a8-8b72-800b5766e35e︡{"stderr":"Error in lines 1-1\nTraceback (most recent call last):\n  File \"/projects/a46969fe-7903-4920-af5c-3fe72a7148d8/.sagemathcloud/sage_server.py\", line 733, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/numpy/core/fromnumeric.py\", line 2693, in var\n    keepdims=keepdims)\n  File \"/usr/local/sage/sage-6.2.rc0/local/lib/python2.7/site-packages/numpy/core/_methods.py\", line 68, in _var\n    arrmean = um.add.reduce(arr, axis=axis, dtype=dtype, keepdims=True)\nTypeError: cannot perform reduce with flexible type\n"}︡
︠64d1ef9d-a8d8-482d-8131-4fe0b12c9f43︠









