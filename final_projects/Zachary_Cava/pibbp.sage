# Failed implementation in sage, left for historical purposes
def series(m, n):
    seriesSum = 0
    for i in range(0, n):
        denom = 8 * i + m
        pows = n - i
        term = power_mod(16, pows, denom)
        seriesSum = seriesSum + term / denom
        seriesSum = seriesSum - floor(seriesSum)
    
    for i in range(n, 100):
        denom = 8 * i + m
        term = pow(16, n - i) / denom
        if term < 1e-17:
            break
        seriesSum = seriesSum + term
        seriesSum = seriesSum - floor(seriesSum)
        
    return seriesSum

def computePosition(pos = 0):
    s1 = series(1, pos)
    s2 = series(4, pos)
    s3 = series(5, pos)
    s4 = series(6, pos)
    
    piPoint = 4 * s1 - 2 * s2 - s3 - s4
    piPoint = piPoint - floor(piPoint) + 1
    return hexString(piPoint)
    
def hexString(x, digits = 16):
    chars = "0123456789ABCDEF";
    out = "";
    y = abs(x)
    for i in range(0, digits):
        y = 16 * (y - floor(y))
        out += chars[floor(y)]
    return out