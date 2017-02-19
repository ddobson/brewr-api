API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes/"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "user_id": 1,
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
