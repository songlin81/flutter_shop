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
          {"image": "http://47.104.244.246:5000/banners/banner1.jpg", "goodsId":"9f1bde335e044e38ab2e491773e1bd6c"},
          {"image": "http://47.104.244.246:5000/banners/banner2.jpg", "goodsId":"9f1bde335e044e38ab2e491773e1bd7c"},
          {"image": "http://47.104.244.246:5000/banners/banner3.jpg", "goodsId":"9f1bde335e044e38ab2e491773e1bd8c"},
          {"image": "http://47.104.244.246:5000/banners/banner4.jpg", "goodsId":"9f1bde335e044e38ab2e491773e1bd9c"},
          {"image": "http://47.104.244.246:5000/banners/banner5.jpg", "goodsId":"9f1bde335e044e38ab2e491773e1bd0c"}
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
            {"mallPrice":"10", "Price":"100", "image": "http://47.104.244.246:5000/products/engine1.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bd2c"},
            {"mallPrice":"20", "Price":"200", "image": "http://47.104.244.246:5000/products/engine2.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bd3c"},
            {"mallPrice":"30", "Price":"300", "image": "http://47.104.244.246:5000/products/engine3.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bd4c"},
            {"mallPrice":"40", "Price":"400", "image": "http://47.104.244.246:5000/products/engine4.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bd5c"},
            {"mallPrice":"50", "Price":"500", "image": "http://47.104.244.246:5000/products/engine5.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bd6c"}
        ],
        "floor1Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/floorbanner.jpg"},
        "floor1": [
            {"image": "http://47.104.244.246:5000/floor/gear1.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2be1c"},
            {"image": "http://47.104.244.246:5000/floor/gear2.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2be2c"},
            {"image": "http://47.104.244.246:5000/floor/gear3.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2be3c"},
            {"image": "http://47.104.244.246:5000/floor/gear4.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2be4c"},
            {"image": "http://47.104.244.246:5000/floor/gear5.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2be5c"}
        ],
        "floor2Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/tirebanner.jpg"},
        "floor2": [
            {"image": "http://47.104.244.246:5000/floor/tire1.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bf1c"},
            {"image": "http://47.104.244.246:5000/floor/tire2.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bf2c"},
            {"image": "http://47.104.244.246:5000/floor/tire3.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bf3c"},
            {"image": "http://47.104.244.246:5000/floor/tire4.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bf4c"},
            {"image": "http://47.104.244.246:5000/floor/tire5.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bf5c"}
        ],
        "floor3Pic": {"Picture_Address" : "http://47.104.244.246:5000/floor/suspensionbanner.jpg"},
        "floor3": [
            {"image": "http://47.104.244.246:5000/floor/suspension1.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bg1c"},
            {"image": "http://47.104.244.246:5000/floor/suspension2.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bg2c"},
            {"image": "http://47.104.244.246:5000/floor/suspension3.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bg3c"},
            {"image": "http://47.104.244.246:5000/floor/suspension4.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bg4c"},
            {"image": "http://47.104.244.246:5000/floor/suspension5.jpg", "goodsId":"9f1bde335e044e38ab2e491773e2bg5c"}
        ]
      }
    }

[5] https://apitester.com/

