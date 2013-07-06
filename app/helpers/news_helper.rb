module NewsHelper
  def localize_text(text,lang)
    if (lang == "mrtn")
      text.gsub(/(?:\w{4,}|[\$\@()+.])+/,'boinga')
    else
      text
    end
  end
end
