# Topic-Modelling-of-Building-Related-Injuries

A time-series analysis of the main themes related to building injuries.


##Data and Methods

All incidents with one or more injuries from January 2007 through October 2016.

Total of 4839 incidents with injuries. 

Text that briefly describes the incident.

Method: Topic modelling, an unsupervised machine learning algorithm, used to uncover main themes in the text.

The method automatically develops “topics” from the text.

##Results

92% of the incidents were classified into 20 topics, 8% of the incidents could not be classified.

The 20 topics fit into 2 main categories:

1. Workers injured on the job, i.e. worker falling from structure, cuts to body, heart attack, etc. The titles of all of these topics begin with “worker”.

2. Building related incidents – Partial building collapse, vehicle hitting building, falling debris, etc.

##Quality Control

Topic modelling is good at finding themes in text, but has issues with accuracy:

1. Sometimes text not classified properly

2. Topics can be ambiguous

Accuracy Improvement: Top words created by the algorithm for each topic were used as key words in an algorithm I developed to recode the text
Algorithm developed in python.
Key words were grouped and used conditionally to code the text according to the key words in the topic.
Increased accuracy.

When text was recoded, tested the quality of algorithm by drawing sample and checking accuracy.

When error found, tweaked the algorithm to improve accuracy.

Implemented automatic spell corrector on misspelled words, improved accuracy by about 10%




