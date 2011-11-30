module Nanoc3::Helpers

   module Series

      #
      # склонение для количества серий
      #

      def tail_series

         number = @site.articles.size

         tails = Array[ "серия монет", "серии монет", "серий монет" ]
         cases = Array[ 2, 0, 1, 1, 1, 2 ]
         
         tails[ (number % 100 > 4 && number % 100 < 20) ? 2 : cases[Array[number % 10, 5].min] ]

      end

      # возвращает численное значение количества монет в коллекции. 
      # определение происходит по полю 'дата покупки' в файле *.yaml
      # fixme: на данный момент определение происходит по полю 'дата выпуска'

      def number_of_coins

         number = 0
         init_dir = "content/series/"
         
         files = Dir.entries(init_dir)

         # перебор каталогов серий
         files[2..files.size].each do |file|
            dir = init_dir + file + '/'

            if FileTest.directory?(dir)
               
               # перебор возможных файлов монет
               coins = Dir.entries(dir)

               coins[2..coins.size].each do |coin|
                  if FileTest.file?(dir + coin) and coin.downcase.include?('.yaml')
                     
                     # загрузка файла *.yaml
                     f = File.new(dir + coin)
                     coin_data = YAML.load(f)
                     f.close
                     
                     # признак присутствия в коллекции — поле 'дата выпуска' (fixme: должно быть 'дата покупки')
                     number += 1 if coin_data['date_of_issue']

                  end
               end

            end
         end

         number

      end

      #
      # склонение для количества монет
      #

      def tail_coins

         number = number_of_coins

         tails = Array[ "монета", "монеты", "монет" ]
         cases = Array[ 2, 0, 1, 1, 1, 2 ]
         
         tails[ (number % 100 > 4 && number % 100 < 20) ? 2 : cases[Array[number % 10, 5].min] ]

      end
      
   end
end
