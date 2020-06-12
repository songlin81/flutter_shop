[1] Get http://zjg5l.mocklab.io/storecheck?name=123
    /storecheck?name=123

    {
      "success": true,
      "data": {
        "name": "{{request.query.name}}"
      }
    }

[2] Post http://zjg5l.mocklab.io/storecheck
    {
      "name": "123"
    }

    {
      "success": true,
      "data": {
        "name": "123"
      }
    }

[3]