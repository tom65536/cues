
self.addEventListener('install', function (event) {
  event.waitUntil(
    caches.open('cues-static-v1').then(function (cache) {
      return cache.addAll([
        '/app.js',
        '/index.html',
      ]);
    }),
  );
});

self.addEventListener('fetch', function(event) {
		event.respondWith(
		caches.match(event.request).then(function(response) {
  			return response || fetch(event.request);
		})
		);
});

