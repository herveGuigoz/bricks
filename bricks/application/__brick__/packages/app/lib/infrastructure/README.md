# Infrastructure

Much like presentation, this layer is also at the boundary of our app. Although, of course, it's at the "opposite end" and instead of dealing with the user input and visual output, it deals with APIs, Firebase libraries, databases and device sensors.

The infrastructure layer is composed of two parts - low-level data sources and high level repositories.

Additionally, this layer holds data transfer objects (DTOs).
DTOs are classes whose sole purpose is to convert data between entities and value objects from the domain layer and the plain data of the outside world.
DTOs can also be serialized and deserialized.

Data sources operate at the lowest level. Remote data sources fit JSON response strings gotten from a server into DTOs, and also perform server requests with DTOs converted to JSON. Similarly, local data sources fetch data from a local database or from the device sensors.

Repositories perform an important task of being the boundary between the domain and application layers and the ugly outside world.

If you need to cache data locally yourself, it's the job of the repository to perform the caching logic and orchestrate putting data from the remote data source to the local one.