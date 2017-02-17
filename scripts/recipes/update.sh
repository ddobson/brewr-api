API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "recipe": {
      "final_gravity": 1.150,
      "abv": '"${ABV}"'
    }
  }'

echo
