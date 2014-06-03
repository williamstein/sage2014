︠47bc53ec-7b96-4397-999b-053a909dc626︠
"""
Matt Butts
MATH 480 Project
Parallel Stock Covariance/Variance Calculator



Part 1. 
My Parallel Covariance Calculator Program
Part 2. 
Typical Approach to Covariance Calculation
Part 3. 
Demonstration of the Algorithm Speed Differences



NOTE: All cells must be compiled for program to work!

This sage work sheet demonstrates my program and it's efficiency compared to 
typical methods of calculating covariance between lists of stock returns.

Basic Breakdown of My Algorithm: 
It starts with the "initializer_module", where you can specify a file name and based on an input boolean whether or not results will be printed. 
This function calls "process_file" which processes the file into lists, or lists of lists, of stock returns
Then "parallel_compute_chunks" utilizes the function "compute_chunk" to make the time-expensive calculations in parallel
Then "assemble_subsets" takes the data from all of the seperate subsets of the lists and compiles them back together.
"standardized_calculations" returns the correlation and standard deviation based on the covariance and variance
Finally, all of the data is compiled and calculated.


PROJECT - Code Portion
      PART 1
"""

︡1ab9826a-ef6d-492e-9f87-a8595152a20a︡{"stdout":"'\\nMatt Butts\\nMATH 480 Project\\nParallel Stock Covariance/Variance Calculator\\n\\n\\n\\nPart 1. \\nMy Parallel Covariance Calculator Program\\nPart 2. \\nTypical Approach to Covariance Calculation\\nPart 3. \\nDemonstration of the Algorithm Speed Differences\\n\\n\\n\\nNOTE: All cells must be compiled for program to work!\\n\\nThis sage work sheet demonstrates my program and it\\'s efficiency compared to \\ntypical methods of calculating covariance between lists of stock returns.\\n\\nBasic Breakdown of My Algorithm: \\nIt starts with the \"initializer_module\", where you can specify a file name and based on an input boolean whether or not results will be printed. \\nThis function calls \"process_file\" which processes the file into lists, or lists of lists, of stock returns\\nThen \"parallel_compute_chunks\" utilizes the function \"compute_chunk\" to make the time-expensive calculations in parallel\\nThen \"assemble_subsets\" takes the data from all of the seperate subsets of the lists and compiles them back together.\\n\"standardized_calculations\" returns the correlation and standard deviation based on the covariance and variance\\nFinally, all of the data is compiled and calculated.\\n\\n\\nPROJECT - Code Portion\\n      PART 1\\n'\n"}︡

︠420f5805-8ea9-4f8a-89ce-0dc7967ef328︠

︠a2c2010b-791e-43a8-b35a-b968c2ce5a12︠
def initializer_module(file_path, print_stats, save_stats):
    """
    This is used to run my program. The file given
    
    INPUTS:
    -file_path-- string that represents a file path of the .csv file you want to use. 
                 It can be a relative path if it is in the same directory, otherwise use absolute.
    -print_stats-- a boolean that indicates whether or not to print statistics
    -save_stats-- a boolean that indicates whether or not to save statistics
    OUTPUTS:
    There is no output. If you pass True to print_stats then a dictionary of statistics will be printed. 
    
    The key values in the dictionary that is printed and saved will correspond to:
    -covXY-- covariance of the data sets, X and Y
    -corrXY-- correlation of the data sets, X and Y
    -deltaX-- delta coefficient of the data set X
    -deltaY-- delta coefficient of the data set Y
    -meanX-- mean/average of the data set X
    -meanY-- mean/average of the data set Y
    -varX-- variance of the data set X
    -varY-- variance of the data set Y
    -nX-- data points in the data set X
    -nY-- data points in the data set Y
    -std_devX-- standard deviation of the data set X
    -std_devY-- standard deviation of the data set Y
   
    Examples:
    intializer_module("sample_data.csv", True, False)
    
    According to data in the file: sample_data.csv
"The statistical co-moments and moments for Stock X and Stock Y are represented in the following dictionary:
{'covXY': 0.03049275744530942, 'deltaX': 0.041925928096000015, 'deltaY': 0.07980310639199997, 'meanX': 0.025510226601999992, 'meanY': 0.041252644851999976, 'varX': 1.0394538279409518, 'nX': 1000.0, 'nY': 1000.0, 'corrXY': 0.03241282585251209, 'std_devY': 0.9227354415960605, 'std_devX': 1.0195360846683905, 'varY': 0.8514406951774768}"
        
    intializer_module("sample_data.csv", False, True)
    "Your data output has been saved to the file:
    Stock_Statistics_for_sample_data.csv"

    intializer_module("sample_data.csv", False, False)
    """
    list_divisions = 4
    X_n, Y_n = process_file(file_path, list_divisions)
    stats_dict = parallel_compute_chunks(X_n, Y_n)
    stats_dict = standardized_calculations(stats_dict)
    output = list([str(), str(), str()])
    output_1 = "According to data in the file: " + file_path + "\n"
    output_2 =  "The statistical co-moments and moments for Stock X and Stock Y are represented in the following dictionary: \n"
    output_3 =  str(stats_dict)
    output = output_1 + output_2 + output_3
    output_name = 'Stock_Statistics_for__' + file_path + '.txt'
    if(save_stats == True):
            text_results = open(output_name, "w")
            text_results.write(output)
            text_results.close()
            print "Your data output has been saved to the file:"
            print "Stock_Statistics_for_" + file_path + "\n"
    if (print_stats == True):
            print output
