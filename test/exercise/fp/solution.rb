module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sum = 0
        cnt = 0
        array.map do |val|
          next unless !val['country'].nil? && (val['country'].split(',').length > 1 &&
            !val['rating_kinopoisk'].nil? &&
            val['rating_kinopoisk'].to_f.positive?)

          sum += val['rating_kinopoisk'].to_f
          cnt += 1
        end

        sum / cnt
      end

      def chars_count(films, threshold)
        films.reduce(0) do |sum, val|
          if !val['name'].nil? && !val['rating_kinopoisk'].nil? &&
             val['rating_kinopoisk'].to_f >= threshold
            sum + val['name'].count('и')
          else
            sum
          end
        end
      end
    end
  end
end
