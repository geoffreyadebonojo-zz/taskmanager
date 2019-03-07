# README

TaskManager is less about managing tasks than managing resources

* Built using Ruby 2.4.3 on Rails 5.2.2


API Documentation

The Graphql API 

```
{
  allTopics {
    id
    name
  }
}
```

returns
```
{
  "data": {
    "allTopics": [
      {
        "id": "1",
        "name": "GraphQL server"
      },
      {
        "id": "2",
        "name": "GraphQL on Rails"
      },
      {
        "id": "3",
        "name": "How do you fetch GraphQL API with Javascript?"
      },
      {
        "id": "4",
        "name": "Basic GraphQL CRUD"
      }
    ]
  }
}
```

Topics can be connected to other topics in a parent-child relationship. 

```
{
  topic(id: 1) {
    id
    name
    ancestors {
      id
    }
    children {
      id
    }
  }
}
```

returns

```
{
  "data": {
    "topic": {
      "id": "1",
      "name": "GraphQL server",
      "ancestors": [
        {
          "id": "1"
        }
      ],
      "children": [
        {
          "id": "2"
        },
        {
          "id": "3"
        },
        {
          "id": "4"
        }
      ]
    }
  }
}
```