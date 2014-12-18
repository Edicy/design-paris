{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    // VARIABLES FOR THE CUSTOM DATA.
    {% if edicy-tools == "article" %}
      // Article pages custom data variable.
      var articleData = new Edicy.CustomData({
        type: 'article',
        id: '{{ article.id }}'
      });
    {% else %}
      // Article pages custom data variable.
      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });
    {% endif %}

    // BODY BACKGROUND PICKER LOGIC.
    var bodyBg = new Edicy.BgPicker($('.js-body-background-settings'), {
      picture: true,
      target_width: 600,
      color: true,
      showAlpha: true,

      // Body background image and color preview logic (runs after changing the background image or color).
      preview: function(data) {
        // Returns the suitable version of the image depending on the viewport width.
        var getImageByWidth = function(sizes, targetWidth) {
          var prevImage;

          for (var i = 0, max = sizes.length; i < max; i++) {
            if (sizes[i].width < targetWidth) {
              return prevImage || sizes[i];
            }
            prevImage = sizes[i];
          }
          // Makes sure that smallest is returned if all images bigger than targetWidth.
          return sizes[sizes.length - 1];
        };

        // Defines the suitable image based on the viewport width.
        var suitableImage = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : 'none';

        var bodyBgImage = (data.image && data.image !== '') ? 'url(' + suitableImage.url + ')' : 'none',
            bodyBgColor = (data.color && data.color !== '') ? data.color : 'transparent',
            bodyBgColorOpacity = (data.colorData && data.colorData !== '') ? data.colorData.a : 'none',
            bodyBgColorLightness = (data.colorData && data.colorData !== '' && data.colorData.lightness) ? data.colorData.lightness : 'none';

        // Removes the current lightness class.
        $('.js-background-type').removeClass('light-background dark-background');
        // Checks the opacity of the body background color and sets the lightness class depending on it's value.
        if (bodyBgColorOpacity >= 0.2) {
          $('.js-background-type').addClass(bodyBgColorLightness >= 0.5 ? 'light-background' : 'dark-background');
        } else {
          $('.js-background-type').addClass('light-background');
        };

        // Checks the precence of the background image and toggles the footer's gradient.
        if (data.image === null || data.image === '') {
          $('.js-footer').removeClass('footer-gradient');
        } else {
          $('.js-footer').addClass('footer-gradient');
        }

        // Updates the body background image.
        $('.js-body-background-image').css({'background-image' : bodyBgImage});

        // Updates the body background color.
        $('.js-body-background-color').css({'background-color' : bodyBgColor});
      },

      // Body background image and color save logic (runs after closing the background picker).
      commit: function(data) {
        // Defines data for saving - image and color or their fallbacks.
        var commitData = $.extend(true, {}, data);
        commitData.image = data.image || '';
        commitData.imageSizes = data.imageSizes || '';
        commitData.color = data.color || 'transparent';
        commitData.colorData = data.colorData || 'none';

        // Saves the background data to custom data.
        {% if edicy-tools == "article" %}
          // Saves background image and color data for article pages.
          Edicy.articles.currentArticle.setData("body_bg", commitData);
        {% else %}
          // Saves background image and color data for common pages.
          pageData.set("body_bg", commitData);
        {% endif %}
      }
    });

    // Article background image save logic
    {% if edicy-tools == "article" %}
      var pictureDropArea = new Edicy.ImgDropArea($('.js-post-cover-inner'), {
        positionable: true,

        change: function(data) {
          Edicy.articles.currentArticle.setData({
            'post_image': data
          });
        }
      });
    {% endif %}
  </script>
{% endeditorjsblock %}
