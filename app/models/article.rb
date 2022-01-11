class Article < ApplicationRecord
  def archive
    update(archived_at: Time.now)
  end
end
