class LegacyArticle < ApplicationRecord
  def self.create_if_new(data)
    positron_id = data.dig("_id", "$oid")
    return if LegacyArticle.where(positron_id: positron_id).any?

    LegacyArticle.create(data: data, positron_id: positron_id)
  end
end
