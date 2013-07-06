include NewsHelper

require 'open-uri'
require 'time'

class NewsController < ApplicationController
  def index
    @lang = (params[:lang] == "mrtn") ? "mrtn" : "en"

    @nytimes_base_url = "http://nytimes.com"

    json_object = JSON.parse(open("http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion2.js").read)

    @articles = []
    json_object["page"]["content"].each do | json_content |
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
  end

end
