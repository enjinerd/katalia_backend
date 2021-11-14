# Linr backend

built with Go + MySQL

## API Reference

#### Get all snippets

```http
  GET /api/snippets
```

| Parameter  | Type     | Description                 |
| :--------- | :------- | :-------------------------- |
| `username` | `string` | **Required**. Your Username |
| `password` | `string` | **Required**. Your Password |

#### Get snippet

```http
  GET /api/snippets/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

## Authors

- [@enjinerd](https://www.github.com/enjinerd)

## Demo

[Project Preview](https://linr.ron.my.id)
