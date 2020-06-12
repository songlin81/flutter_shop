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

[3] F12 -> XHR to get Http Request and Copy link address:
    https://time.geekbang.org/serv/v1/column/newAll

[4] Post http://zjg5l.mocklab.io/wxmini/homePageContent
    formData = {'lon':'115.02932', 'lat':'35.76189'}

    {
      "data": {
        "slides": [
          {"image": "https://raw.githubusercontent.com/songlin81/flutter_shop/master/images/1.jpg"},
          {"image": "https://raw.githubusercontent.com/songlin81/flutter_shop/master/images/2.jpg"},
          {"image": "https://raw.githubusercontent.com/songlin81/flutter_shop/master/images/3.jpg"},
          {"image": "https://raw.githubusercontent.com/songlin81/flutter_shop/master/images/4.jpg"}
        ]
      }
    }

[5]