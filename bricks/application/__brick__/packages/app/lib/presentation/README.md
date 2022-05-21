# Presentation

This layer is all Widgets. With Domain-Driven Design, UI is dumbest part of the app. That's because it's at the boundary of our code and it's totally dependent on the Flutter framework. Its logic is limited to creating "eye candy" for the user. 

So while animation code does belong into this layer, even things like form validation are NOT done inside the presentation layer.