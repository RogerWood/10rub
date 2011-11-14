module Nanoc3::Helpers

   module Series
      
      # количество серий монет
      def number_of_series

         # директории . и .. заранее необходимо убрать
         number = -2
         init_dir = "content/series/"

         files = Dir.entries(init_dir)
         
         files.each do |file|
            number += 1 if FileTest.directory?(init_dir + file)
         end

         number

      end

      # склонение для количества серий
      def tail_series

         number = number_of_series

         tails = Array[ "серия монет", "серии монет", "серий монет" ]
         cases = Array[ 2, 0, 1, 1, 1, 2 ]
         
         tails[ (number % 100 > 4 && number % 100 < 20) ? 2 : cases[Array[number % 10, 5].min] ]

      end
      
   end
end