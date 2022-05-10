# Domain

The domain layer is the pristine center of an app. It is fully self contained and it doesn't depend on any other layers. Domain is not concerned with anything but doing its own job well.

This is the part of an app which doesn't care if you switch from Firebase to a REST API or if you change your mind and you migrate your database.

Because domain doesn't depend on anything external, changes to such implementation details don't affect it. 

On the other hand, *all the other layers do depend on domain*.

So, what exactly goes on inside the domain layer? This is where your business logic lives, everything which is not packages/server/device dependent goes into domain. This includes:

- *Validating data* and keeping it valid with ValueObjects.
- *Transforming data*.
- *Grouping* and *uniquely identifying data* that belongs together through Entity classes.
- *Performing complex business logic* - this is not necessarily always the case in client Flutter apps, since you should leave complex logic to the server. Although, if you're building a truly serverless 😉 app, this is where you'd put that logic.

In addition to all this, the domain layer is also the home of Failures.
