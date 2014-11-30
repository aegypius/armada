FORMAT: 1A

# Armada API

# Group Applications

# Applications collection [/applications]

# List applications [GET]

  - Response 200 (application/json)

  ```json
    [
      {
        "name":     "silly-sam",
        "status":   "up",
        "scalable": true
      },
      {
        "name":     "moody-ann",
        "status":   "down",
        "scalable": false
      }
    ]
  ```

#
