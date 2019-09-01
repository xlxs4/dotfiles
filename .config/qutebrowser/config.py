#!/usr/bin/env python

### First load autoconfig YAML.
config.load_autoconfig()
### Then overwrite it.

# Default start page.
c.url.start_pages = ['127.0.0.1:8080']
# Default search engine.
c.url.searchengines = {'DEFAULT': 'google.com/search?q={}'}
# Default blank page.
c.url.default_page = 'google.com'

# Don't allow webpage notifications,
c.content.notifications = False
# unless it's the mm server.
with config.pattern('https://mm.helit.org/') as p:
    p.content.notifications = True

# Disable GPU support and use Skia rendering instead.
c.qt.force_software_rendering = 'chromium'

### Keybindings.
# Play a video in mpv.
config.bind('m', 'spawn mpv {url}')
config.bind('M', 'hint links spawn mpv {url}')
