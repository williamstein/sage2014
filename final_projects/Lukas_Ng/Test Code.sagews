︠b7f65faa-4de5-480c-8f11-1aa46819dce2︠
n = 100000
for i in range(1, n):
    if i%2 == 1:
        if sum(divisors(i)) == 2*i:
            print "WE FOUND ONE AT n = " + str(i)
            break
        else:
            pass
︡09a18972-183b-4967-81b9-3a50de10268e︡
︠7fc2f2ff-5c93-4b32-807b-5dd2fdccb868︠
