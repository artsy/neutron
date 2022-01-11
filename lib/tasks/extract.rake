task :extract, [:article_url] => :environment do |t, args|
  starting_count = LegacyArticle.count

  url = args.article_url
  response = Faraday.get(url)
  data = response.body
  data.force_encoding("UTF-8")
  json = JSON.parse(data)
  puts "JSON parsed"

  json.each do |data|
    LegacyArticle.create_if_new(data)
    print "."
  end

  created_count = LegacyArticle.count - starting_count

  puts "\n all done!"
  puts "created #{created_count} LegacyArticle records"
end