︡533beee0-c9cf-429c-afbc-1441068fc382︡
︠391ba33a-1990-4ae4-94db-0a0e279c5f3a︠
import pandas as reader

def process_file(file_path, subsets):
    """
    This function reads a file path to a CSV file and processes the data. The data is stored in lists of daily stock returns
    for the respective stocks. Then the lists are divided into subsets of equal, or near equal length.
    INPUT:
    A string file path
    An integer representing the number of list divisions
    OUTPUT:
    Two Lists of Lists
    """
    column_stocks = reader.read_csv(file_path)
    stock_1 = list(column_stocks["STOCK 1"])
    stock_2 = list(column_stocks["STOCK 2"])
    check = (len(stock_1) == len(stock_2))
    if check == False:
        print "CSV File of Incorrect Format Different Number of Returns for Each Stock"
    if subsets == 1:
        return stock_1, stock_2
    subset_elements = len(stock_1)//subsets
    extra_elements = len(stock_1) % subsets
    X = list()
    Y = list()
    tempX = list()
    tempY = list()
    for i in range(subsets - 1):
        for j in range(subset_elements):
            tempX.append(stock_1[i*subset_elements + j])
            tempY.append(stock_2[i*subset_elements + j])
        X.append(tempX)
        Y.append(tempY)
        tempX = list()
        tempY = list()
    for k in range(subset_elements - extra_elements):
        tempX.append(stock_1[len(stock_1) - k - 1])
        tempY.append(stock_2[len(stock_1) - k - 1])
    X.append(tempX)
    Y.append(tempY)
    return X, Y
︡7884bf8f-e069-45d2-af3b-d907f1dee00b︡
︠40e1b102-3453-49ff-8d10-e9fe2a64ea29︠
def parallel_compute_chunks(X_n, Y_n):
    """
    This function takes as input two lists of lists of stock returns.
    Then a helper function calculates, in parallel, statistical moments and co-moments
    Then another helper function assembles the block (chunk) calculations to calculations that represent the entire data set
    INPUT:
    Two Lists of Lists
    OUTPUT:
    A dictionary
    """
    t = walltime()
    chunk_data = list(compute_chunk(zip(X_n, Y_n)))
    chunk_list_dict = list([b for a,b in chunk_data])
    chunk_total = assemble_subsets(chunk_list_dict, 2)
    return chunk_total
︡fceec361-cb1f-4e59-9b37-a679a26ab1d5︡
︠79266700-f863-422f-8096-6d7b16bd4004︠
@parallel
def compute_chunk(X_i, Y_i):
    """
    This function computes the relevant information on each subset of the data in parallel.
    INPUT:
    -X_i-- A partition of the total list; a list
    -Y_i-- A partition of the total list; a list
    OUTPUT:
    -dictionary-- with all of the relevant information for X and Y of that partition of the list, 
    so the information specifally represents the information of X_i, Y_i in one dictionary.
    """
    nX = float(len(X_i))
    nY = float(len(Y_i))
    temp_meanX = float(0)
    temp_meanY = float(0)
    for r in range(len(X_i)):
        temp_meanX += X_i[r]
        temp_meanY += Y_i[r]
    meanX = temp_meanX / nX
    meanY = temp_meanY / nY
    covariance = 0
    for i in range(len(X_i)):
        covariance += (X_i[i] - meanX) * (Y_i[i] - meanY)
    covXY = covariance / (nX - 1)
    varX = variance(X_i)
    varY = variance(Y_i)
    return {'nX': nX, 'nY': nY, 'meanX': float(meanX), 'meanY': float(meanY), 'covXY': float(covXY), 'varX': float(varX), 'varY': float(varY)}
