︠09d3c558-4dad-4594-8b5a-2b258ddd024e︠
#!/usr/bin/python
import numpy as np

import matplotlib.pyplot as plt



def Sandpile(N = 1000, T = 200000):
	'''
	The sand is added from the middle point
	'''

	grid_status = np.zeros((N, N)) 
	C = 4

	delt_d = [(0, 1), (1, 0), (-1, 0), (0, -1)]
	unstable = []
	for i in range(T):
		grid_status[(N/2, N/2)] += 1

		if grid_status[(N/2, N/2)] >= C:
			unstable.append((N/2, N/2))


		while(len(unstable) > 0):
			_tmp = unstable.pop()
			if grid_status[_tmp] < C:
				continue
			grid_status[_tmp] -= 4
		
			for dd in delt_d:
				if _tmp[0] + dd[0] >= N or _tmp[0] + dd[0] < 0:
					continue
				if _tmp[1] + dd[1] >= N or _tmp[1] + dd[1] < 0:
					continue
				_tmp_cord = (_tmp[0]+dd[0], _tmp[1]+dd[1])
				grid_status[_tmp_cord] += 1

				if grid_status[_tmp_cord] >= C:
					unstable.insert(0, _tmp_cord)
	
	return grid_status



if __name__ == '__main__':
	
	ret = Sandpile(N = 350, T = 100000)
	
	plt.imshow(ret)
	plt.savefig('pic_sandpile.pdf')
	plt.close()
	

︠f292670a-c5c4-4511-aafe-5df3edcf325a︠
-









