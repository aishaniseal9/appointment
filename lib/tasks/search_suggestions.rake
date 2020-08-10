namespace :search_suggestions do
  desc "Generate search suggestions from tests"
  task :index => :environment do
    SearchSuggestion.index_tests
  end
end