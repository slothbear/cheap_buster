about
---

This utility saves money for those who use a feature phone
to access the [NextBus][NextBus] service for bus predictions
via text message.

With the standard system, each prediction costs at least two
text messages: one to NextBus, and one for the reply.

If multiple bus routes serve a stop, even more
text messages are required:

1. *me*: Tell me the predictions for stop **8819**
1. *NextBus*: Do you want route **70** or **70A**?
1. *me*: **70**
1. *NextBus*: buses arrive in **7, 30, and 50** minutes.

Cost: Four text messages. Plus I don't get predictions
for route 70A, which would also work for me.

NextBus does allow you to save a query for future use
(saving us question 2 for the specific route), but
the minimum interaction still requires two text messages.

benefits of Cheap Buster
---

1. costs one text message per query
1. provides predictions for more than one route
1. sends the prediction via email or text message (which is cheaper for you?)

limitations
---

1. pre-registration of your routes is required (no
ad-hoc queries)
1. the service currently runs on a free Heroku dyno; your
response may be delayed while the application wakes.

operation
---
[ *Seven of Nine* says: "elaborate" ]

* call from any phone (probably a feature phone)
* *Google Voice* receives call, sends "missed call" email
* *CloudMailin* translates the email into a POST request
* *Sinatra* application looks up phone number, finds user's bus stops
* query *NextBus* for arrival predictions
* based on user's notification preference:
    * send predictions via email ( *Mandrill/MailChimp* )
    * send predictions via text message ( *Amazon Simple Notification Service* )
    * [ **evaluate**: SNS can do both email and text message, plus HTTP & SQS. Perhaps use it for all notifications? ]

enhancements?
---
* schedule a query for a particular time (instead of calling)

[NextBus]:http://nextbus.com
