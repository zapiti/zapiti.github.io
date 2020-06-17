'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "1424df078a8a2a84ab3cee32a04ac117",
"assets/assets/images/bg_circle.png": "54d2cb4dd4f966b4f0a42339c8b05b0c",
"assets/assets/images/empty_page.png": "7c9c66bb96b8f87fe95432a707d0b58d",
"assets/assets/images/ic_arrow_location.png": "b3c9c56c325b6a4dc8e28f1be753c2c3",
"assets/assets/images/ic_box_empty.png": "975db625239fabf638adb0a03622f81e",
"assets/assets/images/ic_calendar.png": "4503c3e1efe18385b7003692774d4849",
"assets/assets/images/ic_camera.png": "889dab5fe534c61cd0f3f92254d5f0d9",
"assets/assets/images/ic_empty_file.png": "564600753453b64f09695d28ddc6a3b5",
"assets/assets/images/ic_error_file.png": "89f956a86c53f16e93def2c16238b0a1",
"assets/assets/images/ic_exit.png": "f43920ee9da6151f7db4635543567523",
"assets/assets/images/ic_hands.png": "4fe17fb6729d84281b11c65ab64cac53",
"assets/assets/images/ic_logo.png": "6ddf6255a864707141e6e32febce1f67",
"assets/assets/images/ic_map.png": "87c8e420359f2606996586fbcb482112",
"assets/assets/images/ic_play.png": "0d6c4af80853efef46a7cee375931b40",
"assets/assets/images/ic_target.png": "b606916c36cd5f5c8c7768711f81602a",
"assets/assets/images/ic_user.png": "6cbfde8b5e4c637c236cf9a4c5c7ec58",
"assets/assets/images/loading.gif": "5cfd3fd1ec66fd777ba7e47bfb04a925",
"assets/FontManifest.json": "14c4e31b82a2ed2e1d037893dd336d6e",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "3d96c0fabd5df017f65a4d201fb6e189",
"assets/packages/flutter_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_icons/fonts/Feather.ttf": "6beba7e6834963f7f171d3bdd075c915",
"assets/packages/flutter_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_icons/fonts/FontAwesome5_Brands.ttf": "c39278f7abfc798a241551194f55e29f",
"assets/packages/flutter_icons/fonts/FontAwesome5_Regular.ttf": "f6c6f6c8cb7784254ad00056f6fbd74e",
"assets/packages/flutter_icons/fonts/FontAwesome5_Solid.ttf": "b70cea0339374107969eb53e5b1f603f",
"assets/packages/flutter_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_icons/fonts/Ionicons.ttf": "b2e0fc821c6886fb3940f85a3320003e",
"assets/packages/flutter_icons/fonts/MaterialCommunityIcons.ttf": "3c851d60ad5ef3f2fe43ebd263490d78",
"assets/packages/flutter_icons/fonts/MaterialIcons.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/packages/flutter_icons/fonts/Octicons.ttf": "73b8cff012825060b308d2162f31dbb2",
"assets/packages/flutter_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_icons/fonts/weathericons.ttf": "4618f0de2a818e7ad3fe880e0b74d04a",
"assets/packages/flutter_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/progress_dialog/assets/double_ring_loading_io.gif": "e5b006904226dc824fdb6b8027f7d930",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "65e49495f38531380901cb6696f1f6c0",
"/": "65e49495f38531380901cb6696f1f6c0",
"main.dart.js": "1c14ff596ee7c8e95a10ab7a29a900ca",
"manifest.json": "d33bdf1eef1030255c5ebf890fff9574"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
