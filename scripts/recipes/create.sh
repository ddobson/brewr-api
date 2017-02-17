API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes/"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "user_id": 1,
      "instructions": "do stuff",
      "ingredients": "water and other things",
      "summary": "A fucking beer",
      "original_gravity": 1.013,
      "final_gravity": 1.104,
      "abv": 5.4,
      "ibu": 50,
      "srm": 17
    }
  }'

echo
