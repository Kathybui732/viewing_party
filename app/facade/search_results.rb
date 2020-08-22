class SearchResults
  def self.movies(params)
    return nil if params.nil?

    params == 'top rated' ? top_rated_movies : find_movies_by_title(params)
  end

  def self.find_movies_by_title(keyword)
    movie_title_search_results = service_movie_data.find_movies_by_title(keyword)
    return nil if movie_title_search_results.nil?

    movie_title_search_results.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.top_rated_movies
    top_movies = service_movie_data.top_rated_movies
    return nil if top_movies.nil?

    top_movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.service_movie_data
    TheMoviesDataBaseService.new
  end
end