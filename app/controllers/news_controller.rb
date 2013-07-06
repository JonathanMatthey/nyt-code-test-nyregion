include NewsHelper

require 'open-uri'
require 'time'

class NewsController < ApplicationController

  def index
    @lang = (params[:lang] == "mrtn") ? "mrtn" : "en"

    @nytimes_base_url = "http://nytimes.com"

    json_feed = JSON.parse(open("http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion2.js").read)

    extract_articles(json_feed) # returns @articles array
  end

  def load_more_articles

    @nytimes_base_url = "http://nytimes.com"

    json_feed = JSON.parse(open("http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion2.js").read)

    @articles = extract_articles(json_feed)
    render :partial => "articles"

  end

end