︡8cb6731b-25c2-417f-8fda-c9e7dcc3ddea︡
︠cff591a4-d3ea-49a9-970b-2abcc19890f0︠
def assemble_subsets(all_chunks, assembly_step):
    """
    In reference to my paper, it is the section concerning chunk assembly which uses math proved in Janine Bennett's Paper.
    This is a recursive function that takes the statistical moments/co-moments of the initial four chunks of the total data 
    set and combines them pairwise into two blocks of the total data set. Then the function calls itself again with two 
    chunks of the total data set to again pairwise assemble the moments/co-moments in such a way to represent the entire data set.
    INPUTS:
    -all_chunks-- a list of dictionaries of statistical moment/co-moment data
    -assembly_step-- integer that represents the stage of assembly (used to pair-wise assemble the lists) 
    OUTPUT:
    Recursive function that terminates when "assembly_step" is equal to 1 and is otherwise decremented by 1 in the recursive call.
    When the function terminates it returns a dictionary of statistical calculations representative of the entire data set.
    """
    half_chunks = [dict(), dict()]
    coeff = range(assembly_step)
    for i in range(assembly_step):
        half_chunks[i]['nX'] = all_chunks[(i*2)]['nX'] + all_chunks[(i*2)+1]['nX']
        half_chunks[i]['nY'] = all_chunks[(i*2)]['nY'] + all_chunks[(i*2)+1]['nY']
        half_chunks[i]['meanX'] = ((all_chunks[(i*2)]['nX'] * all_chunks[(i*2)]['meanX']) + (all_chunks[(i*2)+1]['nX'] * all_chunks[(i*2)+1]['meanX'])) / half_chunks[i]['nX']
        half_chunks[i]['meanY'] = ((all_chunks[(i*2)]['nY'] * all_chunks[(i*2)]['meanY']) + (all_chunks[(i*2)+1]['nY'] * all_chunks[(i*2)+1]['meanY'])) / half_chunks[i]['nY']
        half_chunks[i]['deltaX'] = all_chunks[(i*2)+1]['meanX'] - all_chunks[(i*2)]['meanX']
        half_chunks[i]['deltaY'] = all_chunks[(i*2)+1]['meanY'] - all_chunks[(i*2)]['meanY']
        coeff[i] = (((all_chunks[(i*2)+1]['nX']**2)*(all_chunks[(i*2)]['nX'])) + ((all_chunks[(i*2)]['nX']**2)*(all_chunks[(i*2)+1]['nX'])))/((all_chunks[(i*2)]['nX'] + (all_chunks[(i*2)+1]['nX']))**2)
        half_chunks[i]['covXY'] = ((all_chunks[(i*2)]['covXY'] * all_chunks[(i*2)]['nX']) + (all_chunks[(i*2)+1]['covXY'] * all_chunks[(i*2)+1]['nX']) + (((half_chunks[i]['deltaX']) * half_chunks[i]['deltaY']) * (coeff[i])))/(half_chunks[i]['nX'])
        half_chunks[i]['varX'] = ((all_chunks[(i*2)]['nX'] * all_chunks[(i*2)]['varX']) + (all_chunks[(i*2)+1]['varX'] * all_chunks[(i*2)+1]['nX']) + (all_chunks[(i*2)]['nX'] * (all_chunks[(i*2)]['meanX'] - half_chunks[i]['meanX'])**2) + (all_chunks[(i*2)+1]['nX'] * (all_chunks[(i*2)+1]['meanX'] - half_chunks[i]['meanX'])**2))/(all_chunks[(i*2)]['nX'] + all_chunks[(i*2)+1]['nX'])
        half_chunks[i]['varY'] = ((all_chunks[(i*2)]['nY'] * all_chunks[(i*2)]['varY']) + (all_chunks[(i*2)+1]['varY'] * all_chunks[(i*2)+1]['nY']) + (all_chunks[(i*2)]['nY'] * (all_chunks[(i*2)]['meanY'] - half_chunks[i]['meanY'])**2) + (all_chunks[(i*2)+1]['nY'] * (all_chunks[(i*2)+1]['meanY'] - half_chunks[i]['meanY'])**2))/(all_chunks[(i*2)]['nY'] + all_chunks[(i*2)+1]['nY'])
    if assembly_step > 1:
        return assemble_subsets(half_chunks, assembly_step-1)
    else:
        return half_chunks[0]