[6] POST http://47.104.244.246:5000/homePageBelowContent
    formData = {'page':1}
    {
        "data": [
          {"name": "CC1", "image": "http://47.104.244.246:5000/category/myspace.png", "mallPrice":"10", "Price":"100", "goodsId":"ed675dda49e0445fa769f3d8020ab5e9"},
          {"name": "CC2", "image": "http://47.104.244.246:5000/category/linkedin.png", "mallPrice":"20", "Price":"200", "goodsId":"4c7bf0743bd645f3be9e5bdac19d068c"},
          {"name": "CC3", "image": "http://47.104.244.246:5000/category/dribble.png", "mallPrice":"30", "Price":"300", "goodsId":"d73e1f57da3f44d1b0c29e76211d1919"},
          {"name": "CC4", "image": "http://47.104.244.246:5000/category/instagram.png", "mallPrice":"40", "Price":"400", "goodsId":"58860a5c19f54477af7a5f4a3d86b43c"},
          {"name": "CC5", "image": "http://47.104.244.246:5000/category/google-plus.png", "mallPrice":"50", "Price":"500", "goodsId":"636670371376446c9e2e4425ef10492a"},
          {"name": "CC6", "image": "http://47.104.244.246:5000/category/facebook.png", "mallPrice":"60", "Price":"600", "goodsId":"8d2dd063c53244e28247babe1edbe10c"},
          {"name": "CC7", "image": "http://47.104.244.246:5000/category/twitter.png", "mallPrice":"70", "Price":"700", "goodsId":"5db8a30e3ede44fbbfe87c7918d0ca95"},
          {"name": "CC8", "image": "http://47.104.244.246:5000/category/task.png", "mallPrice":"80", "Price":"800", "goodsId":"945b37875ccc474d9c307fdd86c956bd"},
          {"name": "CC9", "image": "http://47.104.244.246:5000/category/reddit.png", "mallPrice":"90", "Price":"900", "goodsId":"9f1bde335e044e38ab2e491773e1bd6c"},
          {"name": "CC10", "image": "http://47.104.244.246:5000/category/instagram-new.png", "mallPrice":"30", "Price":"300", "goodsId":"bd067eb180a54360bb3d611c03e1d431"},
          {"name": "CC11", "image": "http://47.104.244.246:5000/category/file.png", "mallPrice":"40", "Price":"400", "goodsId":"24fc82fa70e345229def9297d657d4f1"}
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

    {
        "code":"0",
        "message":"success",
        "data":[
            {
                "mallCategoryId":"4",
                "mallCategoryName":"白酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c94621970a801626a35cb4d0175",
                        "mallCategoryId":"4",
                        "mallSubName":"名酒",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94621970a801626a363e5a0176",
                        "mallCategoryId":"4",
                        "mallSubName":"宝丰",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94621970a801626a3770620177",
                        "mallCategoryId":"4",
                        "mallSubName":"北京二锅头",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cc035c15a8",
                        "mallCategoryId":"4",
                        "mallSubName":"大明",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cc2af915a9",
                        "mallCategoryId":"4",
                        "mallSubName":"杜康",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cc535115aa",
                        "mallCategoryId":"4",
                        "mallSubName":"顿丘",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cc77b215ab",
                        "mallCategoryId":"4",
                        "mallSubName":"汾酒",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cca72e15ac",
                        "mallCategoryId":"4",
                        "mallSubName":"枫林",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cccae215ad",
                        "mallCategoryId":"4",
                        "mallSubName":"高粱酒",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ccf0d915ae",
                        "mallCategoryId":"4",
                        "mallSubName":"古井",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cd1d6715af",
                        "mallCategoryId":"4",
                        "mallSubName":"贵州大曲",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cd3f2815b0",
                        "mallCategoryId":"4",
                        "mallSubName":"国池",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cd5d3015b1",
                        "mallCategoryId":"4",
                        "mallSubName":"国窖",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cd7ced15b2",
                        "mallCategoryId":"4",
                        "mallSubName":"国台",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cd9b9015b3",
                        "mallCategoryId":"4",
                        "mallSubName":"汉酱",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cdbfd215b4",
                        "mallCategoryId":"4",
                        "mallSubName":"红星",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c946891d16801689474e2a70081",
                        "mallCategoryId":"4",
                        "mallSubName":"怀庄",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cdddf815b5",
                        "mallCategoryId":"4",
                        "mallSubName":"剑南春",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cdfd4815b6",
                        "mallCategoryId":"4",
                        "mallSubName":"江小白",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb1016802277c37160e",
                        "mallCategoryId":"4",
                        "mallSubName":"金沙",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ce207015b7",
                        "mallCategoryId":"4",
                        "mallSubName":"京宫",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ce46d415b8",
                        "mallCategoryId":"4",
                        "mallSubName":"酒鬼",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb101680226de23160d",
                        "mallCategoryId":"4",
                        "mallSubName":"口子窖",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ce705515b9",
                        "mallCategoryId":"4",
                        "mallSubName":"郎酒",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ce989e15ba",
                        "mallCategoryId":"4",
                        "mallSubName":"老口子",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cec30915bb",
                        "mallCategoryId":"4",
                        "mallSubName":"龙江家园",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cef15c15bc",
                        "mallCategoryId":"4",
                        "mallSubName":"泸州",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cf156f15bd",
                        "mallCategoryId":"4",
                        "mallSubName":"鹿邑大曲",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cf425b15be",
                        "mallCategoryId":"4",
                        "mallSubName":"毛铺",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cf9dc915c0",
                        "mallCategoryId":"4",
                        "mallSubName":"绵竹",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cfbf1c15c1",
                        "mallCategoryId":"4",
                        "mallSubName":"难得糊涂",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cfdd7215c2",
                        "mallCategoryId":"4",
                        "mallSubName":"牛二爷",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7cf71e715bf",
                        "mallCategoryId":"4",
                        "mallSubName":"茅台",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7d7eda715c3",
                        "mallCategoryId":"4",
                        "mallSubName":"绵竹",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7d96e5c15c4",
                        "mallCategoryId":"4",
                        "mallSubName":"难得糊涂",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dab93b15c5",
                        "mallCategoryId":"4",
                        "mallSubName":"牛二爷",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dae16415c6",
                        "mallCategoryId":"4",
                        "mallSubName":"牛栏山",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7db11cb15c7",
                        "mallCategoryId":"4",
                        "mallSubName":"前门",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7db430c15c8",
                        "mallCategoryId":"4",
                        "mallSubName":"全兴",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7db6cac15c9",
                        "mallCategoryId":"4",
                        "mallSubName":"舍得",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7db9a4415ca",
                        "mallCategoryId":"4",
                        "mallSubName":"双沟",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dc30b815cb",
                        "mallCategoryId":"4",
                        "mallSubName":"水井坊",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dc543e15cc",
                        "mallCategoryId":"4",
                        "mallSubName":"四特",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dc765c15cd",
                        "mallCategoryId":"4",
                        "mallSubName":"潭酒",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dc988a15ce",
                        "mallCategoryId":"4",
                        "mallSubName":"沱牌",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dcba5a15cf",
                        "mallCategoryId":"4",
                        "mallSubName":"五粮液",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dcd9e815d0",
                        "mallCategoryId":"4",
                        "mallSubName":"西凤",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dcf6d715d1",
                        "mallCategoryId":"4",
                        "mallSubName":"习酒",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dd11b215d2",
                        "mallCategoryId":"4",
                        "mallSubName":"小白杨",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dd2f3c15d3",
                        "mallCategoryId":"4",
                        "mallSubName":"洋河",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7dd969115d4",
                        "mallCategoryId":"4",
                        "mallSubName":"伊力特",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ddb16c15d5",
                        "mallCategoryId":"4",
                        "mallSubName":"张弓",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7ddd6c715d6",
                        "mallCategoryId":"4",
                        "mallSubName":"中粮",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7de126815d7",
                        "mallCategoryId":"4",
                        "mallSubName":"竹叶青",
                        "comments":null
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category1.png"
            },
            {
                "mallCategoryId":"1",
                "mallCategoryName":"啤酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946016ea9b016016f79c8e0000",
                        "mallCategoryId":"1",
                        "mallSubName":"百威",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94608ff843016095163b8c0177",
                        "mallCategoryId":"1",
                        "mallSubName":"福佳",
                        "comments":""
                    },
                    {
                        "mallSubId":"402880e86016d1b5016016db9b290001",
                        "mallCategoryId":"1",
                        "mallSubName":"哈尔滨",
                        "comments":""
                    },
                    {
                        "mallSubId":"402880e86016d1b5016016dbff2f0002",
                        "mallCategoryId":"1",
                        "mallSubName":"汉德",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647cd6830e0022",
                        "mallCategoryId":"1",
                        "mallSubName":"崂山",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647cd706a60023",
                        "mallCategoryId":"1",
                        "mallSubName":"林德曼",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e1411b15d8",
                        "mallCategoryId":"1",
                        "mallSubName":"青岛",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e1647215d9",
                        "mallCategoryId":"1",
                        "mallSubName":"三得利",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e182e715da",
                        "mallCategoryId":"1",
                        "mallSubName":"乌苏",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c9468118c9c016811ab16bf0001",
                        "mallCategoryId":"1",
                        "mallSubName":"雪花",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c9468118c9c016811aa6f440000",
                        "mallCategoryId":"1",
                        "mallSubName":"燕京",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e19b8f15db",
                        "mallCategoryId":"1",
                        "mallSubName":"智美",
                        "comments":null
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category2.png"
            },
            {
                "mallCategoryId":"2",
                "mallCategoryName":"葡萄酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c9460337d540160337fefd60000",
                        "mallCategoryId":"2",
                        "mallSubName":"澳大利亚",
                        "comments":""
                    },
                    {
                        "mallSubId":"402880e86016d1b5016016e083f10010",
                        "mallCategoryId":"2",
                        "mallSubName":"德国",
                        "comments":""
                    },
                    {
                        "mallSubId":"402880e86016d1b5016016df1f92000c",
                        "mallCategoryId":"2",
                        "mallSubName":"法国",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94621970a801626a40feac0178",
                        "mallCategoryId":"2",
                        "mallSubName":"南非",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e5c9a115dc",
                        "mallCategoryId":"2",
                        "mallSubName":"葡萄牙",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e5e68f15dd",
                        "mallCategoryId":"2",
                        "mallSubName":"西班牙",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e609f515de",
                        "mallCategoryId":"2",
                        "mallSubName":"新西兰",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e6286a15df",
                        "mallCategoryId":"2",
                        "mallSubName":"意大利",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e6486615e0",
                        "mallCategoryId":"2",
                        "mallSubName":"智利",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7e66c6815e1",
                        "mallCategoryId":"2",
                        "mallSubName":"中国",
                        "comments":null
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category3.png"
            },
            {
                "mallCategoryId":"3",
                "mallCategoryName":"清酒洋酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"402880e86016d1b5016016e135440011",
                        "mallCategoryId":"3",
                        "mallSubName":"清酒",
                        "comments":""
                    },
                    {
                        "mallSubId":"402880e86016d1b5016016e171cc0012",
                        "mallCategoryId":"3",
                        "mallSubName":"洋酒",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category4.png"
            },
            {
                "mallCategoryId":"5",
                "mallCategoryName":"保健酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c94609a62be0160a02d1dc20021",
                        "mallCategoryId":"5",
                        "mallSubName":"黄酒",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94648837980164883ff6980000",
                        "mallCategoryId":"5",
                        "mallSubName":"药酒",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category5.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b",
                "mallCategoryName":"预调酒",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d02f6250026",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b",
                        "mallSubName":"果酒",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d031bae0027",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b",
                        "mallSubName":"鸡尾酒",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d03428f0028",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccd76a6001b",
                        "mallSubName":"米酒",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category6.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d",
                "mallCategoryName":"下酒小菜",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dc18e610035",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d",
                        "mallSubName":"熟食",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dc1d9070036",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d",
                        "mallSubName":"火腿",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dc1fc3e0037",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccf3b97001d",
                        "mallSubName":"速冻食品",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category7.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                "mallCategoryName":"饮料",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d09cbf6002d",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"茶饮",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d09f7e8002e",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"水饮",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d0a27e1002f",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"功能饮料",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d0b1d4d0030",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"果汁",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d14192b0031",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"含乳饮料",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647d24d9600032",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccdb0e0001c",
                        "mallSubName":"碳酸饮料",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category8.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647cd108b60020",
                "mallCategoryName":"乳制品",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd4ac8c0048",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd108b60020",
                        "mallSubName":"常温纯奶",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd4f6a40049",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd108b60020",
                        "mallSubName":"常温酸奶",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd51ab7004a",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd108b60020",
                        "mallSubName":"低温奶",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category9.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                "mallCategoryName":"休闲零食",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dc51d93003c",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"方便食品",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd204dc0040",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"面包糕点",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd22f760041",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"糖果巧克力",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd254530042",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"膨化食品",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7fa132b15e7",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"坚果炒货",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7f4bfc415e2",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"肉干豆干",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7f5027a15e3",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"饼干",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94679b4fb10167f7f530fd15e4",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"冲调",
                        "comments":null
                    },
                    {
                        "mallSubId":"2c9f6c94683a6b0d016846b49436003b",
                        "mallCategoryId":"2c9f6c946449ea7e01647ccfddb3001e",
                        "mallSubName":"休闲水果",
                        "comments":null
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category10.png"
            },
            {
                "mallCategoryId":"2c9f6c946449ea7e01647cd08369001f",
                "mallCategoryName":"粮油调味",
                "bxMallSubDto":[
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd2e8270043",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd08369001f",
                        "mallSubName":"油/粮食",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd31bca0044",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd08369001f",
                        "mallSubName":"调味品",
                        "comments":""
                    },
                    {
                        "mallSubId":"2c9f6c946449ea7e01647dd35a980045",
                        "mallCategoryId":"2c9f6c946449ea7e01647cd08369001f",
                        "mallSubName":"酱菜罐头",
                        "comments":""
                    }],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category11.png"
            },
            {
                "mallCategoryId":"2c9f6c9468a85aef016925444ddb271b",
                "mallCategoryName":"积分商品",
                "bxMallSubDto":[
                ],
                "comments":null,
                "image":"http://47.104.244.246:5000/category/complex/category12.png"
            }]
    }

[10]
    {
      "code": "0",
      "message": "success",
      "data": [
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190116145309_40.jpg",
          "oriPrice": 2.50,
          "presentPrice": 1.80,
          "goodsName": "哈尔滨冰爽啤酒330ml",
          "goodsId": "3194330cf25f43c3934dbb8c2a964ade"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190115185215_1051.jpg",
          "oriPrice": 2.00,
          "presentPrice": 1.80,
          "goodsName": "燕京啤酒8°330ml",
          "goodsId": "522a3511f4c545ab9547db074bb51579"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190121102419_9362.jpg",
          "oriPrice": 1.98,
          "presentPrice": 1.80,
          "goodsName": "崂山清爽8°330ml",
          "goodsId": "bbdbd5028cc849c2998ff84fb55cb934"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712181330_9746.jpg",
          "oriPrice": 2.50,
          "presentPrice": 1.90,
          "goodsName": "雪花啤酒8°清爽330ml",
          "goodsId": "87013c4315e54927a97e51d0645ece76"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712180233_4501.jpg",
          "oriPrice": 2.50,
          "presentPrice": 2.20,
          "goodsName": "崂山啤酒8°330ml",
          "goodsId": "86388a0ee7bd4a9dbe79f4a38c8acc89"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190116164250_1839.jpg",
          "oriPrice": 2.50,
          "presentPrice": 2.30,
          "goodsName": "哈尔滨小麦王10°330ml",
          "goodsId": "d31a5a337d43433385b17fe83ce2676a"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712181139_2653.jpg",
          "oriPrice": 2.70,
          "presentPrice": 2.50,
          "goodsName": "三得利清爽啤酒10°330ml",
          "goodsId": "74a1fb6adc1f458bb6e0788c4859bf54"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190121162731_3928.jpg",
          "oriPrice": 2.75,
          "presentPrice": 2.50,
          "goodsName": "三得利啤酒7.5度超纯啤酒330ml",
          "goodsId": "d52fa8ba9a5f40e6955be9e28a764f34"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712180452_721.jpg",
          "oriPrice": 4.50,
          "presentPrice": 3.70,
          "goodsName": "青岛啤酒11°330ml",
          "goodsId": "a42c0585015540efa7e9642ec1183940"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190121170407_7423.jpg",
          "oriPrice": 4.40,
          "presentPrice": 4.00,
          "goodsName": "三得利清爽啤酒500ml 10.0°",
          "goodsId": "94ec3df73f4446b5a5f0d80a8e51eb9d"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712181427_6101.jpg",
          "oriPrice": 4.50,
          "presentPrice": 4.00,
          "goodsName": "雪花勇闯天涯啤酒8°330ml",
          "goodsId": "d80462faab814ac6a7124cec3b868cf7"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180717151537_3425.jpg",
          "oriPrice": 4.90,
          "presentPrice": 4.10,
          "goodsName": "百威啤酒听装9.7°330ml",
          "goodsId": "91a849140de24546b0de9e23d85399a3"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190121101926_2942.jpg",
          "oriPrice": 4.95,
          "presentPrice": 4.50,
          "goodsName": "崂山啤酒8°500ml",
          "goodsId": "3758bbd933b145f2a9c472bf76c4920c"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712175422_518.jpg",
          "oriPrice": 5.00,
          "presentPrice": 4.50,
          "goodsName": "百威3.6%大瓶9.7°P460ml",
          "goodsId": "dc32954b66814f40977be0255cfdacca"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180717151454_4834.jpg",
          "oriPrice": 5.00,
          "presentPrice": 4.50,
          "goodsName": "青岛啤酒大听装500ml",
          "goodsId": "fc85510c3af7428dbf1cb0c1bcb43711"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712181007_4229.jpg",
          "oriPrice": 5.50,
          "presentPrice": 5.00,
          "goodsName": "三得利金纯生啤酒580ml 9°",
          "goodsId": "14bd89f066ca4949af5e4d5a1d2afaf8"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190121100752_4292.jpg",
          "oriPrice": 6.60,
          "presentPrice": 6.00,
          "goodsName": "哈尔滨啤酒冰纯白啤（小麦啤酒）500ml",
          "goodsId": "89bccd56a8e9465692ccc469cd4b442e"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712175656_777.jpg",
          "oriPrice": 7.20,
          "presentPrice": 6.60,
          "goodsName": "百威啤酒500ml",
          "goodsId": "3a94dea560ef46008dad7409d592775d"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20180712180754_2838.jpg",
          "oriPrice": 7.78,
          "presentPrice": 7.00,
          "goodsName": "青岛啤酒皮尔森10.5°330ml",
          "goodsId": "97adb29137fb47689146a397e5351926"
        },
        {
          "image": "http://images.baixingliangfan.cn/compressedPic/20190116164149_2165.jpg",
          "oriPrice": 7.78,
          "presentPrice": 7.00,
          "goodsName": "青岛全麦白啤11°500ml",
          "goodsId": "f78826d3eb0546f6a2e58893d4a41b43"
        }
      ]
    }

