import numpy as np
import random


def sandpile(_nc, _N):
	'''
	_N: number of grid (grid is N by N) 
	_nc: total number of paritcles to add
	
	Assume the particles will be absorbed out of the N by N grid
	'''
	C = 4
	grid = np.zeros((_N, _N))
	delt_d = [(0, 1), (1, 0), (-1, 0), (0, -1)]
	unstable = []

	tops = np.zeros((_nc, 1))
	avg = np.zeros((_nc, 1))


	for i in range(_nc):
		x1 = random.sample(range(_N), 1)[0]
		x2 = random.sample(range(_N), 1)[0]

		grid[x1, x2] += 1

		if grid[x1, x2] >= C:
			unstable.append((x1, x2))

		while(len(unstable) > 0):
			_tmp = unstable.pop()
			if grid[_tmp] < C:
				continue
			grid[_tmp] -= 4
			tops[i] += 1
		
			for dd in delt_d:
				if _tmp[0] + dd[0] >= _N or _tmp[0] + dd[0] < 0:
					continue
				if _tmp[1] + dd[1] >= _N or _tmp[1] + dd[1] < 0:
					continue
				_tmp_cord = (_tmp[0]+dd[0], _tmp[1]+dd[1])
				grid[_tmp_cord] += 1

				if grid[_tmp_cord] >= C:
					unstable.insert(0, _tmp_cord)

		avg[i] = np.mean(grid)


	return (grid, tops, avg)



if __name__ == '__main__':


	z1 = sandpile(100000, 100)
	tops = z1[1]
	avg = z1[2]

	import scipy.stats as stats
	import matplotlib.pyplot as plt
	tops = tops[tops!=0]
	q1 = stats.itemfreq(tops)

	q11 = q1[:, 0]
	q12 = q1[:, 1]

	ind = np.argsort(q11)

	plt.plot(q11[ind], q12[ind], 'b-')
	plt.xlabel('Number of topple')
	plt.ylabel('Frequency')
	plt.xscale('log')
	plt.yscale('log')
	plt.savefig('freq.pdf')
	plt.close()

	plt.plot(avg, 'b-')
	plt.xlabel('Sand Index')
	plt.ylabel('Average number of sand')
	plt.savefig('avg.pdf')
	plt.close()


	#Regression
	x = np.log(q11.copy())
	y = np.log(q12)
	y = y.reshape((-1, 1))
	x = x.reshape((-1, 1))
	A = np.hstack([np.ones(x.shape), -x])
	ret = np.linalg.lstsq(A, y)

	b, a = ret[0]