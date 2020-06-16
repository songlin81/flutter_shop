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

[3] F12 -> XHR to get Http Request and Copy link address: https://time.geekbang.org/serv/v1/column/newAll

[4] Post http://47.104.244.246:5000/homePageContent
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
        ],
        "adPicture": {"Picture_Address": "http://47.104.244.246:5000/adbanners/adbanner1.jpg"},
        "shopInfo": {"contactImage": "http://47.104.244.246:5000/shopinfo/contact.jpg", "contactPhoneNumber": "10010"},
        "recommend": [
            {"mallPrice":"10", "Price":"100", "image": "http://47.104.244.246:5000/products/engine1.jpg"},
            {"mallPrice":"20", "Price":"200", "image": "http://47.104.244.246:5000/products/engine2.jpg"},
            {"mallPrice":"30", "Price":"300", "image": "http://47.104.244.246:5000/products/engine3.jpg"},
            {"mallPrice":"40", "Price":"400", "image": "http://47.104.244.246:5000/products/engine4.jpg"},
            {"mallPrice":"50", "Price":"500", "image": "http://47.104.244.246:5000/products/engine5.jpg"}
        ],
        "floor1Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/floorbanner.jpg"},
        "floor1": [
            {"image": "http://47.104.244.246:5000/floor/gear1.jpg"},
            {"image": "http://47.104.244.246:5000/floor/gear2.jpg"},
            {"image": "http://47.104.244.246:5000/floor/gear3.jpg"},
            {"image": "http://47.104.244.246:5000/floor/gear4.jpg"},
            {"image": "http://47.104.244.246:5000/floor/gear5.jpg"}
        ],
        "floor2Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/tirebanner.jpg"},
        "floor2": [
            {"image": "http://47.104.244.246:5000/floor/tire1.jpg"},
            {"image": "http://47.104.244.246:5000/floor/tire2.jpg"},
            {"image": "http://47.104.244.246:5000/floor/tire3.jpg"},
            {"image": "http://47.104.244.246:5000/floor/tire4.jpg"},
            {"image": "http://47.104.244.246:5000/floor/tire5.jpg"}
        ],
        "floor3Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/suspensionbanner.jpg"},
        "floor3": [
            {"image": "http://47.104.244.246:5000/floor/suspension1.jpg"},
            {"image": "http://47.104.244.246:5000/floor/suspension2.jpg"},
            {"image": "http://47.104.244.246:5000/floor/suspension3.jpg"},
            {"image": "http://47.104.244.246:5000/floor/suspension4.jpg"},
            {"image": "http://47.104.244.246:5000/floor/suspension5.jpg"}
        ]
      }
    }

[5] https://apitester.com/

[6] POST http://47.104.244.246:5000/homePageBelowContent
    formData = {'page':1}
    {
        "data": [
          {"name": "CC1", "image": "http://47.104.244.246:5000/category/myspace.png", "mallPrice":"10", "Price":"100"},
          {"name": "CC2", "image": "http://47.104.244.246:5000/category/linkedin.png", "mallPrice":"20", "Price":"200"},
          {"name": "CC3", "image": "http://47.104.244.246:5000/category/dribble.png", "mallPrice":"30", "Price":"300"},
          {"name": "CC4", "image": "http://47.104.244.246:5000/category/instagram.png", "mallPrice":"40", "Price":"400"},
          {"name": "CC5", "image": "http://47.104.244.246:5000/category/google-plus.png", "mallPrice":"50", "Price":"500"},
          {"name": "CC6", "image": "http://47.104.244.246:5000/category/facebook.png", "mallPrice":"60", "Price":"600"},
          {"name": "CC7", "image": "http://47.104.244.246:5000/category/twitter.png", "mallPrice":"70", "Price":"700"},
          {"name": "CC8", "image": "http://47.104.244.246:5000/category/task.png", "mallPrice":"80", "Price":"800"},
          {"name": "CC9", "image": "http://47.104.244.246:5000/category/reddit.png", "mallPrice":"90", "Price":"900"},
          {"name": "CC10", "image": "http://47.104.244.246:5000/category/instagram-new.png", "mallPrice":"30", "Price":"300"},
          {"name": "CC11", "image": "http://47.104.244.246:5000/category/file.png", "mallPrice":"40", "Price":"400"}
        ]
    }

[7] GET http://47.104.244.246:5000/getCategory
    {
        "data": [
          {"mallSubId": "40f83f647d964474af795994995e758d", "mallSubName": "Luk", "comments": null},
          {"mallSubId": "1df65ddea97e4afcb9e1a40468a785c2", "mallSubName": "Pool", "comments": null},
          {"mallSubId": "25044e46c0e8449282142f4b4d1dd24d", "mallSubName": "Puk", "comments": null},
          {"mallSubId": "aa6773c3251a429c84c24a380dd89a82", "mallSubName": "Zen", "comments": null},
        ]
    }

[9] 22.
    {
          "code": "0",
          "message": "success",
          "data": [
              {
                "mallCategoryId": "4",
                "mallCategoryName": "A1",
                "bxMallSubDto": [
                    {"mallSubId": "103c3881984d4e10a7787ed874bfa9bc", "mallCategoryId": "4", "mallSubName": "a01", "comments": null},
                    {"mallSubId": "def1370defc145e2aed3ae642a6a9e77", "mallCategoryId": "4", "mallSubName": "a02", "comments": null}
                ],
                "comments": null,
                "image": "http://47.104.244.246:5000/category/g1/g01.jpg"
              },
              {
                "mallCategoryId": "1",
                "mallCategoryName": "B1",
                "bxMallSubDto": [
                  {"mallSubId": "735dfddad0624e109936557f41edf6ba", "mallCategoryId": "1", "mallSubName": "b01", "comments": null},
                  {"mallSubId": "69ebc83f97f1478db25ec0470e63a783", "mallCategoryId": "1", "mallSubName": "b02", "comments": null}
                ],
                "comments": null,
                "image": "http://47.104.244.246:5000/category/g2/g01.jpg"
              },
          ]
    }
