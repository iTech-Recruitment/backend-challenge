
#### Goal of the task
Documentation (http://18.130.116.85/) specifies 4 endpoints - 3 of them provide raw data:
- ```recipes/raw```
- ```instructions/raw```
- ```ingredients/raw```

Solution should consume those 3 endpoints and expose own under ``/`` path, that will be consistent with the 4th endpoint described in the documentation (```/recipes```). 
It should also take form-data attributes ```offset``` and ```limit``` and respond with a payload identical to the one provided in the documentation.

Sample benchmark API call can be found in the ```benchmark.php``` file.

#### Guidelines and restrictions
Please do not use any frameworks for this solution. You can use simple libraries like Guzzle though (already included in composer config). 
When working with GIT, please assume you're working in a team on this project.

#### What will be evaluated:
- accuracy of the exposed endpoint - it needs to resemble the benchmark
- good OOP practices - (e.g. SOLID principles)
- good general coding practices – following standards, using design patterns (either OOP or functional paradigm, KISS, DRY etc.)
- proper error handling
- code readability and consistency of syntax
- ability of not to rely on framework to achieve the above
- tests – both automated testing and how easy it is to write them for the presented code

We appreciate that you might have limited time capacity for attempting this solution. It is ok to do as much as you can - this stage will be followed by a live coding session where you will be able to walk us through your solution, explain your approach, what would your potential next steps be and code live any gaps that it might have.

#### Additional notes
- This environment runs on Ubuntu 16.04 LTS which with PHP 7.0.
- The solution will consume the API that can be found and is documented at http://18.130.116.85/
- Scoring script will run ```composer install```
- Scoring script can give up to 50% score - rest of the points will be given based on the live coding session by the reviewer.
- Scoring script will attempt to run default call, call with random parameters, and a call with parameters going outside of data range.

Good luck! :)
