class Image
    
    def initialize(picture)
       @image = picture 
       @ones = []
    end
     
    def find_pixels
        @image.each_with_index do |row,arrindex|
            row.each_with_index do |number,numindex|
                if number == 1
                    @ones << [arrindex, numindex]
                end
            end
        end 
    end
    
    def blur(distance) 
      distance.times do 
        
        find_pixels
        
        @ones.each do |coordinates|
            #(arrindex, numindex+1) right   
          if coordinates.last+1 < @image.first.length
            @image[coordinates.first][coordinates.last+1] =1 
          end
            #(arrindex, numindex-1) left
          if coordinates.last > 0
            @image[coordinates.first][coordinates.last-1] =1
          end        
            #(arrindex-1, numindex) top
          if coordinates.first > 0
            @image[coordinates.first-1][coordinates.last] =1
          end
            #(arrindex+1, numindex) bottom
          if coordinates.first+1 <@image.length
            @image[coordinates.first+1][coordinates.last] =1
          end
        end
      end
    end
        

    def output_image
        @image.each do |row|
        puts row.join
        end
    end
end



image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
])
image.blur(4)
image.output_image