︡290aaa48-c518-48a7-8088-421d501f8840︡
︠c680b18b-4e74-4f9f-ab4c-56a5ccaee0fa︠
def standardized_calculations(data_dictionary):
    """
    This function calculates standardized values of covariance and variance, namely correlation and standard deviation.
    INPUT:
    A dictionary
    OUTPUT:
    A dictionary
    """
    data_dictionary['std_devX'] = sqrt(data_dictionary['varX'])
    data_dictionary['std_devY'] = sqrt(data_dictionary['varY'])
    data_dictionary['corrXY'] = data_dictionary['covXY']/(data_dictionary['std_devX'] * data_dictionary['std_devY'])
    return data_dictionary


︡6184b999-0a20-4686-9079-48e9266dbe34︡
︠a23b3793-3093-45d6-905f-9a50dd5e072a︠
"""
An approach that doesn't utilize parallel processes and block-assembly (chunk-assembly) calculations.
Calling the method "naive_covariance_variance_approach" with appropriates parameters will run a naive covariance and variance calculation, relying 
on a few simple helper methods.
I will use this to make some time comparisons in part 3.

PROJECT - Code Portion
      PART 2
"""
︡10681e48-705d-4826-bb28-51c0b7852a48︡{"stdout":"'\\nAn approach that doesn\\'t utilize parallel processes and block-assembly (chunk-assembly) calculations.\\nCalling the method \"naive_covariance_variance_approach\" with appropriates parameters will run a naive covariance and variance calculation, relying \\non a few simple helper methods.\\nI will use this to make some time comparisons in part 3.\\n\\nPROJECT - Code Portion\\n      PART 2\\n'\n"}︡
︠c1e56337-d1b0-44ab-9315-b3f9bb9fadd4︠

︠f575c4c2-dd1c-4594-a3a1-086c9ebd9fc2︠
def naive_covariance_variance_approach(file_path, print_results):
    """
    This function performs the same calculations as my program above, except it doesn't perform the calculations
    in parallel.
    INPUTS:
    -file_path-- a string of a relative file path if in the same directory, or an absolute file path otherwise
    -print_results-- a boolean that indicates if results will be printed.
    OUTPUTS:
    No output, but will print information if passed True to the second input parameter
    """
    X_n, Y_n = process_file(file_path, 1)
    nX = float(len(X_n))
    nY = float(len(Y_n))
    covXY = two_pass_covariance(X_n, Y_n)
    varX = naive_variance(X_n)
    varY = naive_variance(Y_n)
    meanX = sum(X_n)/nX
    meanY = sum(Y_n)/nY
    naive_dict = {'nX': nX, 'nY': nY, 'meanX': float(meanX), 'meanY': float(meanY), 'covXY': float(covXY), 'varX': float(varX), 'varY': float(varY)}
    standardized_calculations(naive_dict)
    if print_results == True:
        print "According to data in the file: " + file_path
        print "The statistical co-moments and moments for Stock X and Stock Y are represented in the following dictionary:"
        print naive_dict
        
def naive_variance(data_set):
    """
    This function computes the variance of a data set utilizing no parallel processes.
    INPUT:
    -data_set-- a list of float values that represent in this case stock returns 
    OUTPUT:
    -var-- a float that represents the variance of the list that was passed as input
    """
    n = 0
    data_sum = 0
    sqr_of_sum = 0
    for x in data_set:
        n+= 1
        data_sum+= x
        sqr_of_sum = sqr_of_sum + x**2
    var = (sqr_of_sum - (data_sum**2)/n)/(n - 1)
    return var

def two_pass_covariance(datax, datay):
    """
    This function calculates the covariance of two equal sized lists of data using a two-pass approach
    INPUTS:
    -datax-- list of floats (stock returns)
    -datay-- list of floats (stock returns)
    OUTPUT:
    -covariance-- float of the covariance of the two lists that were passed as input
    """
    n = len(datax)
    meanx = sum(datax)/n
    meany = sum(datay)/n	
    covariance = 0
    for i in range(n):
        x = datax[i] - meanx		
        y = datay[i] - meany
        covariance += x*y / n
    return covariance
