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
          {"image": "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8be2c9a7bf33fcb3ded7104f979f23e7.jpg"},
          {"image": "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4aa0cbfad7de34618c4bebdbdeee4e1.jpg"},
          {"image": "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/755aca9487082e7698e16f17cfb70839.jpg"},
          {"image": "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/2f424f55554befb780ee50a761b2a768.jpg"},
          {"image": "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6bd4174b8c5aad67a64864a5716ad152.jpg"}
        ]
      }
    }

[5] tba