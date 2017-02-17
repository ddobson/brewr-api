API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/recipes/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "recipe": {
      "final_gravity": 1.150,
      "abv": '"${ABV}"'
    }
  }'

echo
