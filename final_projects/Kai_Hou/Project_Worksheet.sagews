︠c36fea66-bde0-4b50-96e7-821d07a85211︠

︠874937e5-f485-4ab9-a748-71cd22838eaa︠
@interact
def f(Brand=['Audi','BMW','Other']):
    if Brand == 'Other':
        @interact
        def g(mod=['SUV','Compact','Hybrid'],time=[0..24],Gastype=['Regular','Plus','Supreme','Diesel'],Follow_the_speedlimit=True):
            if mod == 'SUV':
                mpg = 21
            if mod == 'Compact':
                mpg = 26
            if mod == 'Hybrid':
                mpg = 35                                  
            if time <= 5:
                rate = 0
            if time > 5 and time <=6:
                rate = 3.25
            elif time > 6 and time <=7:
                rate = 4.5
            elif time > 7 and time <=9:
                rate = 5.25
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 10 and time <=14:
                rate = 3.95
            elif time > 14 and time <=15:
                rate = 4.5
            elif time > 15 and time <=18:
                rate = 5.25
            elif time > 18 and time <=19:
                rate = 4.5
            elif time > 19 and time <=21:
                rate = 3.95
            elif time > 21 and time <=23:
                rate = 3.25
            elif time > 23 and time <=24:
                rate = 0
            if Gastype == 'Regular':
                gasprice = 3.66
            if Gastype == 'Plus':
                gasprice = 3.78
            if Gastype == 'Supreme':
                gasprice = 3.86
            if Gastype == 'Diesel':
                gasprice = 3.80
            
            
            print "The average mpg for you car is " + str(mpg)
            print "The current toll rate for 520 is $" + str(round(rate))
            
            cost2 = round(14.5/mpg*gasprice,3)
            cost1 = round(10/mpg*gasprice + rate,3)
            print "The cost for taking bridge 520 is $" + str(cost1)
            print "The cost for taking bridge i90 is $" + str(cost2)
            
            t1 = round(10/0.6 + 0.7*rate,2)
            t2 = round(14.5/0.6 + 0.7*rate,2)
            print "The estimated time for taking 520 is " + str(t1) + " minutes"
            print "The estimated time for taking i90 is " + str(t2) + " minutes"   
    
    if Brand == 'BMW':
        @interact
        def g(mod=['1-series','3-series','5-series','6-series','7-series','X5','X6','M-series'],time=[0..24],Gastype=['Regular','Plus','Supreme','Diesel'],Follow_the_speedlimit=True):
            if mod == '1-series':
                mpg = 21
            if mod == '3-series':
                mpg = 26
            if mod == '5-series':
                mpg = 25
            if mod == '6-series':
                mpg = 19
            if mod == '7-series':
                mpg = 22
            if mod == 'M-series':
                mpg = 16
            if mod == 'X5':
                mpg = 20
            if mod == 'X6':
                mpg = 19
                          
            if time <= 5:
                rate = 0
            elif time > 5 and time <=6:
                rate = 3.25
            elif time > 6 and time <=7:
                rate = 4.5
            elif time > 7 and time <=9:
                rate = 5.25
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 10 and time <=14:
                rate = 3.95
            elif time > 14 and time <=15:
                rate = 4.5
            elif time > 15 and time <=18:
                rate = 5.25
            elif time > 18 and time <=19:
                rate = 4.5
            elif time > 19 and time <=21:
                rate = 3.95
            elif time > 21 and time <=23:
                rate = 3.25
            elif time > 23 and time <=24:
                rate = 0
            if Gastype == 'Regular':
                gasprice = 3.66
            if Gastype == 'Plus':
                gasprice = 3.78
            if Gastype == 'Supreme':
                gasprice = 3.86
            if Gastype == 'Diesel':
                gasprice = 3.80
            
            
            print "The average mpg for you car is " + str(mpg)
            print "The current toll rate for 520 is $" + str(round(rate))
            
            cost2 = round(14.5/(mpg)*gasprice,3)
            cost1 = round(10/mpg*gasprice+rate,3)
            print "The cost for taking bridge 520 is $" + str(cost1)
            print "The cost for taking bridge i90 is $" + str(cost2)
            
            t1 = round(10/0.6 + 0.7*rate,2)
            t2 = round(14.5/0.6 + 0.7*rate,2)
            print "The estimated time for taking 520 is " + str(t1) + " minutes"
            print "The estimated time for taking i90 is " + str(t2) + " minutes"
                
                
    if Brand == 'Audi':
        @interact
        def g(mod=['A3','A4','A5','A6','A7','A8','Q5','Q7'],time=[0..24],Gastype=['Regular','Plus','Supreme','Diesel'],Follow_the_speedlimit=True):
            if mod == 'A3':
                mpg = 24
            if mod == 'A4':
                mpg = 26
            if mod == 'A5':
                mpg = 24
            if mod == 'A6':
                mpg = 24
            if mod == 'A7':
                mpg = 21
            if mod == 'A8':
                mpg = 19
            if mod == 'Q5':
                mpg = 22
            if mod == 'Q7':
                mpg = 20
                         
            if time <= 5:
                rate = 0
            if time > 5 and time <=6:
                rate = 3.25
            elif time > 6 and time <=7:
                rate = 4.5
            elif time > 7 and time <=9:
                rate = 5.25
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 9 and time <=10:
                rate = 4.5
            elif time > 10 and time <=14:
                rate = 3.95
            elif time > 14 and time <=15:
                rate = 4.5
            elif time > 15 and time <=18:
                rate = 5.25
            elif time > 18 and time <=19:
                rate = 4.5
            elif time > 19 and time <=21:
                rate = 3.95
            elif time > 21 and time <=23:
                rate = 3.25
            elif time > 23 and time <=24:
                rate = 0
            if Gastype == 'Regular':
                gasprice = 3.66
            if Gastype == 'Plus':
                gasprice = 3.78
            if Gastype == 'Supreme':
                gasprice = 3.86
            if Gastype == 'Diesel':
                gasprice = 3.80
            
            
            print "The average mpg for you car is " + str(mpg)
            print "The current toll rate for 520 is $" + str(round(rate))
            
            cost2 = round(14.5/mpg*gasprice,3)
            cost1 = round(10/mpg*gasprice + rate,3)
            print "The cost for taking bridge 520 is $" + str(cost1)
            print "The cost for taking bridge i90 is $" + str(cost2)
            
            t1 = round(10/0.6 + 0.7*rate,2)
            t2 = round(14.5/0.6 + 0.7*rate,2)
            print "The estimated time for taking 520 is " + str(t1) + " minutes"
            print "The estimated time for taking i90 is " + str(t2) + " minutes"
                
︡25ab7401-8334-46a2-abc3-b44acd99c3b3︡{"interact":{"style":"None","flicker":false,"layout":[[["Brand",12,null]],[["",12,null]]],"id":"6c21707a-ad3c-4cb8-bc67-02c4ab1cb7d5","controls":[{"buttons":true,"control_type":"selector","ncols":null,"button_classes":null,"default":0,"lbls":["Audi","BMW","Other"],"label":"Brand","nrows":null,"width":null,"var":"Brand"}]}}︡
︠06bf391b-a4f7-475c-ac6a-015a9175196e︠
#I also included a Project.tex document in my final folder.
︠5fb49894-eb0e-46d7-a437-b8bd2d1f1fde︠









