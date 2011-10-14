module Nanoc3::Helpers

   module BreadcrumbsTitle
      
      # склеивание названий разделов в одно
      def breadcrumbs_title
         res = ''
         
         breadcrumbs_trail.reverse_each do |b|
            if b
               res += b[:head_title]
               res += ' :: ' if b != breadcrumbs_trail.first
            end
         end 
         
         res
      end
      
   end
end
