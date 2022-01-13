task transform: :environment do
  article_ids_to_transform = LegacyArticle.where(transformed_at: nil).pluck(:id)
  puts "Count of ids to transform: #{article_ids_to_transform.count}"

  article_ids_to_transform.each do |legacy_article_id|
    ArticleTransformer.run(legacy_article_id)
    print "."
  end
end
