'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f73aaf6a7787549fb9e3f0836fa70a87",
"version.json": "36db986326d836c456147a8219e7daaf",
"index.html": "edca76277ca841d1e4f234130fb74ea0",
"/": "edca76277ca841d1e4f234130fb74ea0",
"main.dart.js": "6fe9438b6f31101cc26e0282bd231a9a",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "25d3583eb1ed5f5dd8b2f15a7481bfa4",
".git/config": "38881ccff4dc4e249623736f3cd97a15",
".git/objects/61/d804fd32a648e134cfeb81bda667bc6d9f634e": "30835528d6797bf890562e3a75a9b682",
".git/objects/0b/c88e213fcfaff64867b37654e33638e88ce4cf": "aefbba94913f8b9e79dff61bb15bd2ae",
".git/objects/5a/86128406a9248f12ebe031e6869e900b7fa713": "de2d2ec6b88dd72b379a404f571c1473",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "5a9f3522bf38ba5dd54f15a0f75cb0d7",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "01d8a507be49f15714be4d17b6947e52",
".git/objects/eb/829d8e9ad795781fb871ed33c39a697e71df94": "735efeb180b8c83182f7408cd8925cff",
".git/objects/fe/63c4e7273ea3d60a3eb583aca79ecac1be0def": "3f9fc53e32364d88bdbce27dc14d72aa",
".git/objects/c6/3acfe79afe1ae4e9609ce65ee6210efcf17199": "d43d476e407f53632353e1716e460fe4",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "708ec387c1c405170e46ecb742b4d308",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "2950f778d5dda0c267b890b72f9e64de",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "847cef55692aa6311c4c2f26d42b36b5",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "ebf7d1a0954090a5cf6bdc36cbf3289e",
".git/objects/87/a1e61edda85fc058e1c6e95be78af32d3ad659": "8aab9af10113e43ed5db00f2697ddf7a",
".git/objects/1a/96c26ec15cd5abd230395deead66bcda4f15a0": "4a547c7d4f8f69b996cec87594b82301",
".git/objects/28/96c016e1faf7c38d8923d6c6e7d7cfb13a8cc8": "bad4485504042dd6bd8ea46455d1211b",
".git/objects/7b/ff6d77bc252e9e30d2d3aa602dbddf429611f2": "284865e75b1ff65a1ffef3128a1a8498",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "b25b26893b8f92a4f583677ba27f0a7f",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e35fdc55764d9ed14315f6ff50093ab3",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "bcafa311bebf5634eaebc9a830559b6e",
".git/objects/6c/6bcf4f259ecd281215c685ec13db0bd40655c2": "5ec9604eb1d8f7cfd5001ffcece717a3",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "bf78de9a46b3f184061cc620c3ed1316",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "bbebac4a2c902f61cd432f1208897318",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "9dbf5b01e391c548c8343be8d1d4b04e",
".git/objects/d4/554ab9d0077f81588a06ba02098368ad918bcc": "eb2a0f4950233f6c32eafb22be79b4e2",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "5523d4e8db4b01938143b79a2a707ffd",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "05f6258e74434f94977ac333a3891eeb",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "2c236ea17ad6b309081e0a5251137b84",
".git/objects/af/a46a99dc3d140c169de89082dcd8ccd90bc78d": "fefb1338481a3c565c430f2ae8cb590c",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "7f7a35d97b21f578a6e3dfc95f936101",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "b0c549c0aed479932cf26d094f76630e",
".git/objects/ef/efc8e99a111675bc4bf18e0916089d20586eba": "2e6347830ae6d5e70ef79dee67b73856",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "31782b0e3547365a9cae9df3a3668159",
".git/objects/e1/9e4b7eb9f3d7cf3d0fd17e15c2331c92bee556": "fd2028bfe2de7ba3cc1e8d1cbe0b50c2",
".git/objects/c2/5418effddf1067efdf34e52214d8433981824c": "f9d3873dfce8578ee63e7942d6b7cb35",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "0bb82caa96c962530864f28e847f4ab9",
".git/objects/47/1a513ffc2f4c1c312a785cf9adf3994e7c5b5b": "93484d74b50146d437738d9f86048bf5",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
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
".git/index": "8e4a131eab4cbba761eac65e6a57fddf",
"assets/AssetManifest.json": "d32016f83d5e19e684538148abf62538",
"assets/NOTICES": "6cc594410f3aa543504db46d1f222f13",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "d0d4359d8aeba352ef63384a4811df60",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d8933a121bde866efe17c2ba50f3be61",
"assets/fonts/MaterialIcons-Regular.otf": "e84b52ec7025bf60a9fd0543fd5d8552",
"assets/assets/logo_black.png": "1c3b52f2690e209af699c406dcdb2645",
"assets/assets/Google-Play-Logo.png": "f21f341d5d85203ffa893b8a77da8bce",
"assets/assets/bothlogo.jpeg": "68881a9411b550f80f9d860f6bc70aff",
"assets/assets/influfit_ios.png": "c86a908d4f4c59dcde36cba99c662d9e",
"assets/assets/appstore_logo.png": "b55d8d45148c4c7a8bd5ff4064b449c3",
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
