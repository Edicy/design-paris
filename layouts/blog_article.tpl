<!DOCTYPE html>
<html lang="{{ page.language_code }}">>
<head>
  {% include "SiteHeader" %}
  {{ blog.rss_link }}
</head>
<body>
  {% include "Header" %}
  
  <div class="main-content main-division">
    <div class="content-center-wrapper">
      
      {% include "Mainmenu" %}
      
      <div class="hidden js-thumb-data" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
      
      <div class="content-texts cfx">
        
        {% if editmode %}
          <div class="thumb-editor-wrapper left">
            <div class="delete-btn"><span class="edy-ico edy-ico-close"></span></div>
            <div class="thumb-editor js-thumb-editor">
              <span class="thumb-placeholder">
                Drag cover image for this post here.
              </span>
            </div>
            <span class="thumb-additional-info">
              Drag image to adjust crop area.
            </span>
          </div>
        {% endif %}
        
        <div class="content-texts-wrapper{% if editmode %} right{% endif %}">
          <h1>
            {% editable article.title %}
            <span class="heading-info">
              {{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}{% comment %}, {{ article.author.name }}{% endcomment %}
            </span>
          </h1>
          <div data-search-indexing-allowed="true">{% editable article.body %}</div>
          
          
          
          {% unless article.new_record? %}
            {% content name="blogarticle_more_content" bind="Article" %}
          {% endunless %}
          
          {% if editmode %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% editable article.tags %}
            </div>
          {% else %}
            {% unless article.tags == empty %}
                <div class="cfx article-tags">
                    <div class="article-tag-icon"></div>
                    {% for tag in article.tags %}
                        <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </div>
            {% endunless %}
        {% endif %}
          
          {% unless article.new_record? %}
            {% include "Article comments" %}
          {% endunless %}
          
          

        </div><!-- .right -->
      </div><!-- .content-texts -->
      
    </div><!-- .content-center-wrapper -->
  </div><!-- .main-content -->
  
  {% include "Footer" %}
  {% include "JS" %}
  
  {% comment %}
    Image dropper tool initiation.
    Uses hidden article.excerpt to save image data accessible for article listing
  {% endcomment %}
  {% if editmode %}
    <script type="text/javascript" src="{{ javascripts_path }}/article_imgdrop.js?1"></script>
  {% endif %}
  
</body>
</html>