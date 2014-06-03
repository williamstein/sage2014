︠90662231-30e5-48ba-87da-8f6248ec1cce︠
v = open('return.txt').readlines()
z = finance.TimeSeries(v)
︡f2cbf891-5925-45a7-a9ed-c0c5cb07f339︡
︠63c32574-29a0-4a87-a44c-b116f0e3f6fa︠
g = z.sums().plot()
g
g += text('year 2011', (200,.1), color='black')
g += text('year 2012', (450,.2), color='black')
g += text('year 2013', (700,.38), color='black')
g
︡a7c9f4a0-b757-4561-8294-e2c977bf34db︡{"once":false,"file":{"show":true,"uuid":"fdc2ff64-3da6-4c57-9f3b-587cb7f690fc","filename":"/projects/203717f1-ca2f-430e-87ae-6f34ef470b41/.sage/temp/compute5dc2/7187/tmp_pjwKxl.png"}}︡{"once":false,"file":{"show":true,"uuid":"da84cc63-bf47-454a-af6e-db45f710030e","filename":"/projects/203717f1-ca2f-430e-87ae-6f34ef470b41/.sage/temp/compute5dc2/7187/tmp_oGGDsj.png"}}︡
︠be1b3de8-8a25-4fef-9718-8c95ffb614cc︠
x = open('orignalreturn.txt').readlines()
y = finance.TimeSeries(x)
︡df54cb3d-89e6-4c6b-b52a-bef4e4410808︡
︠c2ac24fd-dd4d-416b-b1f0-e515efa5001c︠
q = y.sums().plot(color="red")
q
q += text('year 2011', (200,.1), color='black')
q += text('year 2012', (450,.2), color='black')
q += text('year 2013', (700,.38), color='black')
q
︡6c7c4ca5-26f7-4e44-8c49-c5a8f206f28f︡{"once":false,"file":{"show":true,"uuid":"57a19709-a235-415b-aedc-745061dc08bc","filename":"/projects/203717f1-ca2f-430e-87ae-6f34ef470b41/.sage/temp/compute5dc2/7187/tmp_WnI4BU.png"}}︡{"once":false,"file":{"show":true,"uuid":"1ba367b8-04a9-4efd-9fc0-a626a48aad23","filename":"/projects/203717f1-ca2f-430e-87ae-6f34ef470b41/.sage/temp/compute5dc2/7187/tmp_YCB2Fj.png"}}︡
︠375f743b-61a4-410b-85db-e1a5d85d4e88︠
plot(q)+g
︡18891299-0cae-4ceb-934c-994f75fd93c8︡{"once":false,"file":{"show":true,"uuid":"6254ae03-dd2a-4201-ab17-1057f7da6d39","filename":"/projects/203717f1-ca2f-430e-87ae-6f34ef470b41/.sage/temp/compute5dc2/7187/tmp_vzxrN5.png"}}︡
︠8cd53983-f02a-4251-bf80-d4f87921ad46︠









