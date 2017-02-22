API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "instructions": "do stuff",
      "recipe_ingredients_attributes": [
        {
          "quantity": 5.0,
          "ingredient_attributes": {
            "name": "oatmeal",
            "unit": "oz"
          }
        },
        {
          "quantity": 6.0,
          "ingredient_attributes": {
            "name": "super malt extract",
            "unit": "oz"
          }
        }
      ],
      "summary": "A fucking beer",
      "original_gravity": 1.013,
      "final_gravity": 1.104,
      "abv": 5.4,
      "ibu": 50,
      "srm": 17,
      "image_url": "http://i.imgur.com/PKDP9QO.jpg"
    }
  }'

echo