[11]
    {
      "code": "0",
      "message": "success",
      "data": [
        {
          "image": "http://img3.imgtn.bdimg.com/it/u=2443439246,4261600877&fm=26&gp=0.jpg",
          "oriPrice": 2222.50,
          "presentPrice": 1888.00,
          "goodsName": "茅台",
          "goodsId": "3194330cf25f43c3934dbb8c2a964ade"
        },
        {
          "image": "http://img0.imgtn.bdimg.com/it/u=4095533196,83254014&fm=26&gp=0.jpg",
          "oriPrice": 2000.00,
          "presentPrice": 1000.00,
          "goodsName": "五粮液",
          "goodsId": "522a3511f4c545ab9547db074bb51579"
        },
        {
          "image": "http://img2.imgtn.bdimg.com/it/u=2768353058,3079060582&fm=26&gp=0.jpg",
          "oriPrice": 1000.98,
          "presentPrice": 800.00,
          "goodsName": "国窖",
          "goodsId": "bbdbd5028cc849c2998ff84fb55cb934"
        }
      ]
    }

    {
      "code": "0",
      "message": "success",
      "data": []
    }

    {
      "code": "0",
      "message": "success",
      "data": {
        "goodInfo": {
          "image5": "",
          "amount": 10000,
          "image3": "",
          "image4": "",
          "goodsId": "ed675dda49e0445fa769f3d8020ab5e9",
          "isOnline": "yes",
          "image1": "http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg",
          "image2": "",
          "goodsSerialNumber": "6928804011173",
          "oriPrice": 3.00,
          "presentPrice": 2.70,
          "comPic": "http://images.baixingliangfan.cn/compressedPic/20190116162618_2924.jpg",
          "state": 1,
          "shopId": "402880e860166f3c0160167897d60002",
          "goodsName": "可口可乐500ml/瓶",
          "goodsDetail": "<img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_5060.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081109_1063.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8029.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_1074.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_8439.jpg\" width=\"100%\" height=\"auto\" alt=\"\" /><img src=\"http://images.baixingliangfan.cn/shopGoodsDetailImg/20171224/20171224081110_6800.jpg\" width=\"100%\" height=\"auto\" alt=\"\" />"
        },
        "goodComments": [
          {
            "SCORE": 5,
            "comments": "果断卸载，2.5个小时才送到",
            "userName": "157******27",
            "discussTime": 1539491266336
          }
        ],
        "advertesPicture": {
          "PICTURE_ADDRESS": "http://images.baixingliangfan.cn/advertesPicture/20190113/20190113134955_5825.jpg",
          "TO_PLACE": "1"
        }
      }
    }

[12] 52
    {
      "goodsId": "2171c20d77c340729d5d7ebc2039c08d",
      "goodsName": "五粮液52°500ml",
      "count": 1,
      "price": 830.0,
      "images": "http://images.baixingliangfan.cn/shopGoodsImg/20181229/20181229211422_8507.jpg"
    }

[13] To check:
    https://github.com/lozone123/flutter_alipay_wxchatpay
    https://www.raywenderlich.com/4333657-using-the-camera-on-flutter