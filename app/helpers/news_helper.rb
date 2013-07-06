module NewsHelper

  def extract_articles(json_feed)
    @articles = []
    json_feed["page"]["content"].each do | json_content |
      json_content["collections"].each do | json_collection |
        json_collection["assets"].each do | json_asset |
          if json_asset["type"] == "Article" and json_asset["typeOfMaterial"] == "News"
            @article = Article.new(:headline => localize_text(json_asset["headline"],@lang), :summary => localize_text(json_asset["summary"],@lang), :by_line => localize_text(json_asset["byline"],@lang))
            @article.last_published = Time.parse(json_asset["lastPublished"])
            json_asset["images"].each do | image |
              image["types"].each do | image_type |
                if image_type["type"] == "thumb" or image_type["type"]  == "thumbStandard"
                  @article.thumb_src = image_type["content"]
                  @article.thumb_width = image_type["width"]
                  @article.thumb_height = image_type["height"]
                end
                if image_type["type"]  == "wide" or image_type["type"]  == "thumbWide"
                  @article.thumb_wide_src = image_type["content"]
                  @article.thumb_wide_width = image_type["width"]
                  @article.thumb_wide_height = image_type["height"]
                end
              end
            end
            @articles << @article
          end
        end
      end
    end
    @articles
  end

  def localize_text(text,lang)
    @BOINGA = ["b","o","i","n","g","a"]

    @result_text = ""
    if (lang == "mrtn")
      @result_text = text.gsub(/(?:\w{4,}|[\$\@()+.])+/) do | word |
        @res = ""
        @chars = word.split("")
        for i in 0..5
          if @chars[i].nil? or @chars[i] == @chars[i].downcase
            @res += @BOINGA[i]
          else
            @res += @BOINGA[i].upcase
          end
        end
        @res
      end
    else
      @result_text = text
    end
    @result_text
  end

end
