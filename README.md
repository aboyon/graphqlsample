## Setting up the environment

Application runs in a Docker container using [Ruby 2.5](https://hub.docker.com/_/ruby/). You can find more information about installed packages looking at the [Dockerfile](Dockerfile).

## Building the environment

```
docker-compose build
```
It will take a while _(as we need to download some packages and install them)_. You can verify if building suceeded by searching an output like this:
```
db uses an image, skipping
redis uses an image, skipping
Building graphqlrails_web
Step 1/11 : FROM ruby:2.5
 ---> 60c3a1518797
Step 2/11 : MAINTAINER David Silveira <jdsilveira@gmail.com>
....
....
Step 10/11 : EXPOSE 3000
 ---> Using cache
 ---> 3c77004cfac5
Step 11/11 : CMD ["bash"]
 ---> Using cache
 ---> 075ae338b705
Successfully built 075ae338b705
Successfully tagged graphql-rails_graphqlrails_web:latest
```

## Verifiying Docker images

Just run `docker images` at your project path. The expected output may look like:
```
REPOSITORY                       TAG                   IMAGE ID            CREATED             SIZE
graphql-rails_graphqlrails_web   latest                075ae338b705        25 hours ago        1.13GB
```

## Setting up the app

At this point, you already have built your container and have your images in place, ready to be used. So. next step is to setup the databases and start the application.

### Setting up database

For development:
```
docker-compose run graphqlrails_web rake db:create db:migrate seed:migrate
```
For testing (Rspec)
```
docker-compose run graphqlrails_web rake db:create db:migrate seed:migrate RAILS_ENV=test
```
And then, run the specs:
```
docker-compose run graphqlrails_web bundle exec rspec spec
```

## Start the container

```
docker-compose up
```

## Miscellaneous

- **Locally**: It's enough to visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql).
- Live demo: [https://graphqlsample.herokuapp.com/](https://graphqlsample.herokuapp.com/)
- [GraphQL gem](https://graphql-ruby.org/)

## Querying the app
### Retrieve all the tasks
```
query {
  tasks {
    name
    status
  }
}
```

### Retrieve only the completed
```
query {
  tasks(status:"pending") {
    name
    status
  }
}
```

### Retrieve scoped to status and user
```
query {
  tasks(status:"pending", userId:1) {
    name
    status
  }
}
```

## Mutations
### Create a task
```
mutation {
  createTask(input:{
    name: "This is a new task",
    projectId:2
  }){
    task{
      name
      status
    }
    errors
  }
}
```

### Update task status
```
mutation {
  updateTask(input: {
    id: 3,
    status:"in_progress"
  }) {
    task {
      name
      status
    }
    errors
  }
}
```

### Trigger validations using invalid statuses
```
mutation {
  updateTask(input: {
    id: 3,
    status:"invalid"
  }) {
    task {
      name
      status
    }
    errors
  }
}
```
