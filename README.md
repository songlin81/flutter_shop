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
          {"image": "http://47.104.244.246:5000/banners/banner1.jpg"},
          {"image": "http://47.104.244.246:5000/banners/banner2.jpg"},
          {"image": "http://47.104.244.246:5000/banners/banner3.jpg"},
          {"image": "http://47.104.244.246:5000/banners/banner4.jpg"},
          {"image": "http://47.104.244.246:5000/banners/banner5.jpg"}
        ],
        "category": [
          {"mallCategoryName": "PC1", "image": "http://47.104.244.246:5000/category/myspace.png"},
          {"mallCategoryName": "PC2", "image": "http://47.104.244.246:5000/category/linkedin.png"},
          {"mallCategoryName": "PC3", "image": "http://47.104.244.246:5000/category/dribble.png"},
          {"mallCategoryName": "PC4", "image": "http://47.104.244.246:5000/category/instagram.png"},
          {"mallCategoryName": "PC5", "image": "http://47.104.244.246:5000/category/google-plus.png"},
          {"mallCategoryName": "PC6", "image": "http://47.104.244.246:5000/category/facebook.png"},
          {"mallCategoryName": "PC7", "image": "http://47.104.244.246:5000/category/twitter.png"},
          {"mallCategoryName": "PC8", "image": "http://47.104.244.246:5000/category/task.png"},
          {"mallCategoryName": "PC9", "image": "http://47.104.244.246:5000/category/reddit.png"},
          {"mallCategoryName": "PC10", "image": "http://47.104.244.246:5000/category/instagram-new.png"},
          {"mallCategoryName": "PC11", "image": "http://47.104.244.246:5000/category/file.png"}
        ]
      }
    }

[5] https://github.com/OpenFlutter/flutter_screenutil

[6] TBA
