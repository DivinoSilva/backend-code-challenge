## Overview

Your goal is to develop a system to calculate the shipping cost for products of an order, based on it's weight and distance from origin to destination. The distribution points will be supplied to this system throught an API and the shipping cost will be calculated in another API, always aiming at the lowest cost to the customer.

To populate the database, another system will call the API informing the distance (in kilometers) between *origin* and *destination* of two distribution points. For example:
```
POST /distance
A B 10
```
```
POST /distance
B C 15
```
```
POST /distance
A C 30
```

In a second moment, the shopping system will call the API informing the total weight of the order, the source and destination points. The system should return the lowest shipping cost, using the formula: `cost = distance * weight * 0.15`. For example:

```
GET /cost?origin=A&destination=C&weight=5
18.75
```

Explanation: the shortest path from A to C is A -> B -> C = 25km. `cost = 25 * 5 * 0.15 = 18.75`

## Considerations

* The input format of distance should have the format `A B X`, where *0 < X <= 100000*. Wrong format or data should return an error;
* If a distance point already exists, should be replaced with the new value;
* The cost API should validate the given points and weight, where *0 < wheight <= 50*. If no path was found between *origin*  and *destination*, an error should be returned;
* The solution should be implemented in Ruby or Elixir. You could use the frameworks that you're most used to.
* Both APIs will receive a large amount of requests: choose the design and technology wisely;

## How to run

* Dependences
```
postgresql
```


See it in production here or:

* Clone repo locally
```
 git clone https://github.com/DivinoSilva/backend-code-challenge.git
```

* Navigate to the local repo folder (You might be there already if you're reading this)

* In the command line, run bundle to install any gems you might be missing
```
 bundle
```

* Create database and run migrate
```
 bundle exec rake db:{create,migrate}
```

* Run rails s
```
 bundle exec rails s -p 3000
```
* Open up a browser to localhost:3000


## License

We have licensed this project under the MIT license so that you may use this for a portfolio piece (or anything else!).
