# encoding: utf-8

module Nanoc3::Helpers

   module Series

      # возвращает неотсортированный список серий, 
      # т.е. элементов, для которых установлен шаблон 'series'.
       
      def series
      
         @items.select { |s| s[:layout] == 'series' }
         
      end

      # возвращает отсортированный список серий, 
      # т.е. элементов, для которых установлен шаблон 'series'. 
      # Серии сортируются по убыванию даты покупки.
    
      def sorted_series
      
         series.sort_by do |s|
            sc = sorted_coins_from_series(s).first
            
            if sc && sc[:date_of_purchase] 
               attribute_to_time(sc[:date_of_purchase]) 
            else
               Time.at(0)
            end
         end.reverse
         
      end
      
      # возвращает соответствующее склонение для количества серий.
      # алгоритм придуман не мной.

      def tail_series

         n = series.size

         tails = Array[ "серия монет", "серии монет", "серий монет" ]
         cases = Array[ 2, 0, 1, 1, 1, 2 ]
         
         tails[ (n % 100 > 4 && n % 100 < 20) ? 2 : cases[Array[n % 10, 5].min] ]

      end
      
   end
end
