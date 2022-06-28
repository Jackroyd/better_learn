module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["Learn Better - Learn more, faster, better."]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["Simple smart flashcards that help you learn more, faster, better."]
  end

  def meta_image
    (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["Learn Better"])
    # little twist to make it work equally with an asset or a url
    # meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
