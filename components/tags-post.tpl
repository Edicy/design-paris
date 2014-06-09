  {% include "tags-variables" %}
  {% if editmode %}
    <div class="tags">
      <div class="tags-editor">{% editable article.tags %}</div>
    </div>
  {% else %}
    {% unless article.tags == empty %}
      <div class="tags">
        <nav class="menu-tags">
          <ul class="menu">
            {% for tag in article.tags %}
              <li class="menu-item"><a class="menu-link" href="{{ site.url }}{{ site.blogs.first.page.path }}/tagged/{{ tag.path }}">{{ tag.name }}</a></li>
            {% endfor %}
          </ul>
        </nav>
      </div>
    {% endunless %}
  {% endif %}
