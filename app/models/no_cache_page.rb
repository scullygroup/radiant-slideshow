class NoCachePage < Page
  def cache?
    false
  end
end