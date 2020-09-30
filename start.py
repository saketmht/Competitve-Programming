#Create Codeforces contest directory with sample i/o
#python3 and bs4 library(BeautifulSoup) required

from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
import os


#Get Contest number from stdin
#contest_number = input("Enter contest number : ")

#Get Contest number from environment variable 'CURR'
contest_number = os.environ["CURR"]

my_url = 'https://codeforces.com/contest/' + str(contest_number)

#send request and establish connection
uClient = uReq(my_url)
page_html = uClient.read()
uClient.close()  #close connection

#html parsing
page_soup = soup(page_html, "html.parser")
containers = page_soup.findAll("td", {"class":"id"})


curr_dir = os.getcwd() + '/' + str(contest_number)

#Create a directory with the contest name
if not os.path.exists(curr_dir):
	os.mkdir(curr_dir)
else:
	print("File Already Exists")
	exit()

curr_prob = 'A'

#iterate through all the problems starting from A
for container in containers:
	print("Loading Problem " + curr_prob + "...\n")
	problem_url = 'https://codeforces.com' + container.a["href"]

	#request connection
	uClient1 = uReq(problem_url)
	page_html1 = uClient1.read()
	uClient1.close()  #close connection

	page_soup1 = soup(page_html1, "html.parser")

	containers_input = page_soup1.findAll("div", {"class":"input"})
	containers_output = page_soup1.findAll("div", {"class":"output"})
	

	# print(problem_url)
	prob_dir = curr_dir + '/' + curr_prob
	if not os.path.exists(prob_dir):
		os.mkdir(prob_dir)
	else:
		print("File Already Exists")
		exit()

	#create soln.cpp
	soln = prob_dir + '/' + curr_prob + '.cpp'
	f1 = open(soln, "w")

	#uncomment the following to load soln.cpp with predefine template, provide actual path for template instead of 
	#path/cpp_template.cpp

	#with open("path/cpp_template.cpp", "r") as f:
	#	for line in f:
	#		f1.write(line)

	f1.close()
	
	#iterate over the number of i/o samples
	for i in range(1, len(containers_input) + 1):
		file_in = prob_dir + '/' + "in" + str(i)
		file_out = prob_dir + '/' + "out" + str(i)
		
		#create input and output files
		f = open(file_in, "w")
		f1 = open(file_out, "w")

		#get the i/o text
		sample_int = containers_input[i-1].pre.get_text(strip=True, separator="\n")
		sample_out = containers_output[i-1].pre.get_text(strip=True, separator="\n")

		#print(containers_input[i-1].pre.get_text(strip=True, separator="\n"))
		#print(containers_output[i-1].pre.get_text(strip=True, separator="\n"))

		#write to file
		f.write(sample_int + "\n")
		f1.write(sample_out + "\n")
		f.close()
		f1.close()

	curr_prob = chr(ord(curr_prob) + 1) 
	print()
print("Finished Loading Problems")