︡3c7b82cf-18bb-438e-b1d8-f2fdd2f38c65︡
︠7969e8f4-e69b-4258-a6ec-e3c9bd44dca1︠
"""
I make some time comparisons with data sets and use %timeit to provide some unbiased comparisons.
PROJECT - Code Portion
      PART 3
"""
︠53af8f4d-6c9c-40e8-b4b9-6d5403954a61︠

︠ff81f648-2b15-4893-915a-2a0f7824bf47︠
print "On a list of around 1000 data-points: "
%timeit initializer_module("sample_data.csv", False, False)
%timeit naive_covariance_variance_approach("sample_data.csv", False)
︡e5e3cd41-16c6-41c2-af89-81f60ef3cd2b︡{"stdout":"On a list of around 1000 data-points: \n"}︡{"stdout":"5 loops, best of 3: 60.9 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"25 loops, best of 3: 19.3 ms per loop"}︡{"stdout":"\n"}︡
︠01bd6e7f-f16e-4c19-85cf-ddaf0e98ff6f︠
print "On a list of around 5,000 data-points: "
%timeit initializer_module("sample_data2.csv", False, False)
%timeit naive_covariance_variance_approach("sample_data2.csv", False)
︡69a2f209-b22f-4ff5-a6fd-d3ee3df8a130︡{"stdout":"On a list of around 5,000 data-points: \n"}︡{"stdout":"5 loops, best of 3: 89.9 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"5 loops, best of 3: 88.6 ms per loop"}︡{"stdout":"\n"}︡
︠eae7558a-bc3f-4736-b784-57ba963e8fb8︠
print "On a list of around 50,000 data-points: "
%timeit initializer_module("sample_data3.csv", False, False)
%timeit naive_covariance_variance_approach("sample_data3.csv", False)
︡ed8f3e72-e9b7-4757-9935-c5c671ce3cd1︡{"stdout":"On a list of around 50,000 data-points: \n"}︡{"stdout":"5 loops, best of 3: 232 ms per loop"}︡{"stdout":"\n"}︡{"stdout":"5 loops, best of 3: 897 ms per loop"}︡{"stdout":"\n"}︡
︠3d171b61-88f0-43f6-b259-7d73585b2d26︠
print "On a list of around 100,000 data-points: " 
︡3954e76d-f39d-4cbd-a176-edaef8f47025︡{"stdout":"On a list of around 100,000 data-points: \n"}︡
%timeit initializer_module("sample_data4.csv", False, False)
︡5b174d40-dc49-4e7c-94f8-9b33823c132c︡{"stdout":"5 loops, best of 3: 393 ms per loop"}︡{"stdout":"\n"}︡
%timeit naive_covariance_variance_approach("sample_data4.csv", False)
︡048ba77b-2794-49f1-b545-a684993109cc︡{"stdout":"5 loops, best of 3: 1.76 s per loop"}︡{"stdout":"\n"}︡
︠737dc0f4-bd7a-470a-841b-1b558870d709︠
print "On a list of around 500,000 data-points: " 
︡3774279c-71fc-4e36-a8ff-0ce434a84f29︡{"stdout":"On a list of around 500,000 data-points: \n"}︡
%timeit initializer_module("sample_data5.csv", False, False)

︡9f226e31-dbf6-4b90-ba0b-3c80922e4c32︡{"stdout":"5 loops, best of 3: 1.72 s per loop"}︡{"stdout":"\n"}︡
%timeit naive_covariance_variance_approach("sample_data5.csv", False)

︡3b52984c-323b-4848-b868-bba90c0f610c︡{"stdout":"5 loops, best of 3: 9.02 s per loop"}︡{"stdout":"\n"}︡
︠789e1d9e-4f08-4792-834b-66d600d7fd52︠
print "On a list of around 1,000,000 data-points: " 
︡b41b20d6-d65e-470c-bad7-63f31a3211c3︡{"stdout":"On a list of around 1,000,000 data-points: \n"}︡
%timeit initializer_module("sample_data6.csv", False, False)
︡a23f2ee8-3826-4441-ab88-6d344ad845c3︡{"stdout":"5 loops, best of 3: 3.37 s per loop"}︡{"stdout":"\n"}︡
%timeit naive_covariance_variance_approach("sample_data6.csv", False)
︡da5163c4-a7e6-43a3-bf8c-df71c935395c︡{"stdout":"5 loops, best of 3: 17.8 s per loop"}︡{"stdout":"\n"}︡
︠08b2fd19-dae1-4bb4-9017-bbdafed03f0f︠









