<ul class="menu">
  {% for language in site.languages %}
    <li class="menu-item"><a class="menu-link" href="{{ language.url }}">{{ language.title }}</a></li>
  {% endfor %}
  {% if editmode %}<li class="edit-btn">{% languageadd %}</li>{% endif %}
</ul>
