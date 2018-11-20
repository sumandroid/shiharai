# README

== README

This is will guide you to startup the project

* clone the repo.

* Rails version -- Rails 5.2.1, Ruby version -- ruby 2.5.1

* I am using mongodb, hence I have removed every reference to active_record from /config folder. You can use any db. 

* Mongodb version -- v3.4.14

* Go to app folder and run bundle to install the gems and dependencies.

* There are no seedings in mongodb hence, run the following commands to seed some data:
	LineItem.create(title: "LED TV", amount: 10000)
	LineItem.create(title: "Refrigerator", amount: 6000)
	User.create(name: "suman saurabh", email: "sumansaurabh93s@gmail.com", phone: 8700191629)

* Boot up your rails server and go to http://localhost:3000/admin/transactions

* Since the project focuses on payments, hence I have skipped the user side modules like cart and checkout system, rather have given the option to create payment from admin
  with the same behaiviour and auth system. 


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
