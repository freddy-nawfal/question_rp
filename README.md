# question_rp
A first-login form with questions about roleplay for GTA 5 FiveM Server

## Installation

* download/clone the repository into your server
* change the values in the config file to match you server credentials
* execute the sql.sql file in your database
* rename folder "antirpquestion"
* add "- antirpquestion" in the citmp-server.yml
* Enjoy !

## Add you questions

* Go to html/questions.js
* Add your questions like so: 
```
       {question : "your question here",
        propositionA : "Choice A",
        propositionB : "Choice B",
        propositionC : "Choice C",
        propositionD : "Choice D",
        reponse : "B"}, // here put the correct answer
```

* In html/scripts.js you can modify the following variables:
```
  var nbQuestionToAnswer = 10; // Number of questions to answer
  var nbAnswerNeeded = 8; // Number of right answers to pass the test
  var nbPossibleQuestions = 15; //number of questions in questions.js
  ```
