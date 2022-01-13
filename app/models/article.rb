class Article < ApplicationRecord
  has_one :legacy_article

  def archive
    update(archived_at: Time.now)
  end
end
