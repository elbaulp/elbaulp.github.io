<amp-analytics type="googleanalytics" id="analytics-ga">
  <script type="application/json">
    {
        "vars": {
            "account": "{{ site.owner.google.analytics }}"
        },
        "triggers": {
            "trackPageview": {
                "on": "visible",
                "request": "pageview"
            },
            "tw" : {
                "on": "click",
                "selector": ".icon-twitter",
                "request": "event",
                "vars": {
                    "eventCategory": "amp-share",
                    "eventAction": "twitter"
                }
            },
            "fb" : {
                "on": "click",
                "selector": ".icon-facebook",
                "request": "event",
                "vars": {
                    "eventCategory": "amp-share",
                    "eventAction": "facebook"
                }
            },
            "gp" : {
                "on": "click",
                "selector": ".icon-google-plus",
                "request": "event",
                "vars": {
                    "eventCategory": "amp-share",
                    "eventAction": "google-plus"
                }
            },
            "feed" : {
                "on": "click",
                "selector": ".icon-rss",
                "request": "event",
                "vars": {
                    "eventCategory": "amp-share",
                    "eventAction": "feed"
                }
            },
            "newsletter" : {
                "on": "click",
                "selector": ".icon-mail",
                "request": "event",
                "vars": {
                    "eventCategory": "amp-share",
                    "eventAction": "newsletter"
                }
            },
            "amazon" : {
                "on": "click",
                "selector": "#amazon-ad",
                "request": "event",
                "vars": {
                    "eventCategory": "amazon",
                    "eventAction": "insidepost"
                }
            },
            "patreon" : {
	        "on": "click",
	        "selector": "#patreon-ad",
	        "request": "event",
	        "vars": {
	            "eventCategory": "patreon-ad",
	            "eventAction": "insidepost"
	        }
            },
            "revresponse" : {
                "on": "click",
                "selector": "#revresponse-ad",
                "request": "event",
                "vars": {
                    "eventCategory": "revresponse-ad",
                    "eventAction": "insidepost"
                }
            },
            "pop1" : {
                "on": "click",
                "selector": "#pop1",
                "request": "event",
                "vars": {
                    "eventCategory": "popular-posts",
                    "eventAction": "pop1"
                }
            },
            "pop2" : {
                "on": "click",
                "selector": "#pop2",
                "request": "event",
                "vars": {
                    "eventCategory": "popular-posts",
                    "eventAction": "pop2"
                }
            },
            "pop3" : {
                "on": "click",
                "selector": "#pop3",
                "request": "event",
                "vars": {
                    "eventCategory": "popular-posts",
                    "eventAction": "pop3"
                }
            },
            "pop4" : {
                "on": "click",
                "selector": "#pop4",
                "request": "event",
                "vars": {
                    "eventCategory": "popular-posts",
                    "eventAction": "pop4"
                }
            },
            "pop5" : {
                "on": "click",
                "selector": "#pop5",
                "request": "event",
                "vars": {
                    "eventCategory": "popular-posts",
                    "eventAction": "pop5"
                }
            },
            "link-next" : {
                "on": "click",
                "selector": "#link-next",
                "request": "event",
                "vars": {
                    "eventCategory": "link-next",
                    "eventAction": "click"
                }
            },
            "link-prev" : {
                "on": "click",
                "selector": "#link-prev",
                "request": "event",
                "vars": {
                    "eventCategory": "link-prev",
                    "eventAction": "click"
                }
            },
            "link-random" : {
                "on": "click",
                "selector": "#link-random",
                "request": "event",
                "vars": {
                    "eventCategory": "link-random",
                    "eventAction": "click"
                }
            },
            "ml" : {
                "on": "click",
                "selector": "#libros-ml",
                "request": "event",
                "vars": {
                    "eventCategory": "libros-ml",
                    "eventAction": "guidespage"
                }
            },
            "geek" : {
                "on": "click",
                "selector": "#libros-geek",
                "request": "event",
                "vars": {
                    "eventCategory": "libros-geek",
                    "eventAction": "guidespage"
                }
            }
        }
    }
  </script>
</amp-analytics>
