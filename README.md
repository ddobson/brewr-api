## Brew API

Client App: https://ddobson.github.io/brewr/
Client Source: https://github.com/ddobson/brewr

All recipe resources are protected and require a token.

### Resources

##### Recipes

| Verb | URL Pattern | Controller |
|--|--|--|--|
| GET | `/recipes` | `recipes#index` |
| GET | `/recipes/:id` | `recipes#show` |
| POST | `/recipes` | `recipes#create` |
| PATCH | `/recipes/:id` | `recipes#update` |
| DELETE | `/recipes/:id` | `recipes#destroy` |

#### Users

| Verb | URL Pattern | Controller |
|--|--|--|--|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| DELETE | `/sign-out/:id`        | `users#signout`   |
| PATCH  | `/change-password/:id` | `users#changepw`  |

### Create and updating data

The following is valid JSON for creating a recipe with ingredients. For more information on how to structure requests see the `/scripts` directory.

```
'{
  "recipe": {
    "name": "A beer",
    "instructions": "do stuff",
    "recipe_ingredients_attributes": [
      {
        "quantity": 5.0,
        "ingredient_attributes": {
          "name": "oatmeal",
          "unit": "ounce"
        }
      },
      {
        "quantity": 6.0,
        "ingredient_attributes": {
          "name": "super malt extract",
          "unit": "ounce"
        }
      }
    ],
    "summary": "The world's best beer.",
    "original_gravity": 1.013,
    "final_gravity": 1.104,
    "abv": 5.4,
    "ibu": 50,
    "srm": 17,
    "image_url": "http://i.imgur.com/PKDP9QO.jpg"
  }
}'
```
