︠24033579-7939-4095-9237-197609f40195︠

︠048e8c33-6367-47f0-b395-e97c5a848b57i︠
%md
# Markov chains

For my project I've written code for a 'Markov chain' class in sage. All of the code is contained in the 'Markov\_chain.sage' file in this directory. I've written various functions for performing operations relating to Markov chains, as well as for retrieving important information about them. These are the functions I have implemented, and they all have docstrings and several doctests as well:

1. \_\_init\_\_ : intialize from a matrix, option for naming the chain's states
2. \_\_repr\_\_: simply returns a string of the transition matrix for the chain
3. states: returns a list of the names of the states, if one was given, can be used to change names as well
4. absorbing states: returns states that move to themselves with probability = 1
5. transient states: returns states that die out as one moves through the mc
6. recurrent states: retuns states that do not die out
7. is\_ergodic: returns false if there are any transient states
8. steady states: returns the eventual probabilities of each state, option for retrieving only a particular state
9. n-step: returns a matrix of probabilities for moving from state i to state j in n transitions, options to get probabilities given an initial distribution, or for a specific movement
10. mean\_first\_passage: returns a matrix of the average times it takes to move from state i to state j
11. sample: creates a random movement between states in the markov chain for a specified number of steps, option to specify an initial state
12. first\_passage: simulates the number of steps to reach a final state from an initial state

I've included several examples of each function for different kinds of matrices of different sizes in this worksheet as well
︡609ba406-ba75-491a-b0a0-798cbc61b540︡{"html":"<h1>Markov chains</h1>\n\n<p>For my project I&#8217;ve written code for a &#8216;Markov chain&#8217; class in sage. All of the code is contained in the &#8216;Markov_chain.sage&#8217; file in this directory. I&#8217;ve written various functions for performing operations relating to Markov chains, as well as for retrieving important information about them. These are the functions I have implemented, and they all have docstrings and several doctests as well:</p>\n\n<ol>\n<li>__init__ : intialize from a matrix, option for naming the chain&#8217;s states</li>\n<li>__repr__: simply returns a string of the transition matrix for the chain</li>\n<li>states: returns a list of the names of the states, if one was given, can be used to change names as well</li>\n<li>absorbing states: returns states that move to themselves with probability = 1</li>\n<li>transient states: returns states that die out as one moves through the mc</li>\n<li>recurrent states: retuns states that do not die out</li>\n<li>is_ergodic: returns false if there are any transient states</li>\n<li>steady states: returns the eventual probabilities of each state, option for retrieving only a particular state</li>\n<li>n-step: returns a matrix of probabilities for moving from state i to state j in n transitions, options to get probabilities given an initial distribution, or for a specific movement</li>\n<li>mean_first_passage: returns a matrix of the average times it takes to move from state i to state j</li>\n<li>sample: creates a random movement between states in the markov chain for a specified number of steps, option to specify an initial state</li>\n<li>first_passage: simulates the number of steps to reach a final state from an initial state</li>\n</ol>\n\n<p>I&#8217;ve included several examples of each function for different kinds of matrices of different sizes in this worksheet as well</p>\n"}︡
︠f2733747-7410-4abf-b1bb-de60e8e3ed26︠

︠759bfec1-5768-4672-bd79-560da62e1ab9︠
#important, code will not run without running this command first
load("Markov_chain.sage")
︡2f0584cd-5660-4e6c-bfd3-c9e55e855866︡
︠0587c03c-2c6b-44c5-a64c-a37bac180fba︠
mc1 = Markov_chain([[1/3,1/3,1/6,1/6],[1/2,1/2,0,0],[0,0,1/2,1/2],[0,0,0,1]])
mc2 = Markov_chain([[.5,.4,.1,0],[0,0,.1,.9],[.3,.2,0,.5],[.5,0,0,.5]],["a", "b", "c", "d"])
n = 20
a = random_matrix(RR,n,n)
for i in range(n):
    for j in range(n):
        if a[i,j] < 0:
            a[i,j] = 0
    a[i]=a[i]/sum(a[i])
