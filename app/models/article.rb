class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  has_one :legacy_article

  def archive
    update(archived_at: Time.now)
  end
end
