# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# ----

class Article
  constructor: (@headline,@summary) ->
    @thumb_src = ""
    @thumb_width = 0
    @thumb_height = 0
    @thumb_wide_src = ""
    @thumb_wide_width = 0
    @thumb_wide_height = 0

# ----

# NYTD Module for json callback
@NYTD = {}
@NYTD.render_section_front = (data) ->
  @articles = []
  for content in data.page.content
    for collection in content.collections
      for asset in collection.assets
        if asset.type == "Article" and asset.typeOfMaterial == "News"
          @article = new Article(asset.headline,asset.summary)
          @articles.push @article
          for image in asset.images
            for image_type in image.types
              if image_type.type == "thumb" or image_type.type  == "thumbStandard"
                @article.thumb_src = image_type.content
                @article.thumb_width = image_type.width
                @article.thumb_height = image_type.height
              if image_type.type  == "wide" or image_type.type  == "thumbWide"
                @article.thumb_wide_src = image_type.content
                @article.thumb_wide_width = image_type.width
                @article.thumb_wide_height = image_type.height

  $("#container > .article").last().after JST["templates/articles"](articles : @articles)

# ----

$(document).ready () ->

  @nyregion_url = 'http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion.js?jsonpCallback=?';

  $(".load-more").click (event) =>
    event.preventDefault()
    console.log(@nyregion_url)

    $.ajax 'http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion.js?jsonpCallback=?',
      type: 'GET',
      async: false,
      contentType: "application/json",
      dataType: 'jsonp',
      context: @,
      success: (json) ->
        console.dir(json)
      error: (e) ->
        console.log(e)


