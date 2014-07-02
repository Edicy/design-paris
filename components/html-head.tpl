<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

<script src="{{ javascripts_path }}/modernizr.js?3"></script>

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic%7COpen+Sans:400italic,700italic,400,700">
{% stylesheet_link "main.css?3" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?3" %}<![endif]-->
<link rel="stylesheet" href="/assets/admin/tools/0.1.3/edicy-tools.css?3">
<link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-search/1.0.0/edicy-search.css">

<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

{% comment %}<!-- Page specific opengraph tags are located in each page template -->{% endcomment %}
{% comment %}<!-- TODO: Add functionality after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="website">
{% comment %}<!-- https://developers.facebook.com/tools/debug - Debug after each modification -->{% endcomment %}