mc3 = Markov_chain(a)
︡2ba63a4a-1b63-4266-9b01-d1f22c733e37︡
︠53b8f255-1b30-417c-a576-f0f2baf8c4a9︠
mc1
︡c3978bf2-d325-4f2d-acf7-32e9b8defada︡{"stdout":"[0.333333333333333 0.333333333333333 0.166666666666667 0.166666666666667]\n[0.500000000000000 0.500000000000000 0.000000000000000 0.000000000000000]\n[0.000000000000000 0.000000000000000 0.500000000000000 0.500000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  1.00000000000000]\n"}︡
︠739c63ae-d60f-4f43-a485-32b65d43b8c5︠
mc2.states()
︡e29c0aa3-1c26-47c5-81b4-a1533525b1cd︡{"stdout":"['a', 'b', 'c', 'd']\n"}︡
︠3223591f-c937-4bb1-bbca-2ced1ea5dc9d︠
mc1.states()
︡adf8e304-81f7-4f33-85cd-39751d0a5d1a︡
︠aeca33cb-2295-4404-af8b-3b43eed20e08︠
mc1.states(["bob","joe","tim","fran"])
mc1.states()
︡036acae8-8a99-484f-8c5b-6a279a739ca2︡{"stdout":"['bob', 'joe', 'tim', 'fran']\n"}︡
︠c0232c4b-bd11-41e1-b196-fa747c82f337︠
mc1.absorbing_states()
mc3.absorbing_states()
︡774cc9ed-bd59-4d66-b155-dba52c5790b3︡{"stdout":"['fran']\n"}︡{"stdout":"[]\n"}︡
︠c37beaff-53f8-4f97-8470-ed251c3d27f1︠
mc1.transient_states()
mc3.transient_states()
︡7a36b8b7-0e8d-40d9-85fb-4ee8754a3e18︡{"stdout":"['bob', 'joe', 'tim']\n"}︡{"stdout":"[]\n"}︡
︠40473f96-2082-4f6f-9a86-a10f3dfe4326︠
mc1.recurrent_states()
mc3.recurrent_states()
︡6ec85885-9caa-49ef-ba4f-ce034e700aa2︡{"stdout":"['fran']\n"}︡{"stdout":"[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]"}︡{"stdout":"\n"}︡
︠5e1ae57b-bfb5-4f70-a7a3-f6fee4b2af43︠
mc3.is_ergodic()
mc1.is_ergodic()
︡7d54d09b-7901-4ae7-a3d4-aaaf69511f76︡{"stdout":"True"}︡{"stdout":"\n"}︡{"stdout":"False\n"}︡
︠dad819d1-a287-48d5-b9eb-4a1cd6931eb0︠
mc3.steady_states()
︡99564af9-b8b3-4401-9cc6-66c5cd91fac6︡{"stdout":"(0.0343623410558348, 0.0522431030441112, 0.0720561084100649, 0.0522996629818287, 0.0398892955123611, 0.0617340377581806, 0.0453493906078076, 0.0983425668367166, 0.0528355982096632, 0.0475677582815037, 0.0487409036888621, 0.0618318957476046, 0.0365318148491690, 0.0131394148687594, 0.0431927236109426, 0.0482388833168929, 0.0462483259153933, 0.0525603529079498, 0.0636876179581134, 0.0291482044382405)\n"}︡
︠dfa5777c-3199-483a-abb3-b847895eefbe︠
mc2.steady_states("b")
︡7c8ce162-2e3f-4430-b49b-4012951b908c︡{"stdout":"0.172413793103448\n"}︡
︠90ae552c-50bc-4583-8a3e-36700ae70935︠
mc1.n_step(5)
︡39fdb701-e94f-4ce0-b6ef-8bace11717ef︡{"stdout":"[ 0.160751028806584  0.160751028806584 0.0803755144032922  0.598122427983539]\n[ 0.241126543209877  0.241126543209877  0.104938271604938  0.412808641975309]\n[ 0.000000000000000  0.000000000000000 0.0312500000000000  0.968750000000000]\n[ 0.000000000000000  0.000000000000000  0.000000000000000   1.00000000000000]\n"}︡
︠882eb83a-b0bf-48b2-91ad-85b93f9dd89d︠
mc2.n_step(10, [.3,.3,.3,.1])
︡c8daa738-99c8-4fd5-9925-aa8221759c2e︡{"stdout":"(0.402224801520000, 0.172360651040000, 0.0574674172800000, 0.367947130160000)\n"}︡
︠1bacea13-4f81-41eb-96e0-9d73734d97c3︠
mc3.n_step(3, frm=10,to=3)
︡224a7531-5e65-4fb7-94a5-9bfec8587933︡{"stdout":"0.0515920840421871\n"}︡
︠5aa02fe7-5298-45f5-b3ac-f707c373b93c︠
mc1.mean_first_passage()
︡c8a2686e-86f4-4a9b-acb9-3fb717841dfb︡{"stdout":"[0.000000000000000 0.000000000000000 0.000000000000000  6.00000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  8.00000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  2.00000000000000]\n[0.000000000000000 0.000000000000000 0.000000000000000  1.00000000000000]\n"}︡
︠0874cca0-6f70-43e3-93ba-0db030362015︠
mc2.mean_first_passage()
︡b25fef3e-af71-41e3-86ed-2526b17d64cb︡{"stdout":"[2.48571428571429 2.85714285714286 15.1428571428571 3.43750000000000]\n[3.06122448979592 5.80000000000000 16.4285714285714 1.22767857142857]\n[2.61224489795918 4.28571428571429 17.4000000000000 2.27678571428571]\n[2.00000000000000 4.85714285714286 17.1428571428571 2.71875000000000]\n"}︡
︠f9d5bbc0-035a-44b0-8e2e-8e6a2b830140︠
mc3.mean_first_passage(3,18)
︡075c4897-4d29-4ed0-8566-fb345d5ce757︡{"stdout":"17.1218624844412"}︡{"stdout":"\n"}︡
︠ea5e2ed4-da64-4554-a93d-62d1ee653eac︠
mc1.sample(10, "bob")
︡c91cc002-acbb-4a56-a8dc-5e1994969603︡{"stdout":"['bob', 'joe', 'bob', 'bob', 'bob', 'bob', 'bob', 'bob', 'bob', 'bob']\n"}︡
︠1dfb3a88-6983-4694-a038-291dfb55c08e︠
mc2.sample(5)
︡f543620a-5994-46ad-a1b8-2d6d6dc7ff26︡{"stdout":"['a', 'a', 'b', 'c', 'b']\n"}︡
︠b6ded5f0-5ab4-4db8-b8b4-b2891ac73be9︠
mc3.sample(50)
︡e16277ec-d62e-493c-8c60-e0c39a137368︡{"stdout":"[6, 2, 2, 0, 18, 12, 15, 7, 9, 11, 17, 0, 6, 3, 7, 16, 1, 5, 15, 12, 13, 6, 8, 7, 1, 18, 6, 4, 0, 8, 13, 2, 8, 7, 2, 7, 5, 7, 9, 3, 16, 18, 4, 11, 3, 8, 9, 7, 2, 8]"}︡{"stdout":"\n"}︡
︠8cde1ce2-5e23-4298-a16a-31feb2c14a5e︠
mc2.first_passage("b","c")
︡368cd4b0-b463-4373-80d6-b63505efefe8︡{"stdout":"19\n"}︡
︠05c3d7ac-f873-43b7-b316-4f671f0abb81︠
mc3.first_passage(10,3)
︡c83d2a51-1b7b-4cbf-afaf-c8d2c1b477f5︡{"stdout":"2"}︡{"stdout":"\n"}︡
︠0b8aa44b-2226-4e75-a8f4-ce9843884ddd︠









