'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "7d9935523190b1c688d2b4ae04727b36",
"version.json": "3a65548adbf29211e8883ed90a909349",
"index.html": "a836032680a78d799f8be12100eea05a",
"/": "a836032680a78d799f8be12100eea05a",
"main.dart.js": "f64051fa83d68098da2cffd61cf38dfc",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5168e1657171759b7246d04c422faea9",
".git/ORIG_HEAD": "a565b97f45570321d523a18e5ff4df2b",
".git/config": "0aa133f9a4161c58e207d9234f6b81ef",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/3d/e720f326ce426f6b4d0482003dd442b4edd795": "d076065ba99214f5dc5398f98a51295b",
".git/objects/9d/5f886353dcff6c222439cc1118e77eb1b007ea": "a87ff240c6e149d1ce495643e49417f9",
".git/objects/b5/7a1bb2684f1a6bb8b2c55421df45aa81a3cf22": "088c50fcf7a5082e968251ff3a162e92",
".git/objects/b2/887bd7462d39d461ef558325a8f306a0956f59": "f50270c1d7c23d739a83c83d4495339a",
".git/objects/ad/2e38a4e0857a5f47b04af5f6588747ed8f09e3": "bd247597b1cc56c59a42ee13de7a556a",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/d7/26731557425870859d476486b5408052f85bcb": "dfd83d539d2b754df8524d39d3e61676",
".git/objects/be/17d74268262d809316dee45f3af2fcf3b372a0": "0c7e144cc86f4f0cd4aa2c7153ecadf4",
".git/objects/be/ac6e4e56d8fcce4e34077606d0ff1788e5cfcc": "f9023ba7e569d4cae07d56f2ba5292d7",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/a172e5c9ef0ff157b259cdc70285c3f73330ca": "fa01bb20a4b5ee03271cc89a3572a7d4",
".git/objects/e5/4bccd137a146282b58060680dc8aeaa973fc00": "94acb9ee4f73919e2a8d9cf5dc1bba9d",
".git/objects/e2/ff5865b192241d53935e77de70a4e6dff2847a": "cad1058aedc6c21a518b3cb00af21fac",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/aafb1b8e5ef04f8cc83a6de1600f88d98790a7": "31c6ca7a66241ff26916c9157cff5640",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/fc/10a9608f86c7a65dcd90b64a1b29736d1ee7ed": "9a4e8732c42f3a6aeadd3fdb0868ce02",
".git/objects/f2/a130f042848c6cb132bb52eaf0055dc0a8212e": "10717c66db836a40607cec40347c8254",
".git/objects/f2/849ae1792f692a0a95bf60f3c62e12377e4866": "ab465f4d71fccad56f27aec493ab2b96",
".git/objects/4e/09fd63b68856892dbce9493bc2adf300f373b3": "bb8b6892104f9283d0919d2f642215be",
".git/objects/29/4e0fe4898c5104cf865b7bbe250ee8a182e4eb": "e68f373ceba25de81469e9caed6cfa8c",
".git/objects/45/2e0c6f91b713ad9398eacb9aaa52df731fe6c0": "47a7c2bd382660d18a6e096a75eb7597",
".git/objects/45/3fc945e4bd4e3a59b7a516a81e3925ebb3838a": "c7c3ab95c8b1d986240a0248c93cf891",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/1a/6dd7e9c8edb76e11a795562137fd0870192bfe": "5eacc4e53b5c174b4375db489e59273c",
".git/objects/7b/8939efa85f313e17e52926010e04baa31947d7": "cdebcd4b0856140ba1a4105d2f17466f",
".git/objects/7b/ce5351f17921540de2f9fd9f7ed1db44394a0d": "234a799dcdbdbe4253cb4dc64680d550",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/86/b0c061a542677dff515cdf5cb93effc5df692c": "b46ace819d0bb2ba404f2465d13cc0dd",
".git/objects/43/2388a9dff42406eddc9828fe8a953f7c4f311d": "21663731d3cd696dd8735121761aafa8",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6e/bd1b4b234fb83fd4f5f4f9f3241080b164c79d": "a770f97e6c2b38aa2121d0c8e04a464d",
".git/objects/3f/81af55ebfbbbffba0c8a550ae5c30ee3b90c96": "320e0594f328fe348967a1b36016b341",
".git/objects/5b/07535995f9fd169ccee3683e248ff36c3117a3": "8ebd7661e8376049df400cacbd0396a6",
".git/objects/08/56265f28a1652da91881eaca118e687fc1a9e8": "021b120f13e828c103665312e410d741",
".git/objects/52/4e0c515b8d74ca008fc2c8541dc57fc5f50be6": "b9772518a4952707221971817bcd4d6a",
".git/objects/0f/338c8f50c11da411f037955c171d67b3f9d87e": "f62b84d6c6bc5be269c67a1e2920723e",
".git/objects/0a/84b6873ec7b59ba0fc77d3bc7eae54ec0eed47": "86132da66c9a9fa418b58426ed7da62a",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/b1/a750ecda20d9ac5420801c7db4b65b27cee06f": "082388de6694809b76f8ccc1b5ac6023",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/aa/4422f4c17ad2d6be02dce03b790d60711a793d": "01aa638fd243ff83bed39411ca1edc9b",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c4/cbe4e02a37eec2d53c7038b5d783ed30360351": "cbdd0db1229cb4eea66f8f5e5fcc3c0a",
".git/objects/c4/7e492fcf86978e27ed906a8c25a4eb843c9640": "6b6382b38d824d30519460324cea898e",
".git/objects/e6/46d591f99adb142edab348e5d728ad2bddc4a3": "7630b34441d494db3bf4d884cd250e72",
".git/objects/c2/d8d2f44dd987786bbc249d4ad7bac3360f4811": "1926a57b256d9def261ccf6dc2914f65",
".git/objects/e0/49c81f7cb35ebc411a3e1b547bf4ccf91292e8": "efad70dc0ca77a90ee53b5cc3be528ca",
".git/objects/41/5831290a7b64def597ed94b87069881eb1b3a8": "7c27f9f5921cab11e60336e8086e4cab",
".git/objects/48/f7b32b1c45da9f03af2e7670db95f1e914e286": "5d43ea735bcb6470f2316356294a86c1",
".git/objects/12/a33678391fc439a7c704673329914604b5eb48": "005da29e3fd4cb13526fa3c0b3cb2081",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/22/ff1b285d2d5a8ce9b35eab48c028e930acf29f": "2e6fb2bd971a4be22f636f6909580a0e",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "c3b5d9d58b7d28af8fef3b6bb72dfd88",
".git/logs/refs/heads/main": "c3b5d9d58b7d28af8fef3b6bb72dfd88",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "4904fafa213dd242e4b5fa6e5c59ffe0",
".git/index": "2a25590de5587088c8477ce6ec4d6d1b",
".git/COMMIT_EDITMSG": "2ce4536c1e39e56477897e429b43f5b4",
".git/FETCH_HEAD": "23b948fc6b9e01747840c3fcfa5be172",
"assets/AssetManifest.json": "0a19f06a52bcd9a7a5e8a670fe7b4eaf",
"assets/NOTICES": "8a32b8b6e09082d0471685529fbb4b1a",
"assets/background.png": "18a496acb8d7ec8d633edf9921b71047",
"assets/FontManifest.json": "7256a29f8c97c6db82de0db104b4b426",
"assets/AssetManifest.bin.json": "34490bd25073401ff8020c4c4f35b8cd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "a3f88a2e95be7a062ec26614a5779ae6",
"assets/fonts/MaterialIcons-Regular.otf": "8ea08ea2444cc58ec5807fd7669e488f",
"assets/assets/fonts/verdana-bold-italic.ttf": "b8d06d04e2d848ebcdd428cd8125f211",
"assets/assets/fonts/verdana-bold.ttf": "ddbe52e2cfdcc2b8c9c4ab8de872a325",
"assets/assets/fonts/verdana.ttf": "7652f550f74d065c79f44da613344338",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
