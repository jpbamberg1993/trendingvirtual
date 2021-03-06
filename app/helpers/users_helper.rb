module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(email)
    gravatar_id = Digest::MD5::hexdigest(email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: email, class: "gravatar img-responsive")
  end
end
