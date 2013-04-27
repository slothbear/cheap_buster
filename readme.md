about cheap_buster
===

This utility saves money for those who use a feature phone
to access the [NextBus][NextBus] service for bus predictions
via text message.

With the standard system, the prediction costs at least two
text messages: one to NextBus, and one for the reply.

If multiple bus routes serve a stop, then even more
text messages are required:

1. *me*: Tell me the predictions for stop **8819**
1. *NextBus*: Do you want info about route **70** or **70A**?
1. *me*: **70**
1. *NextBus*: buses arrive in **7, 30, and 50** minutes.

Cost: 4 text messages. Plus I don't get predictions for route
70A, which would also work for me.

NextBus does allow you to save a query for future use
(saving us the 70 vs 70A question), but
the minimum interaction still requires two text messages.

cheap_buster provides the following benefits:

1. costs one text message
1. provides predictions for more than one route
1. sends the prediction via email or text message

cheap_buster has these limitations:

1. pre-registration of your routes is required (no
ad-hoc queries)
1. the service currently runs on a free Heroku dyno; your
response may be delayed while the application wakes.

operation
===
[*Seven of Nine* says: "elaborate"]

* phone call
* Google Voice
* CloudMailin
* NextBus
* Mandrill (MailChimp)
* Amazon SNS



[NextBus]:http://nextbus.com