module ApplicationHelper
  def list_this val
    list = val.split(',')
    content_tag :ul do
        list.collect { |item| concat( content_tag(:li, item) ) }
    end
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def active? c, a
    controller_name == c && params[:action] == a ? 'current' : 'none'
  end

  def markdown(text)
    render_options = {
      filter_html:     false,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow' }
    }
    renderer = HTML.new(render_options)

    extensions = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  def count_imgs text
    text.to_s.scan(/\<img src=\"(.+)">/).size
  end

  def project_index?
    params[:controller] == "projects" && controller.action_name.to_s == "index"
  end

  class HTML < Redcarpet::Render::HTML
    # to use Rouge with Redcarpet
    include Rouge::Plugins::Redcarpet
    # overriding Redcarpet method
    # github.com/vmg/redcarpet/blob/master/lib/redcarpet/render_man.rb#L9
    def block_code(code, language)
      # highlight some code with a given language lexer
      # and formatter: html or terminal256
      # and block if you want to stream chunks
      # github.com/jayferd/rouge/blob/master/lib/rouge.rb#L17
      Rouge.highlight(code, language || 'text', 'html')
      # watch out you need to provide 'text' as a default,
      # because when you not provide language in Markdown
      # you will get error: <RuntimeError: unknown lexer >
    end
  end
end
